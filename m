Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fFM-0003yC-Jh
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 09:43:55 -0400
Message-ID: <43009BDB.1040108@yandex.ru>
Date: Mon, 15 Aug 2005 17:42:51 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>	<20050815094816.GA27229@wohnheim.fh-wedel.de>	<43007773.2070602@yandex.ru>
	<43008129.2060303@inf.u-szeged.hu>	<20050815115943.GD27229@wohnheim.fh-wedel.de>	<43008A7D.2060302@inf.u-szeged.hu>
	<43008CD5.1000006@yandex.ru>	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu>
In-Reply-To: <430099D1.8000801@inf.u-szeged.hu>
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
> But If I am right we use kmalloc, and its limit is 128K. Why don't we 
> use vmalloc() instead there?
kmalloc'ed memory is faster... But I would just always use it and 1:1 
mapping...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
