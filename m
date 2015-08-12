Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPSVO-0007xY-LI
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 09:39:33 +0000
Received: by obbhe7 with SMTP id he7so8603674obb.0
 for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2015 02:39:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMqctTgL+fu6HhgJG9J6mtNu6qjiNgMnM=hq+XhznSqCg4T+w@mail.gmail.com>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <CAFLxGvx5xEPRGU3kQDUz70egsPSxF-NLzoECM=y1n1LXqX9rpA@mail.gmail.com>
 <CAPcvp5Hc8x23VjNy4mStWBAJT5fUVXb5_i7a=iGiSv-O6ChBvg@mail.gmail.com>
 <CAOMqctTMQUmqqZKpYpF-cZc1NygW5mmSRoQjGE+-oOYQj-4w=Q@mail.gmail.com>
 <CAPcvp5Ft-5h22gvwHUk6=oQRx1wJkjJpQqfxJmHj855VRKFoiA@mail.gmail.com>
 <CAOMqctRMAu1y=epkBCAH8igNUX4zEHs_9=5VRJtArK3jPZ7veg@mail.gmail.com>
 <CAPcvp5H-WLn5mdkH1VgiGO+qc77MZFFJsmBfAMRBVhK3ZbPd_A@mail.gmail.com>
 <CAOMqctTgL+fu6HhgJG9J6mtNu6qjiNgMnM=hq+XhznSqCg4T+w@mail.gmail.com>
Date: Wed, 12 Aug 2015 10:39:09 +0100
Message-ID: <CAPcvp5HxHi=GUUAbA6m4u_g4Bc3J+Mczq81jGozT1=83jCZ8PA@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 August 2015 at 14:24, Michal Suchanek <hramrach@gmail.com> wrote:
> On 11 August 2015 at 14:40, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
>> On 11 August 2015 at 12:39, Michal Suchanek <hramrach@gmail.com> wrote:
>>> On 11 August 2015 at 13:03, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
>>>> On 11 August 2015 at 11:23, Michal Suchanek <hramrach@gmail.com> wrote:
>>>>>
>>>>> On 11 August 2015 at 11:47, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
>>>>> > On 11 August 2015 at 07:30, Richard Weinberger
>>>>> > <richard.weinberger@gmail.com> wrote:
>>>>> >> On Mon, Aug 10, 2015 at 9:56 PM, Andrew Murray
>>>>> >> <amurray@embedded-bits.co.uk> wrote:
>>>>>
>>>>> >>
>>>>> >>>  - Encryption in UBI was preferred as it removed the complexity from userspace,
>>>>> >>>    though I suppose there is no reason why this can't be done within the MTD
>>>>> >>>    layer rather than in UBI and thus benefit all MTD users.
>>>>> >>
>>>>> >> I'm not sure if UBI is the right layer for that. I'd do it in MTD to
>>>>> >> have a dm_crypt like
>>>>> >> MTD driver. At best it will be compatible with dm_crypt's userspace tools.
>>>>> >
>>>>> > I've not investigated this - but it seems plausible. My 'interception'
>>>>> > layer works immediately above the MTD layer (i.e. the patchset looks a
>>>>> > bit like this):
>>>>> >
>>>>> > -       err = mtd_write(ubi->mtd, addr, len, &written, buf);
>>>>> > +       err = mtd_crypt_write(ubi, addr, len, &written, buf);
>>>>> >
>>>>> > Thus this code could just as easily exist on the other size of mtd_*.
>>>>> >
>>>>> > However this still leaves the issue of assumptions all over the place
>>>>> > that 0xFF == erased flash. Is it best to risk the collision that
>>>>> > crypto output could generate all 0xFFs - or is it best to overcome the
>>>>> > assumptions by fixing them up as an initial stage? I suspect the later
>>>>> > - besides helping the encryption problem it also means you aren't
>>>>> > relying on the content of the flash to determine its state (I wonder
>>>>> > if this could also be used to solve other issues where its difficult
>>>>> > to tell if flash is erased - e.g. inverted ECCs?).
>>>>>
>>>>> It's probably good idea to treat empty blocks as truly empty and only
>>>>> encrypt data blocks.
>>>>
>>>>
>>>> In some sense this is what I already have. My encryption hooks exist
>>>> just above the MTD layer and only get used if UBI attempts to write
>>>> data to MTD. One of my implementations doesn't encrypt data from UBI
>>>> if it contains all 0xFFs. (Of course the problem is reading those
>>>> 0xFFs back from flash and determining if its empty data or encrypted
>>>> data).
>>>
>>> Then that's wrong. The data is all 1 and the encrypted data should be
>>> not.
>>
>> For clarify I've tried two approaches:
>>
>> 1) An implementation where encryption is provided unconditionally,
>> thus all 1's become something other than all 1's
>>
>> 2) An implementation where encryption is conditional based on the
>> data. If the plain text is all 1's then I do not encrypt.
>>
>> I stuck with implementation 2) as it was less invasive. In order to
>> support implementation 2) (which also works), I needed to modify much
>> more code including UBIFS. This was needed as approach 2) breaks the
>> assumption that all 1's is empty flash - this is the case because when
>> reading and decrypting, all 1's becomes garbage - this breaks lots.
>> For example torture_peb erases flash and reads it back to ensure it
>> was erased - with encryption this test fails as the erased flash is
>> decrypted and becomes garbage.
>>
>> I feel that the second approach is the correct one, I'm sensing you also agree?
>
> Yes, it sounds correct. Unfortunately, it seems it needs to straighten
> a wart of UBIFS.

This seems the general consensus.

>
>>
>>>
>>> If the FTL says it's a datablock it's a datablock.
>>>
>>> If all blocks are empty you should format that flash.
>>>
>>> Flash with FTL structure has non-empty blocks that contain the FTL data.
>>
>> Can you clarify what FTL is? Are you referring to a data structure
>> devised by the software layers that is stored on flash, a flash
>> translation layer or something in hardware?
>
> Flash translation layer - something that deals accounting of used and
> unused blocks, erase counts, wear levelling, etc. It can be in
> software like with MTD in kernel or in hardware like on SD cards. It
> needs some bookkeeping on the raw flash medium to know which blocks
> are used and keep the erase counters, etc.

OK I'm on the same page as you.

>
>>
>>>
>>>>
>>>>>
>>>>> It is also possible to write all 1s to
>>>>> unencrypted ubifs block and the filesystem should handle it. The block
>>>>> will technically remain empty but it can be interpreted as data. If
>>>>> this does not work properly for non-encrypted flash it should be fixed
>>>>> I guess.
>>>>
>>>>
>>>> Yes this is what I do, if data is provided to UBI containing all 1s, I
>>>> write it to flash as all 1s. Upon reading it back I also return it to
>>>> UBI without modification. UBIFS expects this - and attempting to mount
>>>> UBIFS on a empty UBI volume will otherwise fail unless I do this (as
>>>> UBIFS makes the assumption that all 1s is empty flash).
>>>>
>>>> I'm slightly uncomfortable that UBIFS makes this assumption, it seems
>>>> to be present as a very sensible sanity check - but it ties back in
>>>> the characteristics of flash back into a layer that should be
>>>> abstracted away from it.
>>>
>>> Ubifs deals directly with physical flash erase blocks so it cannot
>>> possibly be abstracted from it.
>>
>> I thought the purpose of UBI was to abstract the horribleness of flash
>> from its users. Such that filesystems could care about filesystem
>> related things rather than working around bad blocks and the other
>> nasties of flash.
>>
>> UBIFS deals with logical erase blocks doesn't it? It doesn't need to
>> worry about erasing flash before using it, etc. So why should UBIFS
>> need to understand that all 1's is empty flash?
>
> If it's supposed to be abstracetd then the abstraction leaks here.
>
> If it dealt with logical blocks it could not enumerate the physical
> blocks of the volume and ascertain all of them are all 1s
>
> Actually it seems that this is indeed supposed to be tracked by UBI
> and the UBIFS driver is just tied way too tightly to it.

The feedback that I've gained from this discussion is:

- Encryption shouldn't be conditional - this causes issues with 0xFF
assumptions - but that should be addressed. This seems like a first
step to prepare the way for encryption
- Encryption could be provided in the MTD layer rather than the UBI
layer - this will likely expose more 0xFF assumptions in other MTD
users besides UBI (that wish to use encryption).
- I've not heard anything that suggests this shouldn't be done in the
kernel (rather than userspace) - or that the mechanism of encrypting
through intercepting reads/writes is terrible. (Though interested to
hear further thoughts on this.)

I will investigate the occurrences of 0xFF assumptions with a view to
consolidate them - such that the logic for determining empty flash is
in one place that can consider the presence of encryption (or other
factors).

Thanks,

Andrew Murray
