Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQ1Qr-0002RU-Lh
	for linux-mtd@lists.infradead.org; Sun, 02 Apr 2006 08:12:02 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0603311207160.14923@localhost.localdomain>
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
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603311207160.14923@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 02 Apr 2006 16:11:17 +0400
Message-Id: <1143979877.3579.187.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
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

On Fri, 2006-03-31 at 12:14 -0500, Nicolas Pitre wrote:
> What needs to be exported is a flash _capability_, not a flash type.

> We don't care a single whit if the flash is NOR or NAND or bufferedNOR 
> or any other bastardized type that will come up in the future.
(/me kindly reminds that this is a sort of "theoretical" conversation,
the current reality is different. And this is a bit out of striping
context even.)

My statement is: applications have the right to know (if they do really
want) which type of device (a striped thing, NAND, NOR, etc) the MTD
device represents. So, mtd_info has to provide this information anyway.
And mtd->type is an excellent field for this.

So, "We don't care a single whit if the flash is NOR or NAND or ...",
unless we really want to, right?

> What MTD users like JFFS2 or mtdchar needs to know is:
> 
>  - what is the minimum write size
> 
>  - what is the optimal write size
> 
>  - can individual bits be cleared
> 
>  - can individual bits be set
This is what I call "the MTD device model". We define a set of
operations and metrics, and then represent any flash using this model.
We don't care that we loose some particular/peculiar features of some
flash types. We are rough. But we are generic. And there is still a way
to make use of the peculiarities if there is such a need,

>  - what the OOB size is
---- as mall off-topic note ----
One note about this. There is a trend to remove OOB support from MTD
info at all. Yo may want to read this thread:
http://lists.infradead.org/pipermail/linux-mtd/2006-February/014843.html
--------------------------------
> 
> etc.  That is sensible information to have and that what the actual code 
> implementation in JFFS2 cares about.

Indeed, this is sensible information. Yes, this is very useful.

Let's think, how many features there are going to be. I think many. How
to technically add support of these features? Flags? - bad, as in case
of many features you'll have to have flags1, flags2 fields.

I emphasize, now I do not object against the features stuff. I offer a
way to technically implement them.

I still think the only device-dependent field in MTD has to be mtd->type
storing the type of flash. I offer to get rig of any "feature" flag, at
least because it is not clear how to maintain *potentially* very large
number of features.

But we still may implement a small distinct unit in MTD. This module
will return a set of features present for each particular MTD device. It
will use mtd->type for this. This is semantically the same, but
technically nicer.

Please, look here:
http://lists.infradead.org/pipermail/linux-mtd/2006-March/015200.html

> Otherwise, what do you do with, say, Sibley flash?  Sibley is NOR but 
> not like the traditional definition of NOR flash.  It could be seen like 
> buffered NOR but not exactly.  It could be handled like NAND but without 
> any OOB data.  So what is the solution: adding yet one more flash type?  
> Alternately it could be described fully in terms of the above 
> _capabilities_ which is what matters in the end.

I offer to have mtd->type == MTD_SIBLEY_NOR. And add the knowledge about
Sibley to the "MTD feature unit".

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
