Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQIKw-0006yp-0H
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 02:14:55 -0400
Message-ID: <4430BD5B.70404@ru.mvista.com>
Date: Mon, 03 Apr 2006 10:14:51 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>	
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com>	 <442CE217.8080103@yandex.ru>	
	<Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>	
	<44309F34.8010301@ru.mvista.com>
	<1144044282.5344.350.camel@localhost.localdomain>
In-Reply-To: <1144044282.5344.350.camel@localhost.localdomain>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Artem B. Bityutskiy" <dedekind@yandex.ru>, Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> Functions like concat or striping can only be used with FLASH of the
> same type. NAND and NOR are so fundamentally different it wont work
> without some ugly hack around. There is no point to even think about
> that.
>   
I'm afraid I can't object against that ;)
> Also striping on NAND is a seperate topic. Most new hardware designs
> have NAND controllers included which provide e.g. hardware based ECC.
> Most of the controllers I'm aware of are not really suitable for
> striping due to their design. Also striping would require a fundamental
> change to the NAND code, as it currently serializes the access to shared
> hardware controllers. This seralization needs to be carefully redesigned
> to allow striping and even then it depends on the controller and the
> overall hardware design (most designs have OR-wired ready/busy pins)
> whether it's possible or not.
>
>   
Given that some modern NAND controllers have the ability to generate 
interrupt when they're done, I would think about complete redesign of 
the MTD NAND layer. I'd like to see the fully asynchronous base model 
here (i. e. mtd->send_write_cmd/send_read_cmd or something similar) and 
synchronous interface on top of that, just like, say, the current SPI 
core works.
This would allow to be more flexible in waiting for completion and also 
would IMO make striping implementation for NAND more straightforward. 
Does that make sense?

Vitaly
