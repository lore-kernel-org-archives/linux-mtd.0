Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuRxT-00018r-DX
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 20:48:20 +0000
Message-ID: <555A4FFB.5040006@nod.at>
Date: Mon, 18 May 2015 22:47:55 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Johannes Bauer <weolanwaybqm@spornkuller.de>
Subject: Re: Wear-leveling peculiarities
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>	<55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
 <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
 <555A4D38.3070702@spornkuller.de>
In-Reply-To: <555A4D38.3070702@spornkuller.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.05.2015 um 22:36 schrieb Johannes Bauer:
> On 18.05.2015 19:58, Richard Weinberger wrote:
> 
>> Wear-leveling is done on UBI and UBIFS.
>> What is CONFIG_MTD_UBI_WL_THRESHOLD set to?
> 
> Ooops. I honestly don't know, will check this out tomorrow. I must admit
> that I wasn't aware of this setting at all.
> 
>> >From the Kconfig help:
>>           This parameter defines the maximum difference between the highest
>>           erase counter value and the lowest erase counter value of eraseblocks
>>           of UBI devices. When this threshold is exceeded, UBI starts performing
>>           wear leveling by means of moving data from eraseblock with low erase
>>           counter to eraseblocks with high erase counter.
>>
>>           The default value should be OK for SLC NAND flashes, NOR flashes and
>>           other flashes which have eraseblock life-cycle 100000 or more.
>>           However, in case of MLC NAND flashes which typically have eraseblock
>>           life-cycle less than 10000, the threshold should be lessened (e.g.,
>>           to 128 or 256, although it does not have to be power of 2)
>>
>> I suspect that your threshold was never reached.
> 
> Yes, I suspect you're right here.

If you did not set CONFIG_MTD_UBI_WL_THRESHOLD it is 4096.
So, regular wear-leveling did never happen.

>> >From your provided graph it looks like all erase block have been
>> erased t most 300 times.
>> If your NAND starts dying after 300 erases you're in trouble.
> 
> And I fear you're right here as well :-(
> 
> Although there's no definitive saying how many page writes the failed
> units had because the defective sectors are so broken that the kernel
> barfs out I/O errors. That means I can't even read the OOB metadata.

The OOB-Data does not matter. UBI is not using OOB.

So, you have to figure out why UBIFS is dying. Maybe it is a NAND issue.

Thanks,
//richard
