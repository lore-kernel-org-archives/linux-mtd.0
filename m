Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEvnL-000249-Os
 for linux-mtd@lists.infradead.org; Tue, 14 Jul 2015 08:42:32 +0000
Message-ID: <55A4CB60.2080505@nod.at>
Date: Tue, 14 Jul 2015 10:42:08 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS errors when file-system is full
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com>
In-Reply-To: <55A4C866.2010400@gmail.com>
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

Am 14.07.2015 um 10:29 schrieb Bhuvanchandra DV:
> On 07/14/2015 12:02 PM, Richard Weinberger wrote:
> 
>> Am 14.07.2015 um 08:30 schrieb Bhuvanchandra DV:
>>> Reproduced the issue with a clean UBI image.
>> On 4.1?
>> How can you reproduce?
> 
> Flashed a clean UBI image with 4.1.
> I can reproduce it by amost filling up the flash and doing a power resets for around ~200 cycles.

And it really happens only if you're filling up the UBIFS?
If you set the UBI module parameter "fm_debug", does the EBA selfcheck trigger?

> During some point U-Boot cannot mount the ubifs partition and fails with:
> "Error reading superblock on volume 'ubi0:rootfs' errno=-22!"

How exactly is U-Boot involved? Does U-Boot touch UBI in any way?

Thanks,
//richard
