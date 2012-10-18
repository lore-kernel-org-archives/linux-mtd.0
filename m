Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TOuqJ-0002OM-Hp
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 18:29:16 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so8901484pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2012 11:29:11 -0700 (PDT)
Message-ID: <50804A6C.8010609@gmail.com>
Date: Thu, 18 Oct 2012 23:59:00 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RESEND PATCH 0/9] mtd_tests cleanup
References: <5075B105.4080701@gmail.com>
 <1350552046.5769.302.camel@sauron.fi.intel.com>
In-Reply-To: <1350552046.5769.302.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/18/2012 2:50 PM, Artem Bityutskiy wrote:
> On Wed, 2012-10-10 at 23:01 +0530, Vikram Narayanan wrote:
>> This patch series removes the usage of PRINT_PREF and printk's and
>> replaces it with pr_{info,err,crit} whichever is applicable.
>>
>> Cc: Brian Norris<computersforpeace@gmail.com>
>> Cc: Artem Bityutskiy<dedekind1@gmail.com>
>
> Pushed the series to l2-mtd.git, thanks!

Thanks Artem. Can you please make Brian Norris as the author for the 
last patch? i.e., mtd: mtd_oobtest: printk -> pr_{info,err,crit}

I forgot to post the patch with the original headers. But I've reposted 
it a few days back. Sorry about that.

> You can send the erase helper patch as well. I think you can put this
> helper to mtdcore.c. And I think UBI and JFFS2 and may be mtdswap and
> other drivers may reuse it - you can take a look.
>

Yeah, Sure. I need to grep into the sources to find the users of it. 
I'll post it soon.

Thanks,
Vikram
