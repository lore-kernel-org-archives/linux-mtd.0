Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQJ2R-0007tA-3S
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 02:59:54 -0400
Message-ID: <4430C7C1.6040702@yandex.ru>
Date: Mon, 03 Apr 2006 10:59:13 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
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
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
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

Striping different flash type is an utterly insane perversion indeed.

But still, I imagine 2 MTD devices, one NAND, one NOR. Both can read and 
write. We select the correct eraseblock size and the minimal I/O unit of 
the resulting striped flash (probably much space will be wasted). We 
direct writes to different threads in correspondence to the interleave 
size. And this ugly monster should work in theory! :-)

So, conversely, this ugliness will work if all is done in a generic 
manner and there are *no* ugly hacks! Funny :-) But anyway, let's drop 
the subject.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
