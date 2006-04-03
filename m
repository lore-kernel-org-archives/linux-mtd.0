Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FQIR2-0001Qw-6u
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 07:21:11 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <4430BD5B.70404@ru.mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
	<44309F34.8010301@ru.mvista.com>
	<1144044282.5344.350.camel@localhost.localdomain>
	<4430BD5B.70404@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 03 Apr 2006 08:21:12 +0200
Message-Id: <1144045272.5344.352.camel@localhost.localdomain>
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

On Mon, 2006-04-03 at 10:14 +0400, Vitaly Wool wrote:
> Given that some modern NAND controllers have the ability to generate 
> interrupt when they're done, I would think about complete redesign of 
> the MTD NAND layer. I'd like to see the fully asynchronous base model 
> here (i. e. mtd->send_write_cmd/send_read_cmd or something similar) and 
> synchronous interface on top of that, just like, say, the current SPI 
> core works.
> This would allow to be more flexible in waiting for completion and also 
> would IMO make striping implementation for NAND more straightforward. 
> Does that make sense?

In general yes, but it does not solve the problem, where you have _ONE_
shared line for ready/busy -> interrupt for all chips connected to the
hardware controller, nor does it solve the general serialization
requirements to access the controller.

	tglx
