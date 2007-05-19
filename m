Received: from mail.tmr.com ([64.65.253.246] helo=gaimboi.tmr.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HpQhv-0007rr-Vu
	for linux-mtd@lists.infradead.org; Sat, 19 May 2007 11:19:02 -0400
Message-ID: <464F1539.5050204@tmr.com>
Date: Sat, 19 May 2007 11:18:17 -0400
From: Bill Davidsen <davidsen@tmr.com>
MIME-Version: 1.0
To: Dongjun Shin <djshin90@gmail.com>
Subject: Re: [PATCH] LogFS take three
References: <20070515151919.GA32510@lazybastard.org>	
	<20070515133759.9ee434a2.akpm@linux-foundation.org>	
	<1179317240.2859.222.camel@shinybook.infradead.org>	
	<20070516083408.dcd9dd78.akpm@linux-foundation.org>	
	<1179330596.2859.248.camel@shinybook.infradead.org>	
	<20070516164158.GB8113@lazybastard.org>	
	<7fe698080705162312t4e7ed90byd10ef8e664027b17@mail.gmail.com>	
	<1179383117.2859.416.camel@shinybook.infradead.org>
	<7fe698080705170120w18fe5521oa685cf248a45e1c6@mail.gmail.com>
In-Reply-To: <7fe698080705170120w18fe5521oa685cf248a45e1c6@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dongjun Shin wrote:

> There are so many flash-based storage and some disposable storages,
> as you pointed out, have poor quality. I think it's mainly because these
> are not designed for good quality, but for lowering the price.
> 
The reliability seems to be appropriate to the common use. I'm doubious 
that computer storage was a big design factor until the last few years. 
A good argument for buying large sizes, they are more likely to be 
recent design.

> These kind of devices are not ready for things like power failure because
> their use case is far from that. For example, removing flash card
> while taking pictures using digital camera is not a common use case.
> (there should be a written notice that this kind of action is against
> the warranty)
> 
They do well in such use, if you equate battery death to pulling the 
card (it may not be). I have tested that feature and not had a failure 
of any but the last item. Clearly not recommended, but sometimes 
unplanned needs arise.


> - In contrast to the embedded environment where CPU and flash is directly
> connected, the I/O path between CPU and flash in PC environment is longer.
> The latency for SW handshaking between CPU and flash will also be longer,
> which would make the performance optimization harder.
> 
> As I mentioned, some techniques like log-structured filesystem could
> perform generally better on any kind of flash-based storage with FTL.
> Although there are many kinds of FTL, it is commonly true that
> it performs well under workload where sequential write is dominant.
> 
> I also expect that FTL for PC environment will have better quality spec
> than the disposable storage.

The recent technology announcements from Intel are encouraging in that 
respect.

-- 
Bill Davidsen <davidsen@tmr.com>
   "We have more to fear from the bungling of the incompetent than from
the machinations of the wicked."  - from Slashdot
