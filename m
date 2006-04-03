Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQJMP-00007e-Os
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 03:20:31 -0400
Message-ID: <4430CCAA.1020405@intel.com>
Date: Mon, 03 Apr 2006 11:20:10 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
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
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
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
>> Oh really? What about MP3 player-oriented design with NAND flash as a
>> main storage and NOR flash for kernel/userspace XIP etc?
>
> Granted, but you can not mix the usage of those chips.
>
> Functions like concat or striping can only be used with FLASH of the
> same type. NAND and NOR are so fundamentally different it wont work
> without some ugly hack around. There is no point to even think about
> that.

That's my point too. Moreover there is no reason to stripe NOR and NAND. 
Even if you were able to make "some ugly hacks" to configure it you wont 
get any performance increase due to significantly different speed of 
those chips. Striped device will work with the speed of the slowest 
sub-device.

> I have the feeling that the striping support
> needs more than a bunch of hacks to the core mtd chip support if we do
> not want to end up with a complete unmaintainable mess.

Originally striping layer has been developed for NOR and Sibley flashes 
which quite slow. Striping for NOR is quite simple despite it requires 
some changes in command sets implementation.

If you look at my patches you find nothing that changes MTD NAND 
subsystem. Only interleaving algorithm (virtual pages merging) and 
worker threads queues have been implemented for NAND flashes. It was not 
possible to check striped NAND performance gain due to some hardware 
limitations we have - but I believe NAND striping will come across the 
same problems with thread switching as we had for NOR devices. Anyway I 
feel that in general NAND striping wont be so simple as NOR striping.

Thanks,
Alexander
