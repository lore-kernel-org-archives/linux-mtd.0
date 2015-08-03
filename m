Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMLTx-0007Z5-UE
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 19:33:11 +0000
Subject: Re: [RFC PATCH 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
To: Andrea Scian <rnd4@dave-tech.it>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <mailman.4457.1438277726.1758.linux-mtd@lists.infradead.org>
 <mailman.4457.1438277726.1758.linux-mtd.{07a3baba-0e8a-469e-82e1-92b4ef074f4f}.0@lists.infradead.org>
 <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
 <55BB48D9.6050508@dave-tech.it> <20150731123221.34cf601e@bbrezillon>
 <55BB7ABD.7040008@dave-tech.it> <20150731161032.2b155ccb@bbrezillon>
 <55BBA012.4080600@dave-tech.it> <20150731182709.14c345df@bbrezillon>
 <55BF4D72.8090000@dave-tech.it> <20150803144253.66fc6941@bbrezillon>
 <55BF6F09.9000001@dave-tech.it>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Han Xu <b45815@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFC1DA.3090108@nod.at>
Date: Mon, 3 Aug 2015 21:32:42 +0200
MIME-Version: 1.0
In-Reply-To: <55BF6F09.9000001@dave-tech.it>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.08.2015 um 15:39 schrieb Andrea Scian:
>>> I think I can find some time to do some performance tests on real hardware.
>>> Can you please help me in finding:
>>> - which benchmark to use (currently I'm using bonnie++ on UBIFS, maybe I
>>> can you just mtd_speedtest)
>>> - where to implement those read
>>
>> I think the test should be done at the UBI layer if we want to check
>> the real impact of the additional read sequence, but given the answer I
>> gave to your other question I'm not sure this is relevant anymore ;-).

I'm not sure whether introducing a read-before-write check is the best solution.
At least we need hard numbers for slow/old SLC NANDs too.

We has such checks already and got rid of them.
commit 657f28f8811c92724db10d18bbbec70d540147d6
Author: Huang Shijie <shijie8@gmail.com>
Date:   Tue Aug 14 22:38:45 2012 -0400

    mtd: kill MTD_NAND_VERIFY_WRITE


Although the goal of 657f28f8 was something else.

In general I don't think putting much MTD/ECC logic into UBI is the way to go.
UBI is a layer above MTD and MTD should do as much as possible wrt. ECC.

>>>
>>> For the second point I think we can implement it a UBI or MTD level.
>>> I think the former will allow us to easily schedule scrubbing and choose
>>> another block to issue the write to. However I don't really know how to
>>> implement it (I don't really know so much about the UBI code).

Implementing this is not much work.
I've done such hacks for various customers to hunt down hardware issues.

>> I didn't check before suggesting that, but it seems that the UBI layer
>> is already doing this check for you [1], so if you're using UBI/UBIFS
>> you shouldn't worry about bitflips in erased pages: if there is any,
>> and their presence impact the write result, they should be detected.
>> AFAICT, the only thing that is not checked is whether the number of
>> bitflips after a write exceed the bitflips threshold or not, and I
>> guess this can be added.
> 
> IIUC this is a runtime debug check
> 
> if (!ubi_dbg_chk_io(ubi))
>     ....
> 
> And thus is disabled by default.

That's correct.

Thanks,
//richard
