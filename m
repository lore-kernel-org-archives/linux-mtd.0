Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bx0Qh-0001eC-It
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2004 05:38:56 -0400
From: Ian Campbell <icampbell@arcom.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1092734138.3777.50.camel@imladris.demon.co.uk>
References: <1092731553.9001.18.camel@icampbell-debian>
	<1092734138.3777.50.camel@imladris.demon.co.uk>
Content-Type: text/plain
Message-Id: <1092735533.9001.48.camel@icampbell-debian>
Mime-Version: 1.0
Date: Tue, 17 Aug 2004 10:38:53 +0100
Content-Transfer-Encoding: 7bit
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: MTD patches
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

I noticed that you had to moderate this message due to a suspicious
header. Is this a false positive or can I do something to fix it? The
message didn't say which header.

On Tue, 2004-08-17 at 10:15, David Woodhouse wrote:
> On Tue, 2004-08-17 at 09:32 +0100, Ian Campbell wrote:
> > I've had a couple of patches to MTD sitting in my 2.6 tree for a while
> > now and wonder if you would consider including them.
> 
> Thanks for these.
> 
> > mtd-redboot-partition-fixes.patch
> > 
> >         This patch has two parts. 
> >         
> >         The first is to factor out the offset to look at for the RedBoot
> >         partition table into a variable. This has no impact on the code
> >         as is, but makes it easier and clearer for platforms that have
> >         the partition table at some other offset to wrap a #ifdef
> >         CONFIG_ARCH_ around the variable rather than introducing errors
> >         by cloning the whole master->read call.
> 
> Hmmm. Isn't this why we introduced an extra argument to the partition
> parsers in the first place? The map code should be able to pass a
> suitable argument, rather than having ifdefs in the parser code? Gary?

I had a solution based on this idea for a bit, but I didn't like it in
the end since mtd_parse_partitions only takes a single parameter which
is passed to all the partition modules you might be using (I have
command line then redboot in my setup). Hence it didn't seem to make
sense to pass a redboot partition table specific parameter to this
function.

> > mtd-add_full.patch
> >         
> >         This patch adds a new api call add_mtd_device_full() that allows
> >         a device to be added to a specific minor number (if it is
> >         available).
> 
> Hmm. I don't like this much -- if you want stable device naming that's
> what udev is for. I don't want to accept this before the equivalent for
> fixed numbering of SCSI or IDE drives is accepted upstream. :)

Fair enough, I will carry it as my own patch til I figure embedded udev
out.

> > mtd-jedec-probe-parts
> >         
> >         This patch adds a few new part numbers to jedec_probe.c. They
> >         are AMD AM29F002T, Hyundai HY29F002T and Macronix MX29FOO2T.
> 
> OK, please apply this -- you have CVS access don't you?

I don't believe I do, one of my colleagues here at Arcom does (David
Vrabel). I can ask him to commit this patch, or else I can send you
whatever you need to get an account setup for me, just a ssh public
key?.

I guess cvs.infradead.org is still IPv6 only, do you have any advice for
a tunnel to use that will work from within a corporate firewall, or on a
dynamic IPv4 cable modem address?

Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200
