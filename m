Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CdpOQ-0001w6-9w
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 07:33:35 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004121307340812620
	for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2004 07:34:08 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E793518138D@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 13 Dec 2004 07:33:34 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC 128 Mbyte, which boot loader?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,
 
  I have a DOC 128Mbyte DIP on a pc104 board.  I am running 2.4.28 kernel
with a recent patch from MTD site.  Modules loaded are DiskONChip, Inftl,
Mtdchar, Mtdblock.  I can access the chip, read and write to it.  I am
having problems booting from it.  I have Lilo-22.6.1 and Grub ver .95.  I
have not been able to get either of the boot loaders to work.  Looking at
Lilo and the patch I don't see inftl device support in it.  I am not sure do
I need to patch Lilo or Grub?  The patches in the patch directory are for
earlier versions of Lilo and Grub.  Could someone please advice on if I need
to patch these later versions???  I also read the info on using Grud with
DOC.  Is that info current?
 
Thanks,
John 
