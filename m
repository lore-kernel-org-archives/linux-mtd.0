Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G65OX-0004NE-Dq
	for linux-mtd@lists.infradead.org; Thu, 27 Jul 2006 08:55:21 -0400
Message-ID: <44C8B789.4030505@yandex.ru>
Date: Thu, 27 Jul 2006 16:54:33 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	'Marteo Tim' <tim.marteo@gmail.com>
Subject: Re: how to use jff2 on UBI layer?
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>
	<20060724114007.GB20849@wohnheim.fh-wedel.de>
In-Reply-To: <20060724114007.GB20849@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tim, Joern,

I've made JFFS2 be able to mount UBI volumes directly, without gluebi.

Now you can do the folliwing:

1. mount -t jffs2 ubiX_Y mnt/   --   mount UBI device number <X>, volume 
<Y>;
2. mount -t jffs2 ubiY mnt/   --   mount UBI device number 0, volume <Y>;
3. mount -t jffs2 ubiX:<name> mnt/   --   mount UBI device X, volume 
with name <name>;
4. mount -t jffs2 ubi:<name> mnt/   --   mount UBI device 0, volume with 
name <name>.

The patches are in ubi-2.6.git, please, try.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
