Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPHzx-00059t-P8
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 06:41:10 -0500
Date: Fri, 31 Mar 2006 13:40:49 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20060331114049.GH14713@wohnheim.fh-wedel.de>
References: <1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1143800324.3579.87.camel@sauron.oktetlabs.ru>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 March 2006 14:18:44 +0400, Artem B. Bityutskiy wrote:
> 
> It looks at mtd->type, finds out the type, and it knows what features
> must be there. No flash-specific features are available in mtd_info. It
> only contains generic stuff. For example, mtd_info should not even
> contain the OOB-handling stuff. If you want to work with OOB then your
> application is NAND-bound. Then you look at mtd->type, see this is NAND,
> and happily start working with NAND subsystem of MTD.
> 
> Note, what I'm saying is far from the current things, again, I'm saying
> how things should look like in my oppinion.

Right now, we have code like

#define jffs2_can_mark_obsolete(c) ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & MTD_ECC)) || c->mtd->type == MTD_RAM)

I guess we can both agree that it is far from optimal.  And my take
would be to replace it with

#define jffs2_can_mark_obsolete(c) (c->mtd->flags & MTD_CAN_MARK_OBSOLETE)

Note that mtd->type has gone.

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
