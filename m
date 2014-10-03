Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa4Zt-000078-Mo
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 15:15:30 +0000
Message-ID: <1412349293.3795.91.camel@sauron.fi.intel.com>
Subject: Re: UBI: Question about error checking in ubi_eba_write_leb()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: steve <steve@baconbits.demon.co.uk>
Date: Fri, 03 Oct 2014 18:14:53 +0300
In-Reply-To: <alpine.DEB.2.02.1409301158370.2556@ubuntu>
References: <alpine.DEB.2.02.1409301158370.2556@ubuntu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-09-30 at 12:00 +0100, steve wrote:
> This is my first post to this mailing list, I think this is the right place for
>   my question.
> 
> I think the error checking in ubi_eba_write_leb() may be wrong and may cause 
> incorrect behaviour when extra checking is enabled in debugfs, here's the 
> scenario I have a problem with:
> 
> ubi_eba_write_leb() calls  ubi_io_write_data() -> ubi_io_write() -> 
> ubi_dbg_check_all_ff()
> 
> ubi_dbg_check_all_ff() will perform an mtd_read() which can fail with EBADMSG 
> (if there is a failure to correct using ECC as in my case).

Yep, this is possible.

>  This error code 
> will bubble back up to ubi_eba_write_leb()

And the question is - is this the right thing to do? Original intention
was to catch I/O problems and report about them promptly by dumping the
information to the log and returning an error.

The error we return is -EINVAL exactly in because we did not want the
upper layers try to 'deal' with the problem. All we wanted to do is to
catch the problems.

> , but recover_peb() will only be 
> called if the error code was EIO.

Yeah, and we never meant the recover_peb() to actually try doing
anything about that.

>  The question is should recover_peb() be 
> called in this case as well?

Good question - this was not meant to be.

So see, you are now talking about the debugging code. It was written
basically to make developers' live simpler. This is just a tool to catch
bugs during the R&D.

So if during the R&D phase we see that the driver returns an "ECC
error" (-EBADMSG) when we read the data we just wrote - this is a
problem, and we _do not_ want to hide it by starting the recovery
mechanism - we want the write request to actually fail and the developer
to actually notice this.

The non-debug case is a completely different thing. Here we actually
would be interested to handle the issue transparently - move the data to
a different PEB, and mark the failing PEB as bad.

But the assumption is that the write() path never returns -EBADMSG. If a
driver internally does write-read-verify, we assume it should return
-EIO if there is an ECC error. But not -EBADMSG.

This is why we do not handle this error code in eba.c.

Now, what I see is that you are looking at some old code. In the new
code the function is named 'ubi_self_check_all_ff()', and if I read the
code correctly, it will return -EINVAL if mtd_read() returns -EBADMSG:


        err = mtd_read(ubi->mtd, addr, len, &read, buf);
        if (err && !mtd_is_bitflip(err)) {
                ubi_err("error %d while reading %d bytes from PEB %d:%d, read %zd bytes",
                        err, len, pnum, offset, read);
                goto error;
