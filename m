Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtdLL-0001e6-DG
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 09:22:56 +0000
Message-ID: <4C88A769.4010103@parrot.com>
Date: Thu, 9 Sep 2010 11:22:49 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: ubifs : corruption after power cut test
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>	
	<4C3C2740.2040105@parrot.com> <4C3C30D1.9030005@parrot.com>	
	<1279031064.31639.90.camel@localhost>
	<4C3C81E3.3030407@parrot.com>	 <4C4FDEF5.2040405@parrot.com>
	<1282463086.16502.38.camel@brekeke>
	<1283763308.11066.0.camel@localhost>
In-Reply-To: <1283763308.11066.0.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Sun, 2010-08-22 at 10:44 +0300, Artem Bityutskiy wrote:
>> On Wed, 2010-07-28 at 09:40 +0200, Matthieu CASTET wrote:
>>> I manage to reproduce it with the backtrace [1].
>> Matthieu, your work-around patch or something very close should
>> certainly be applied to the UBIFS tree, but I still would like to find
>> out what exactly happened in your setup.
>>
>> I see 2 possibilities:
>>
>> 1. An error happened and 'ubifs_garbage_collect()' returned while
>> c->gc_lnum was -1. But in this case we should have switched to R/O mode,
>> and the master node would not be written. But may be for some reasons we
>> did not switch to R/O mode, dunno.
>>
>> 2. More likely scenario: in 'ubifs_rcvry_gc_commit()' we call
>> 'ubifs_garbage_collect_leb()' directly, which can return while
>> c->gc_lnum is -1. And we do not handle this.
>>
>> Would you please be patient enough to reproduce the issue once again with
>> the following patch, which was created against the latest ubifs-2.6.git, but
>> you should be easily able to apply it to your tree.
> 
> Hi, any news?
> 
Not much, I was busy on another subject but I will try ASAP.


Matthieu

PS : any idea/comment on the handling of interrupted write page by 
UBI/UBIFS ?
