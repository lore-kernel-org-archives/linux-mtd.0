Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CoRTL-0002QP-Ja
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 14:14:32 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2005011114142813278
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jan 2005 14:14:28 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351813B6@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Tue, 11 Jan 2005 14:14:26 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: JFFS2 howto question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

  Is the information in jffs how to still correct.  I have created my jffs2
image.  I have my DOC device with partitions mtd0, mtd1 BDL, mtd2 BDTL.
Questions 1.  Should I use flash_eraseall /dev/mtd2 to erase doc 2.  Should
I use nandwrite or cp to write the image and I assume it is written to
mtd2/mtdblockc device.  I have tried to write my image with no luck.  I can
get an ext3 file system on it but I know this isn't the right choice for my
device.

Thanks,
John
