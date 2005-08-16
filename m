Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4xht-0004Ja-Vi
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 05:26:10 -0400
Message-ID: <4301B100.4050702@yandex.ru>
Date: Tue, 16 Aug 2005 13:25:20 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <42E5ECE5.4010901@inf.u-szeged.hu>	<20050726093215.GD15903@wohnheim.fh-wedel.de>	<20050726100330.GF15903@wohnheim.fh-wedel.de>	<42EDF04C.1010108@inf.u-szeged.hu>	<20050801095645.GA32464@wohnheim.fh-wedel.de>	<42EDF470.4060208@inf.u-szeged.hu>	<20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>	<20050815094816.GA27229@wohnheim.fh-wedel.de>	<43007773.2070602@yandex.ru>	<43008129.2060303@inf.u-szeged.hu>	<43008BFB.502@yandex.ru>
	<4300970E.2090803@inf.u-szeged.hu> <43009AE1.6010907@yandex.ru>
	<4301A259.3090304@yandex.ru> <4301AE32.1040701@inf.u-szeged.hu>
In-Reply-To: <4301AE32.1040701@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Ferenc Havasi wrote:
> I think if we do this change it would be better to forget old JFFS2 
> binaries. If not that makes things even more complicated.
Ugh, this is very much undesirable. And I hope it is not very difficult 
to support this. Just assume the version of old JFFS2 images = 1, and 
depending on the version, choose the algorithms... Let's at least try.

I would also like to hear David's coments...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
