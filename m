Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4eFK-0001th-43
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 08:39:28 -0400
Message-ID: <43008CD5.1000006@yandex.ru>
Date: Mon, 15 Aug 2005 16:38:45 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
	<20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu>
In-Reply-To: <43008A7D.2060302@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
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

Ferenc Havasi wrote:
> I only say that for a user the size of the virtual erase block may not 
> be evident. They know about the real erase block size. Maybe we should 
> write a tool for calculating it.
Why not to just copy the algorithm from JFFS2 (it is in 
jffs2_do_fill_super())?

> 
> It is not too relevant problem without summary. For example if the erase 
> block size is 32K, and the virtual is 64K, and you generates JFFS2 
> image  for 32K it will work (maybe with some warning but will work). If 
> you generates summary for that image for 32K and use it on 64K virtual 
> erase block size that will not work.
I think, this is better if you solve this inconsistency in general.

And by the way, I don't understand, why do you need sumtool and 
sumtool2? Is sumtool3 coming ?

Why not to merge sumtoolX with mkfs.jffs2 and add more options?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
