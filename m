Received: from web50306.mail.yahoo.com ([206.190.38.60])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Ct3Hl-0000i0-KV
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2005 07:25:39 -0500
Message-ID: <20050124122536.808.qmail@web50306.mail.yahoo.com>
Date: Mon, 24 Jan 2005 04:25:36 -0800 (PST)
From: "Siddharth A. Trivedi" <sashhoney@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: UnitSizeFactor 0x00
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I m having a trouble with mtd driver
i m not having direct conn to internet, so i cant use CVS
now i want to download nftl_format utility
i m using kernel-2.4.24, and getting following message while booting

NFTL: nftlcore.c.......$ver xxx$..........nftlmount.c
NFTL: UnitSizeFactor is 0x00 which is not valid according to specs
nfta:nfta1


but i m unable to use /dev/nfta , while /dev/mtd0 is a valid device
$mke2fs /devnfta
no such device

i know i can use nftl_format for this but pls
tell me how to download mtd utilities without CVS



		
__________________________________ 
Do you Yahoo!? 
All your favorites on one personal page – Try My Yahoo!
http://my.yahoo.com 
