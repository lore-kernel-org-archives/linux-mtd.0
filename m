Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gpX6-0003e2-G8
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2003 18:42:08 +0100
Mime-Version: 1.0
Message-Id: <a05200f10bb49bef98d0a@[130.161.115.44]>
In-Reply-To: <20030727172010.GX22218@fs.tum.de>
References: <20030727172010.GX22218@fs.tum.de>
Date: Sun, 27 Jul 2003 19:41:02 +0200
To: Adrian Bunk <bunk@fs.tum.de>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: linux-mtd@lists.infradead.org
cc: Marcelo Tosatti <marcelo@conectiva.com.br>
cc: dwmw2@redhat.com
Subject: Re: [2.4 patch] MTD Configure.help cleanups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 19:20 +0200 27-07-2003, Adrian Bunk wrote:
>+CONFIG_MTD_CFI_I8
>+  If your flash chips are interleaved in fours - i.e. you have eight
>+  flash chips addressed by each bus cycle, then say 'Y'.

s/fours/eights/ , surely ?

JDB.
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
