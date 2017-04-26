Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3NJ7-00020D-Gs
 for linux-mtd@lists.infradead.org; Wed, 26 Apr 2017 13:48:40 +0000
Subject: Re: Mount empty UBI volume attached via fastmap may not work
To: Jimmy Perchet <jimmy.perchet@parrot.com>, linux-mtd@lists.infradead.org
References: <d3e236cf-fb7b-af59-b4ed-0eb59739da23@parrot.com>
 <dfee4baa-c293-a77d-ad7e-baa86db2ef2c@nod.at>
 <02273dee-9f1d-5ec1-328f-8a2f8b16ff79@nod.at>
 <1648d3ba-1a2c-d048-e30d-47128bfa6267@parrot.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <6d452782-adec-4cb1-2848-00224226c89a@nod.at>
Date: Wed, 26 Apr 2017 15:48:10 +0200
MIME-Version: 1.0
In-Reply-To: <1648d3ba-1a2c-d048-e30d-47128bfa6267@parrot.com>
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

Jimmy,

Am 26.04.2017 um 13:39 schrieb Jimmy Perchet:
>> I'm slow today. I think now I got your problem scenario.
>> You erase all blocks of a volume, face a power-cut before all blocks
>> got erased and then UBIFS fails upon mount since it thinks everything
>> is fine.
> Almost; the power-cut occurs after the update operation :
> 
> $umount data/
> 
> $ubiupdatevol -t /dev/ubi0_0

Ah...

> $cat /sys/class/ubi/ubi0_0/corrupted
> 0
> 
> /*==Power-cut==*/
> 
> $mount -t ubifs /dev/ubi0_0 data/
> 
> UBIFS fails to create the default file-system. My guess is that,
> as Fastmap is used, some LEB may be seen as mapped, and
> this not handled by UBIFS emptiness test.

Yes, this guess might be correct.
Let me think about a better way to handle this.

Thanks,
//richard
