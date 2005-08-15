Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fBJ-0003ZM-SK
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 09:39:24 -0400
Message-ID: <43009AE1.6010907@yandex.ru>
Date: Mon, 15 Aug 2005 17:38:41 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <42E5ECE5.4010901@inf.u-szeged.hu>	<20050726093215.GD15903@wohnheim.fh-wedel.de>	<20050726100330.GF15903@wohnheim.fh-wedel.de>	<42EDF04C.1010108@inf.u-szeged.hu>	<20050801095645.GA32464@wohnheim.fh-wedel.de>	<42EDF470.4060208@inf.u-szeged.hu>	<20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>	<20050815094816.GA27229@wohnheim.fh-wedel.de>	<43007773.2070602@yandex.ru>	<43008129.2060303@inf.u-szeged.hu>
	<43008BFB.502@yandex.ru> <4300970E.2090803@inf.u-szeged.hu>
In-Reply-To: <4300970E.2090803@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhao_fusheng@hotmail.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, let's change JFFS2. I would prefer just alwayse assume 1:1 mapping 
and always use vmalloc in JFFS2 for c->blocks[] (no 128K limitation).

For compatimility, we need to be able to fallback to the old JFFS2 
algorithms.

And here we definitely must introduce the way to recognise versions of 
the image. We may introduce the version number to clean markers. We also 
must set INCOMPAT flag in clean markers to prevent new images to be 
mounted by old JFFS2s. New JFFS2s will mount the FS only if the version 
is <= then the current JFFS2 version. Something like this. Versioning 
will anyway be useful in future.

Moreover, Forrest is adding the trick to store the erase count at the 
beginning of each eraseblock. So, we may store this erasecount in clean 
markers as well. Then we may rename "clean marker" to "node header".

On NAND, clean marker is in OOB of the first page. As new cleanmarkers 
become larger, we may span them to the 2nd, the 3rd, etc OOBs.

Comments?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
