Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgMxG-0006cP-Sk
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 07:48:04 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004122007484017845
	for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2004 07:48:40 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E7935181399@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Mon, 20 Dec 2004 07:47:49 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: Doc_loadbios fails?  Docboot?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to get Grub to load/work on a DOC2000 128Mbyte MD2202-D128x ver
5.1.2 dip.  This is one of the newer ones using INFTL technology.  The
doc_loadbios fails.  Nand_erase fails with error attempt to erase bad block
at page 0x00000000 ioctl(MEMERASE) Input/output error.  How can I get past
this error?  Has the doc_loadbios worked on these devices before?  Any
advice?  Should I just try to use docboot?  When using docboot I guess
everything must be built into the kernel since initrd image is not supported
(as the readme says it isn't).

Thanks,
John
