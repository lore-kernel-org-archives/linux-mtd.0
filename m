Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E4f0C-000369-Ei
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 09:27:51 -0400
Message-ID: <43009852.1000203@inf.u-szeged.hu>
Date: Mon, 15 Aug 2005 15:27:46 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
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
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
In-Reply-To: <43008CD5.1000006@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Artem B. Bityuckiy wrote:

>> It is not too relevant problem without summary. For example if the 
>> erase block size is 32K, and the virtual is 64K, and you generates 
>> JFFS2 image  for 32K it will work (maybe with some warning but will 
>> work). If you generates summary for that image for 32K and use it on 
>> 64K virtual erase block size that will not work.
>
> I think, this is better if you solve this inconsistency in general.
>
I agree. We should find out how.

> And by the way, I don't understand, why do you need sumtool and 
> sumtool2? Is sumtool3 coming ?
>
It is an old stuff. Sumtool was the part of JFFS3, and sumtool2 was an 
additional stuff for JFFS2. Now, we will delete sumtool, and rename 
sumtool2 to sumtool.

> Why not to merge sumtoolX with mkfs.jffs2 and add more options?

We did not wanted to make the code of mkfs.jffs2 more complex. I think 
it is cleaner to do it in a seperate tool.

Ferenc
