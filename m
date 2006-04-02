Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQ1n1-0002w3-RP
	for linux-mtd@lists.infradead.org; Sun, 02 Apr 2006 08:34:51 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0603311215180.14923@localhost.localdomain>
References: <442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603311215180.14923@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 02 Apr 2006 16:34:11 +0400
Message-Id: <1143981251.3579.199.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-03-31 at 12:19 -0500, Nicolas Pitre wrote:
> So in the end the flash type is redundent and purely informational.

Imagine you're writing a cool flash file system. You want to optimize it
for Sibley NOR. According to my views, you may want to look at
mtd->type, figure out you are working with Sibley NOR, then start
directly talking to the Sybley support subsystem, and realize that
"buffer size". I mean not the minimal I/O size, but that "optimal" I/O
size you mentioned before. So, your file system may be cool and try to
do Input/Out in a more optimal way.

So, for this cool flash file system flash type is an important field.

Of course, you may also use the feature unit I offered. You may, do
things like

if (mtd_feature_available(mtd, MTD_FEATURE_SINGLE_BIT_IO))
etc.

My picture looks very shiny for me :-)

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
