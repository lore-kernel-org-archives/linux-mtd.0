Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxBmm-0006Yl-Q9
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 10:08:37 +0000
Message-ID: <5564460D.6010209@nod.at>
Date: Tue, 26 May 2015 12:08:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Johannes Bauer <weolanwaybqm@spornkuller.de>,
 linux-mtd@lists.infradead.org
Subject: Re: Wear-leveling peculiarities
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
 <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
 <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
 <555A4D38.3070702@spornkuller.de> <555A4FFB.5040006@nod.at>
 <f0e983ad35f8be37ef51686615017016@joe.dyn.spornkuller.de>
In-Reply-To: <f0e983ad35f8be37ef51686615017016@joe.dyn.spornkuller.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.05.2015 um 11:38 schrieb Johannes Bauer:
> Am 18.05.2015 22:47, schrieb Richard Weinberger:
> 
>>>> I suspect that your threshold was never reached.
>>>
>>> Yes, I suspect you're right here.
>>
>> If you did not set CONFIG_MTD_UBI_WL_THRESHOLD it is 4096.
>> So, regular wear-leveling did never happen.
> 
> Your initial assessment was correct. The WL_THRESHOLD is at 4096 when we should have configured it to a lower value for our NAND flash.
> 
>> The OOB-Data does not matter. UBI is not using OOB.
>>
>> So, you have to figure out why UBIFS is dying. Maybe it is a NAND issue.
> 
> Yes, sorry, I meant the EC header metadata. Indeed it looks like our NAND flash is dying because WL is not active. Determining the amount of erase-cycles of dead NAND blocks is
> difficult (since the EC header meatdata is lost as well when the whole block doesn't respond anymore).

What flash is this?
I should not start dying that early.

Thanks,
//richard
