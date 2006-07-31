Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G7S6K-0005e5-8S
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 03:22:15 -0400
Message-ID: <44CDAF7D.4040300@yandex.ru>
Date: Mon, 31 Jul 2006 11:21:33 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: how to use jff2 on UBI layer?
References: <1152536472.6066.28.camel@localhost.localdomain>	
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>	
	<20060720094558.GA30897@wohnheim.fh-wedel.de>	
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>	
	<20060724114007.GB20849@wohnheim.fh-wedel.de>	
	<44C8B789.4030505@yandex.ru>
	<625fc13d0607301228y2bfd2c62q462c508d57a32043@mail.gmail.com>
In-Reply-To: <625fc13d0607301228y2bfd2c62q462c508d57a32043@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, haver@vnet.ibm.com,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	Marteo Tim <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> For what it's worth, I personally prefer the gluebi approach.  Or at
> least it's design.  I don't see why UBI cannot add_mtd_device for
> every volume that is found within the overall MTD given to it.

Just because it's strange from the design POV. UBI != MTD device 
semantically => any attempt to access UBI as MTD device is a dirty hack.

> It seems somewhat superfluous to add a generalized I/O layer to jffs2.
> It just doesn't sit right with me.

---------
I have nothing against gluebi as soon as:

1. It works. And AFAICS, we cannot make it all right *for months*.
2. It does not include a lot of stuff like:
	if (jffs2_is_ubi(c)) {doh()}
scattered across JFFS2. Instead, JFFS2 must have zero changes in case of 
gluebi.

Otherwise, gluebi makes no sense, IMO.

---------

"Something superfluous" are just some subjective words. The objective 
things are

1. JFFS2 just works with my patch over UBI: mount -t jffs2 ubi0 
/mnt/jffs2 - and you're happy. No need to create strange "fake" MTD devices.

2. There is no half-sane (from MTD's POW!) mtd->put_block() addition in 
my patch.

3. After all - I see nothing bad in this "superfluous" thing. It just 
adds better modularization. Moreover, now I can remove crap like

#ifdef __ECOS
mtd->point()
#endif

as well as eCos erasure.

just because I can implement eCos I/O in io.c.


-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
