Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4wlQ-00037Y-Kw
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 04:25:44 -0400
Message-ID: <4301A2E4.9090809@yandex.ru>
Date: Tue, 16 Aug 2005 12:25:08 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: joern@wohnheim.fh-wedel.de
References: <42E5ECE5.4010901@inf.u-szeged.hu>	<20050726093215.GD15903@wohnheim.fh-wedel.de>	<20050726100330.GF15903@wohnheim.fh-wedel.de>	<42EDF04C.1010108@inf.u-szeged.hu>	<20050801095645.GA32464@wohnheim.fh-wedel.de>	<42EDF470.4060208@inf.u-szeged.hu>	<20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>	<20050815094816.GA27229@wohnheim.fh-wedel.de>	<43007773.2070602@yandex.ru>	<43008129.2060303@inf.u-szeged.hu>	<43008BFB.502@yandex.ru>
	<4300970E.2090803@inf.u-szeged.hu> <43009AE1.6010907@yandex.ru>
	<4301A259.3090304@yandex.ru>
In-Reply-To: <4301A259.3090304@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
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
> 1. Get rid of clean marker and use eraseblock header instead (the 
> eraseblock header will play the role of cleanmarker).
Get rid if clean markers, not to add a new node, because anyway old 
JFFS2s must be incompatible with new images, so no need to have 2 
distinct nodes...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
