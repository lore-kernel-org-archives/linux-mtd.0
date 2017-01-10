Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQyNW-00047y-6D
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 15:30:28 +0000
Subject: Re: On-die ECC support
To: Peter Rosin <peda@axentia.se>
References: <45d6eb07-d6f0-1ac1-bd50-ef913a2826d8@axentia.se>
 <a00bb5bf-abdb-ce5f-e644-492b54d348c5@nod.at>
 <2679512d-6646-18c0-d000-494642d66f32@axentia.se>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <d2765cf2-2bf7-89e6-f7b0-19e5847bab24@nod.at>
Date: Tue, 10 Jan 2017 16:30:01 +0100
MIME-Version: 1.0
In-Reply-To: <2679512d-6646-18c0-d000-494642d66f32@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter,

Am 10.01.2017 um 15:54 schrieb Peter Rosin:
> On 2017-01-09 22:46, Richard Weinberger wrote:
>> Peter,
>>
>> Am 09.01.2017 um 22:37 schrieb Peter Rosin:
>>> Hi!
>>>
>>> AFAICT, on-die ECC support [1] (continues in [2]) was never upstreamed
>>> and the patches no longer applies. I wonder if someone has done the
>>> work to forward port them to recent kernels?
>>
>> Nope.
>>
>> Supporting On-die ECC in a proper way is with the current MTD NAND code
>> not possible.
> 
> Hmm, has something fundamental changed since the patches were proposed
> that makes it impossible? Or is it just the same as it was a couple of
> years ago, but different mechanics (changes to layout handling etc)?

No, it turned out to be very complicated to support On-Die for all
possible NAND controllers.
Drivers can use existing helper functions or provide their own functions.
But for On-Die ECC you'd have to hook all of them.
That's why most On-Die ECC patches touch also a lot of driver code instead
only the NAND framework.

Of course it is doable and not rocket science this but it needs more work.
AFAIK also Boris thought about that while re-factoring the code.

>> I stopped working on it since I have no longer access to working
>> On-die ECC hardware and On-die ECC is a dead horse.
> 
> Maybe so, but here I am with a desire to use a new kernel with old
> hardware...

If you want to continue the work on the patches, you're very welcome.
Please see also the patches on BENAND support.

Thanks,
//richard
