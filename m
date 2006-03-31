Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPJN5-00080H-3u
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 08:09:09 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060331125701.GL14713@wohnheim.fh-wedel.de>
References: <20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<20060331122055.GK14713@wohnheim.fh-wedel.de>
	<442D207D.9030903@yandex.ru>
	<20060331125701.GL14713@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 31 Mar 2006 17:08:25 +0400
Message-Id: <1143810505.3579.107.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-03-31 at 14:57 +0200, Jörn Engel wrote:
> Full agreement.
> 
> Only difference is that I would grind my teeth and accept a
> jffs2-specific flag in mtd, if the overall code is improved that way.
> Adding 10 lines of cruft to mtd and removing 50 lines of cruft from
> jffs2 would be a net win.
> 
> If someone smarter comes along and notices that the 10 lines of cruft
> can be removed from mtd without reintroducing 50 lines to jffs2, even
> better.  Just like you showed me to use "can flip bits" instead of
> "can mark obsolete".

Well, features could  be implemented as a separate unit in MTD. This
unit could do the following:

1. define set of features.
2. test if a particular feature is available in a particular MTD devise.

So we would just have:

#include <mtd/feature.h>

#define jffs2_can_mark_obsolete(c) \
	mtd_feature_available(c->mtd, MTD_FEATURE_CHANGE_BIT)

The "feature" module would make the right decision basing on mtd->type.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
