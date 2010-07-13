Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYbFO-0001Z0-VN
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 08:53:52 +0000
Subject: Re: UBIFS failed to recover master node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: re <re.wirth@web.de>
In-Reply-To: <4C285B76.5010108@web.de>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763982.2106.2.camel@localhost>  <4C285B76.5010108@web.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 11:48:43 +0300
Message-ID: <1279010923.31639.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, twebb <taliaferro62@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

On Mon, 2010-06-28 at 10:21 +0200, re wrote:
> Am 25.05.2010 07:06, schrieb Artem Bityutskiy:
> > On Mon, 2010-05-24 at 11:22 -0400, twebb wrote:
> >> I've had several cases where our MLC NAND flash appears corrupted in
> >> such a way that one of three UBIFS volumes can not be mounted due to
> >> "failed to recover master node".  I haven't been able to reproduce the
> >> problem, but we've had at least 5 incidents where this has occurred.
> >> (A partial capture from one of the failures is below.)
> >>
> >> I'm starting to investigate this problem and don't know if this is a
> >> UBIFS/UBI problem or a NAND driver problem.  I'm starting the process
> >> of back-porting the latest UBIFS code to our 2.6.29 kernel - hoping
> >> that new UBIFS code will solve the problem.  However, this may also be
> >> a driver problem and I wonder if I also need to update that driver
> >> (pxa3xx_nand).  Any suggestions for debugging this problem?
> >>
> >> Thanks,
> >> twebb
> >>
> >>
> >> capture:
> >> [root@ESIedge mtd-utils]# mount -t ubifs ubi0_0 /mnt/
> >> [  239.605869] UBI error: ubi_io_read: error -74 while reading 516096
> >> bytes from PEB 4:8192, read 516096 bytes
> >> [  239.616317] UBIFS error (pid 676): ubifs_scan: corrupt empty space
> >> at LEB 2:268135
> >> [  239.623996] UBIFS error (pid 676): ubifs_scanned_corruption:
> >> corruption at LEB 2:268135
> >> [  239.642101] UBIFS error (pid 676): ubifs_scan: LEB 2 scanning failed
> >> [  239.976396] UBI error: ubi_io_read: error -74 while reading 516096
> >> bytes from PEB 4:8192, read 516096 bytes
> >> [  239.986742] UBIFS error (pid 676): ubifs_recover_master_node:
> >> failed to recover master node
> >> mount: mounting ubi0_0 on /mnt/ failed: Invalid argument
> > And BTW, it is a good idea not to erase/re-flash this device if you want
> > to fix this problem.
> >
> Our power off tests causes this sporadic error too  (ubifs_recover_master_node: failed
> to recover master node).
> We use kernel 2.6.29 with the git-patch (from 3/2010) for 47MB NOR flash partition.
> 
> I tried to find with debugging  the error reason.
> The recover of the master_node reads the master_node1 and master_node2.
> The master_node1 was emty.
> The error was detected in:
> int ubifs_recover_master_node(struct ubifs_info *c)
>     ....
>     if (mst1) {
>        ......
>     } else {
>         if (!mst2)
>             goto out_err;          
>         /* 1st LEB was unmapped and about to be written, so there must
>          * be no room left in 2nd LEB.         */
>         offs2 = (void *)mst2 - buf2;
>         if (offs2 + sz + sz <= c->leb_size)
>             goto out_err;                               !!!!!!!!!!!!!!!!!!!
>         mst = mst2;
>     }
> I checked the values of the compare "if (115712 + 512 +512  (=116736) <= 130944)".
> I skipped this error for test purpose. The master_node was recovered. I saw no problems
> with the FS. I was not able to follow this check.

But how this situation could happen? UBIFS updates the master nodes by
writing them one-after-another, till there is space to write. And when
thee there is no space, it unmaps the 1st LEB, writes the master node,
then unmaps the 2nd LEB, and writes the master node.

How could we end-up with a situation when the 1st LEB is empty, while
the 2nd has room for more master nodes? This sounds like the problem is
somewhere else, may be in UBI? Do you have any explanation?

I mean, the only code-path which changes the master nodes in UBIFS is
'ubifs_write_master()'. If this function is the only one which, your
situation cannot happen.

Did you try to enable recovery debugging messages? Did you look what is
in your LEB2 after 'offs2' ? Are there 0xFFs? I think if you enable
recover debugging, UBIFS will print a hexdump? Or you can just inject
some 'dbg_dump_node()' or 'print_hex_dump()' calls.

I mean, if you just remove that check, you may hide the real problem.

> I was able to provoke this error manual.

Well, yes, you break UBIFS assumptions about which kind of errors it
fixes. As I answered in another e-mail today to twebb - UBIFS fixes only
problems caused by power-cuts. If it sees a problem which cannot happen
because of a power-cut, it panics. So, as I explain above, your issue
should not happen due to power cuts. But it happens, which means there
is probably a bug somewhere else.

Reproducing the problem and dumping the flash contents in the end of
LEB2 would be interesting.

Here you can find some notes about debugging UBIFS:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
