Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPF9v-0000zt-Dl
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 03:39:31 -0500
Message-ID: <442CEA8A.8030106@yandex.ru>
Date: Fri, 31 Mar 2006 12:38:34 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru> <442CE5AB.8030903@intel.com>
In-Reply-To: <442CE5AB.8030903@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>,
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

Alexander Belyakov wrote:
> In that case clients should be aware of using striped devices and 
> provide special support for them. The one of the ideas of the suggested 
> solution is to hide striping internals from the client providing generic 
> mtd device (just with somewhat increased performance).
False.

People don't have to look at mtd->type and may be happy. But if they do 
want to do some mtd type-specific things, they do look at mtd type, 
recognize what is this flash, and do the flash-specific things.

This does not work in case of NAND at the moment. Indeed, users have to 
use weird mtd->read_ecc() instead of just mtd->read(), etc. But this is 
long agreed as bad interface and will be fixed some time later. In future,

I believe, we'll have a common generic flash model, and a generic MTD 
interface. And everyone will be able to work with all flash types in the 
same generic way. Although if users will want to do some flash-specific 
things, they will look at mtd->type, and have a big switch doing 
whatever flash-specific actions are wanted.

MTD is currently rather far from this nice picture, but this is a 
question of time I believe.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
