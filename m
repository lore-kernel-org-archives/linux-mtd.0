Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OCoD3-0000My-RF
	for linux-mtd@lists.infradead.org; Fri, 14 May 2010 06:17:23 +0000
Message-ID: <4BECEAE9.2030008@free.fr>
Date: Fri, 14 May 2010 08:17:13 +0200
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 5/9] [MTD] remove bogus warning about missing boot
	bank	location
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>	<20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
	<1273796379.9999.509.camel@macbook.infradead.org>
In-Reply-To: <1273796379.9999.509.camel@macbook.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Guillaume LECERF <glecerf@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 14/05/2010 02:19, David Woodhouse a écrit :
> On Sat, 2010-04-24 at 17:58 +0200, Guillaume LECERF wrote:
>    
>> From: Uwe Kleine-König<Uwe.Kleine-Koenigi@digi.com>
>>
>> After the deleted block bootloc is only used once as follows:
>>
>>          if (bootloc == 3&&  something_else) {
>>                  ...
>>
>> So setting bootloc = 2 doesn't change anything.  Taking that the
>> warning is wrong and missleading.
>>
>> Signed-off-by: Uwe Kleine-König<Uwe.Kleine-Koenig@digi.com>
>> Signed-off-by: Guillaume LECERF<glecerf@gmail.com>
>> Acked-by: Christopher Moore<moore@free.fr>
>>      
> The warning should be preserved for invalid values, or values we don't
> support. I don't think it's correct to just remove it.
>
>    

But, David, the only effect of this code is to print an *erroneous* message.
The message says "Assuming top" but sets bootloc to bottom (2) :(
See this thread: http://thread.gmane.org/gmane.linux.drivers.mtd/22176
Remark: this would be even clearer if the bootloc values were macros 
instead of 2, 3, ...

If you really want to keep the message then it must at least be changed 
to "Assuming bottom".

Cheers,
Chris
