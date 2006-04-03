Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FQIBL-0001OE-IE
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 07:04:56 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <44309F34.8010301@ru.mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
	<44309F34.8010301@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 03 Apr 2006 08:04:42 +0200
Message-Id: <1144044282.5344.350.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Artem B. Bityutskiy" <dedekind@yandex.ru>, Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-04-03 at 08:06 +0400, Vitaly Wool wrote:
> Nicolas Pitre wrote:
> > IMHO striping NOR and NAND together simply makes no sense.  NOR and NAND 
> > are fundamentally different things when it comes to writing to them, and 
> > apart from evaluation boards where every possible peripheral can be 
> > found you rarely will find both NOR and NAND in the same real life 
> > design.
> >   
> Oh really? What about MP3 player-oriented design with NAND flash as a 
> main storage and NOR flash for kernel/userspace XIP etc?

Granted, but you can not mix the usage of those chips.

Functions like concat or striping can only be used with FLASH of the
same type. NAND and NOR are so fundamentally different it wont work
without some ugly hack around. There is no point to even think about
that.

Also striping on NAND is a seperate topic. Most new hardware designs
have NAND controllers included which provide e.g. hardware based ECC.
Most of the controllers I'm aware of are not really suitable for
striping due to their design. Also striping would require a fundamental
change to the NAND code, as it currently serializes the access to shared
hardware controllers. This seralization needs to be carefully redesigned
to allow striping and even then it depends on the controller and the
overall hardware design (most designs have OR-wired ready/busy pins)
whether it's possible or not.

I have not looked at the patch closely - and I will not until it is in
an acceptable form - but I have the feeling that the striping support
needs more than a bunch of hacks to the core mtd chip support if we do
not want to end up with a complete unmaintainable mess.

	tglx
