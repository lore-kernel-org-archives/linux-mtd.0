Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AALxN-0007sh-1M
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 05:11:17 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9H4AES23858
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 17:10:14 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9H4AES23852
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 17:10:14 +1300
Received: from tait.co.nz ([172.25.110.7])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HMV0099IVL0PM@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Fri, 17 Oct 2003 17:10:12 +1300 (NZDT)
Date: Fri, 17 Oct 2003 17:10:01 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
In-reply-to: <3F8F0DE1.9030207@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3F8F6B99.4050906@tait.co.nz>
MIME-version: 1.0
References: <3F8B814D.3050408@tait.co.nz>
 <1066111497.3172.37.camel@imladris.demon.co.uk> <3F8DBD52.1020100@tait.co.nz>
 <3F8F0DE1.9030207@tait.co.nz>
Content-type: multipart/mixed; boundary="Boundary_(ID_1Cqfd3481luNaJqSxkfiVw)"
Subject: Re: Mount of jffs2 partition fails
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--Boundary_(ID_1Cqfd3481luNaJqSxkfiVw)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

No more replies to myself - promise...
Patch below:-))

Robin Gilks wrote:
> 
> In a message from Stuart Menefy on (CFI fixup code ref:
> <20030523235020.3ca198e1.stuart.menefy@st.com>) on 24th May 2003, this 
> exact problem was highlighted and is due to the ST chip not supporting 
> the buffer write mode of the Intel CFI chips. I'll try applying Stuarts 
> patches to 2.4.22 stock kernel and see how I get on!!
> 
> I'm still working on why the lock/unlock is operating correctly (or 
> should I just unprotect the block that MTD is using in the bootstrap?)
> 

Looks like I was on the right lines - the fixups that Stuart introduced 
just didn't go far enough!! The m28w320cb also doesn't support buffer 
write (just like the m28w320ct doesn't) so a 2 line patch fixes it :-))

The bootloader is providing the correct unlock status of the flash over 
the partition I'm interested in so nearly all my errors have gone away. 
Just got to now work out why I get

kmod: failed to exec /sbin/modprobe -s -k cmdlinepart, errno = 2
cmdlinepart partition parsing not available
kmod: failed to exec /sbin/modprobe -s -k RedBoot, errno = 2
RedBoot partition parsing not available

at boot time when I have no modules defined in my system at all!!


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand

--Boundary_(ID_1Cqfd3481luNaJqSxkfiVw)
Content-type: text/plain; name=mtd-patch
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=mtd-patch

diff -purN /home/gilksr/mtd/drivers/mtd/chips/cfi_cmdset_0001.c /home/packages/mtd/drivers/mtd/chips/cfi_cmdset_0001.c
--- /home/gilksr/mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2003-08-12 10:00:05.000000000 +1200
+++ /home/packages/mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2003-10-17 16:53:47.000000000 +1300
@@ -147,6 +147,8 @@ static void fixup_st_m28w320cb(struct ma
 	/* Note this is done after the region info is endian swapped */
 	cfi->cfiq->EraseRegionInfo[1] =
 		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
+	cfi->cfiq->BufWriteTimeoutTyp = 0;	/* Not supported */
+	cfi->cfiq->BufWriteTimeoutMax = 0;	/* Not supported */
 };
 
 static struct cfi_fixup fixup_table[] = {

--Boundary_(ID_1Cqfd3481luNaJqSxkfiVw)--
