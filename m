Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gnapk-0000bY-3T
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 08:11:19 -0500
Message-ID: <4566EF6A.1000404@ru.mvista.com>
Date: Fri, 24 Nov 2006 16:11:06 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] NAND: Lazily BBT construction
References: <20061124154210.6303c9fe@localhost.localdomain>
	<1164373299.576.11.camel@sauron>
In-Reply-To: <1164373299.576.11.camel@sauron>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Fri, 2006-11-24 at 15:42 +0300, Konstantin Baydarov wrote:
>   
>> This is the implementation of lazy BBT construction. It introduces
>> a new config option that allows to construct BBT(bad block table)
>> lazily for NAND chips with memory based BBT.
>> The main goal of the feature introduced is to decrease boot time.
>> How it works: BBT is filled only when we check if block is bad. NAND
>> is
>> scanned and BBT entries is constructed from topmost unscanned block to
>> requested.
>> By default BBT is constructed during boot. To enable lazily
>> construction NAND_LAZY_BBT bit should be set in options field of
>> structure nand_chip. 
>>     
>
> The idea looks nice. But I still have 2 questions.
>
> 1. Why don't you instead spawn a scanning kernel thread and do not build
> BBT in background. After the flash is scanned you just kill the thread.
> Also you block any task which accesses an unscanned eraseblock till the
> scanning thread scanned this eraseblock.
>   
I was poking around this idea a bit and it turned out that the boot time 
is longer for most flashes.

Vitaly
