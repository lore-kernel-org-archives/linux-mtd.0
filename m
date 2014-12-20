Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2GK4-0000GS-MZ
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 09:27:42 +0000
Message-ID: <549540F1.4040107@nod.at>
Date: Sat, 20 Dec 2014 10:27:13 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: t kevin <kevint324@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: Get error -74 (ECC error) during ubiattach
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>	<CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
 <CAOx4H9Ds5_ZSwwKRGcEzJc_k+CTeGyeeWRWAyo5mHV5rVEnSCA@mail.gmail.com>
In-Reply-To: <CAOx4H9Ds5_ZSwwKRGcEzJc_k+CTeGyeeWRWAyo5mHV5rVEnSCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 20.12.2014 um 04:43 schrieb t kevin:
> So for uncorrectable ECC error ( e.g., bad block) the only way out is
> to do a fresh ubiformat?
> For device like harddisk you get bad blocks all the time, if it is not
> in the critical sector things can be fixed as much as possible by fsck
> so I was looking for something like fsck.ubifs.

An uncorrectable ECC error means that more bits flipped than your ECC
algorithm can fix.

All you can do is trying to erase the block and hoping that it will
work again.

>>> Is it because the background thread "ubi_bgt2d" has not started yet so
>>> no one could do the data scrubbing during ubiattach stage?
>>
>> UBI does scrubbing if it faces bit-flips (correctable ECC errors).
>>
>>> Is it possible to do something like a fsck.ubifs to fix this issue?
>>
>> No. PEB 404 is bad.
>> Is it always the same block?
> 
> Yes, it is always the same block. What got me confused is below
> message telling bad PEBs is still 0.
> UBI: number of good PEBs:        1920
> UBI: number of bad PEBs:         0
> UBI: number of corrupted PEBs:   0

I agree that this is a bit strange.
UBI treats a block as bad if it has a bad block marker or it detects
so while scrubbing.

But it can also happen that you get a block with bad ECC if a powercut happened
while erasing it.
This is why UBI does not automatically mark it as bad while scanning.
Such a block will be erased.

Thanks,
//richard
