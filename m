Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPIEA-0005fX-QN
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 06:55:51 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060331114049.GH14713@wohnheim.fh-wedel.de>
References: <1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 31 Mar 2006 15:55:10 +0400
Message-Id: <1143806110.3579.90.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-03-31 at 13:40 +0200, Jörn Engel wrote:
> Right now, we have code like
> 
> #define jffs2_can_mark_obsolete(c) ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & MTD_ECC)) || c->mtd->type == MTD_RAM)
> 
> I guess we can both agree that it is far from optimal.  And my take
> would be to replace it with
> 
> #define jffs2_can_mark_obsolete(c) (c->mtd->flags & MTD_CAN_MARK_OBSOLETE)
> 
Add an c->flags field to the per-JFFS2 structure. Initialize it on mount
properly. Then

#define jffs2_can_mark_obsolete(c) (c->flags & JFFS2_CAN_MARK_OBSOLETE)

Don't try to jam this to MTD please.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
