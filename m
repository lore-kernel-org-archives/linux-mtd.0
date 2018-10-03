Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7bz7-0003pL-2m
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 07:54:18 +0000
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20181001234120.425ae1f5@bbrezillon>
 <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
 <20181002001328.7f64ecbc@bbrezillon> <20181002084601.2a118f10@xps13>
 <20181002092500.3dc2ac7a@xps13>
 <09d3f8ab-6c5e-56be-479f-6ca28dca5778@zonque.org>
 <da3e196e239545cfb533a84d9ad71656@svr-chch-ex1.atlnz.lc>
 <20181003093302.4b810e64@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <da2b155e-5c79-67d6-c6e4-bd998b43479b@zonque.org>
Date: Wed, 3 Oct 2018 09:54:02 +0200
MIME-Version: 1.0
In-Reply-To: <20181003093302.4b810e64@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On 3/10/2018 9:33 AM, Miquel Raynal wrote:
>>> Yes! That seems to work nicely as a replacement for my patch.
>>>
>>> Chris, how is that going on your board?
>> Looks good to me. I've just re-run stress_{1,2,3} on the custom board
>> and DB-88F6820-AMC.
> Great! There is still something weird about the complete() though.
> 
> Daniel, do you plan to send the above change or do you want me to do
> it? I would like to integrate the fix in nand/next before sending the
> PR.

Nah, your version has barely anything to do with my patch anymore, 
except that it fixes the same effect, so go ahead please :)

You can add my Reported-and-tested-by though.


Thanks for chasing this, everyone!

Daniel
