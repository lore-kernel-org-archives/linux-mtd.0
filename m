Received: from mail-qy0-f129.google.com ([209.85.221.129])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGFVM-0005Zh-9J
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 17:30:17 +0000
Received: by qyk35 with SMTP id 35so114073qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Dec 2009 09:30:11 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 3 Dec 2009 12:30:11 -0500
Message-ID: <dbdb2ea60912030930ncd06dcfjbb149545728fa5d6@mail.gmail.com>
Subject: how to properly calculate max-leb-cnt and vol_size for ubifs
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using ubifs for the first time and am confused about how to
calculate two parameters:

"max-leb-cnt" for mkfs.ubifs
"vol_size" for ubinize cfg file

How should "max-leb-cnt" be calculated?  In the examples, how is "-c
2047" determined?  Should the max-leb-cnt calculation somehow include
the overhead calculated per the ubifs documentation page?  Should the
reserved PEBs (1% default for NAND flash) be somehow taken into
account?

How should "vol_size" be calculated?  Is it simply max-leb-cnt *
LEB_size?  Should overhead somehow be included in this calculation
also?

Thanks for the help,
twebb
