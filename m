Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQFiO-0003np-Ss
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 14:12:13 +0000
Message-ID: <55CDF72B.9060309@ti.com>
Date: Fri, 14 Aug 2015 10:11:55 -0400
From: Murali Karicheri <m-karicheri2@ti.com>
MIME-Version: 1.0
To: Andrew Murray <amurray@embedded-bits.co.uk>, Michal Suchanek
 <hramrach@gmail.com>
CC: David Gstir <david@sigma-star.at>, MTD Maling List
 <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <8AC930D6-9BEE-4AA8-99AC-962027CCF336@sigma-star.at>
 <CAOMqctQUgbukQ-h9vznwu2JrNBaZJeuL1jQiAgG59s9qHzS14Q@mail.gmail.com>
 <CAPcvp5Ee8=mpPcw+nsNfwyw9-ojyNB7cZk9ygrJj-rZWQ4qwkw@mail.gmail.com>
In-Reply-To: <CAPcvp5Ee8=mpPcw+nsNfwyw9-ojyNB7cZk9ygrJj-rZWQ4qwkw@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

> This implementation provides a balance between
> implementation/integration complexity and protection. If other users
> can benefit from this then it's something they can just switch on -
> rather than having to add a variety of userspace components to their
> distribution, etc.
>
> At present my implementation makes an assumption that the key is
> stored in another MTD partition, I took this approach because it was
Did you looked into how to use the encryption key from secure storage in 
SoC itself such as one from OTP memory?  In such case, is there an API 
retrieve the key from such storage?

Murali

> easy. However I'm not sure if this is useful to the general case - or
> if the general case is in fact users on SOMs protecting external flash
> with keys on internal flash. It would be possible to extend the
> UBI/MTD API to add ioctl's (or similar) such that a user can provide a
> key during mount/attach time. This makes it slightly more complex for
> a user to use - as rather than updating a .config they now have to add
> an initramfs that reads a key from one MTD partition and provides it
> to the kernel.
>
>>
>> Adding encryption to UBIFS itself is much more difficult.
>
> Whilst experimenting with this stuff, I actually was successful in
> adding encryption to UBIFS.
>
> To support compression, UBIFS provides functions thats get called when
> data needs to be compressed. This calls use a crypto framework, e.g.
> crypto_comp_compress. I extended this to actually use encryption. This
> worked - though it only encrypted the data and not file names etc, I
> also recall that compression can be turned off or not always applied.
>
> Much like the UBI encryption - I could have also tried to provided
> UBIFS encryption by intercepting the ubi_leb_write and ubi_write
> calls.
>
>>
>> Adding encryption to every application is not really feasible unless
>> you have a single-purpose device with one application.
>
>
> Thanks,
>
> Andrew Murray
>
>>
>> Thanks
>>
>> Michal
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
Murali Karicheri
Linux Kernel, Keystone
