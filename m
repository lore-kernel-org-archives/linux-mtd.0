Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E4xW5-0005aw-9Z
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 10:13:54 +0100
Message-ID: <4301AE32.1040701@inf.u-szeged.hu>
Date: Tue, 16 Aug 2005 11:13:22 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <42E5ECE5.4010901@inf.u-szeged.hu>	<20050726093215.GD15903@wohnheim.fh-wedel.de>	<20050726100330.GF15903@wohnheim.fh-wedel.de>	<42EDF04C.1010108@inf.u-szeged.hu>	<20050801095645.GA32464@wohnheim.fh-wedel.de>	<42EDF470.4060208@inf.u-szeged.hu>	<20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>	<20050815094816.GA27229@wohnheim.fh-wedel.de>	<43007773.2070602@yandex.ru>	<43008129.2060303@inf.u-szeged.hu>	<43008BFB.502@yandex.ru>
	<4300970E.2090803@inf.u-szeged.hu> <43009AE1.6010907@yandex.ru>
	<4301A259.3090304@yandex.ru>
In-Reply-To: <4301A259.3090304@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhao_fusheng@hotmail.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 eraseblock header
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:

> 2. New JFFS2, when mounting an old JFFS2 binary, will use old 
> algorithms (1:M mappings, clean markers).


I think if we do this change it would be better to forget old JFFS2 
binaries. If not that makes things even more complicated.

To make old images usable we can write a small user space converter tool.

Ferenc
