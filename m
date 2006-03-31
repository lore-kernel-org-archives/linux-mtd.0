Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPGir-00044M-DK
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 05:19:27 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060331100709.GD14713@wohnheim.fh-wedel.de>
References: <442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com>
	<442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 31 Mar 2006 14:18:44 +0400
Message-Id: <1143800324.3579.87.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-03-31 at 12:07 +0200, Jörn Engel wrote:
> I take it that mtd->type is not exported to userspace yet.  Which is
> good, because imho it shouldn't be.  Flash should me a step towards a
> standard interface, something that hard disk have had for years.
> Knowing every little detail about every single flash chip bears more
> harm than good.

Again, imagine mtd->type is the only flash-specific field in mtd_info.
You work with any flash the same way. But if you still want to do some
flash-specific things, you look at mtd->type, determine which kind of
flash is this, then work with the flash-specific subsystem.

> And as far as in-kernel users are concerned, JFFS2 is the only one
> that really matters.  For JFFS2, my previous statement still stand
> that it should base decisions on the existence of a feature, not a
> type.

It looks at mtd->type, finds out the type, and it knows what features
must be there. No flash-specific features are available in mtd_info. It
only contains generic stuff. For example, mtd_info should not even
contain the OOB-handling stuff. If you want to work with OOB then your
application is NAND-bound. Then you look at mtd->type, see this is NAND,
and happily start working with NAND subsystem of MTD.

Note, what I'm saying is far from the current things, again, I'm saying
how things should look like in my oppinion.


> You could still have flash types, but merely as aggregates of
> features, nothing else.  For example, NAND flash could have
> FEATURE_OOB, FEATURE_WBUF, FEATURE_ECC etc.  Which of these feature
> make sense and are really needed is another matter, but you should get
> the idea.

Decomposition on features is not very nice IMO. It is better to specify
type. Each type has its own set of features. It is too difficult to
recognize all features, classify them nicely and put into mtd_info.
Features go and come, the change.

There may be some feature-bound decomposition, but in parallel to the
decomposition by type, which is the main and more natural decomposition.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
