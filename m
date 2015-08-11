Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP8rE-0001VM-I1
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 12:40:46 +0000
Received: by obbfr1 with SMTP id fr1so109984725obb.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2015 05:40:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMqctRMAu1y=epkBCAH8igNUX4zEHs_9=5VRJtArK3jPZ7veg@mail.gmail.com>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <CAFLxGvx5xEPRGU3kQDUz70egsPSxF-NLzoECM=y1n1LXqX9rpA@mail.gmail.com>
 <CAPcvp5Hc8x23VjNy4mStWBAJT5fUVXb5_i7a=iGiSv-O6ChBvg@mail.gmail.com>
 <CAOMqctTMQUmqqZKpYpF-cZc1NygW5mmSRoQjGE+-oOYQj-4w=Q@mail.gmail.com>
 <CAPcvp5Ft-5h22gvwHUk6=oQRx1wJkjJpQqfxJmHj855VRKFoiA@mail.gmail.com>
 <CAOMqctRMAu1y=epkBCAH8igNUX4zEHs_9=5VRJtArK3jPZ7veg@mail.gmail.com>
Date: Tue, 11 Aug 2015 13:40:23 +0100
Message-ID: <CAPcvp5H-WLn5mdkH1VgiGO+qc77MZFFJsmBfAMRBVhK3ZbPd_A@mail.gmail.com>
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

On 11 August 2015 at 12:39, Michal Suchanek <hramrach@gmail.com> wrote:
> On 11 August 2015 at 13:03, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
>> On 11 August 2015 at 11:23, Michal Suchanek <hramrach@gmail.com> wrote:
>>>
>>> On 11 August 2015 at 11:47, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
>>> > On 11 August 2015 at 07:30, Richard Weinberger
>>> > <richard.weinberger@gmail.com> wrote:
>>> >> On Mon, Aug 10, 2015 at 9:56 PM, Andrew Murray
>>> >> <amurray@embedded-bits.co.uk> wrote:
>>>
>>> >>
>>> >>>  - Encryption in UBI was preferred as it removed the complexity from userspace,
>>> >>>    though I suppose there is no reason why this can't be done within the MTD
>>> >>>    layer rather than in UBI and thus benefit all MTD users.
>>> >>
>>> >> I'm not sure if UBI is the right layer for that. I'd do it in MTD to
>>> >> have a dm_crypt like
>>> >> MTD driver. At best it will be compatible with dm_crypt's userspace tools.
>>> >
>>> > I've not investigated this - but it seems plausible. My 'interception'
>>> > layer works immediately above the MTD layer (i.e. the patchset looks a
>>> > bit like this):
>>> >
>>> > -       err = mtd_write(ubi->mtd, addr, len, &written, buf);
>>> > +       err = mtd_crypt_write(ubi, addr, len, &written, buf);
>>> >
>>> > Thus this code could just as easily exist on the other size of mtd_*.
>>> >
>>> > However this still leaves the issue of assumptions all over the place
>>> > that 0xFF == erased flash. Is it best to risk the collision that
>>> > crypto output could generate all 0xFFs - or is it best to overcome the
>>> > assumptions by fixing them up as an initial stage? I suspect the later
>>> > - besides helping the encryption problem it also means you aren't
>>> > relying on the content of the flash to determine its state (I wonder
>>> > if this could also be used to solve other issues where its difficult
>>> > to tell if flash is erased - e.g. inverted ECCs?).
>>>
>>> It's probably good idea to treat empty blocks as truly empty and only
>>> encrypt data blocks.
>>
>>
>> In some sense this is what I already have. My encryption hooks exist
>> just above the MTD layer and only get used if UBI attempts to write
>> data to MTD. One of my implementations doesn't encrypt data from UBI
>> if it contains all 0xFFs. (Of course the problem is reading those
>> 0xFFs back from flash and determining if its empty data or encrypted
>> data).
>
> Then that's wrong. The data is all 1 and the encrypted data should be
> not.

For clarify I've tried two approaches:

1) An implementation where encryption is provided unconditionally,
thus all 1's become something other than all 1's

2) An implementation where encryption is conditional based on the
data. If the plain text is all 1's then I do not encrypt.

I stuck with implementation 2) as it was less invasive. In order to
support implementation 2) (which also works), I needed to modify much
more code including UBIFS. This was needed as approach 2) breaks the
assumption that all 1's is empty flash - this is the case because when
reading and decrypting, all 1's becomes garbage - this breaks lots.
For example torture_peb erases flash and reads it back to ensure it
was erased - with encryption this test fails as the erased flash is
decrypted and becomes garbage.

I feel that the second approach is the correct one, I'm sensing you also agree?

 If the output of encryption is all 1 then the block stays empty
> although writing all 1 should generate an ECC on flash chips that have
> one. Some handle all 1 specially and don't generate one ..

I feel that a solution to overcome the issues with approach 2) could
also address the issues with ECC that is not all 0's where the data is
all 1's.

>
> If the FTL says it's a datablock it's a datablock.
>
> If all blocks are empty you should format that flash.
>
> Flash with FTL structure has non-empty blocks that contain the FTL data.

Can you clarify what FTL is? Are you referring to a data structure
devised by the software layers that is stored on flash, a flash
translation layer or something in hardware?

>
>>
>>>
>>> It is also possible to write all 1s to
>>> unencrypted ubifs block and the filesystem should handle it. The block
>>> will technically remain empty but it can be interpreted as data. If
>>> this does not work properly for non-encrypted flash it should be fixed
>>> I guess.
>>
>>
>> Yes this is what I do, if data is provided to UBI containing all 1s, I
>> write it to flash as all 1s. Upon reading it back I also return it to
>> UBI without modification. UBIFS expects this - and attempting to mount
>> UBIFS on a empty UBI volume will otherwise fail unless I do this (as
>> UBIFS makes the assumption that all 1s is empty flash).
>>
>> I'm slightly uncomfortable that UBIFS makes this assumption, it seems
>> to be present as a very sensible sanity check - but it ties back in
>> the characteristics of flash back into a layer that should be
>> abstracted away from it.
>
> Ubifs deals directly with physical flash erase blocks so it cannot
> possibly be abstracted from it.

I thought the purpose of UBI was to abstract the horribleness of flash
from its users. Such that filesystems could care about filesystem
related things rather than working around bad blocks and the other
nasties of flash.

UBIFS deals with logical erase blocks doesn't it? It doesn't need to
worry about erasing flash before using it, etc. So why should UBIFS
need to understand that all 1's is empty flash?

> Technically the pattern for empty
> block could be different on some devices so it might be nice to have
> some sort of is_empty_block somewhere in MTD. So far all 1 is what
> everything uses otherwise ubifs would fail ;-)

Yes - agreed. An is_empty_block interface would overcome my encryption
issues, perhaps assist with ECC issues, and support flash devices that
aren't all 1's when erased (if they existed).

>
>>>
>>>
>>> It's good idea to weight options when dealing with encryption and erasing blocks
>>>  - one is to erase unused blocks in the hope that reading them back
>>> and getting stale data will then be more difficult
>>>  - other is to keep unused blocks intact as much as possible, avoid
>>> half-full blocks and only erase blocks that are about to be written so
>>> usage patterns are not as obvious - this only applies if the block
>>> usage tables and other FTL data is also encrypted.
>>
>>
>> In trying to keep encryption decoupled from UBI, my encryption layer
>> is rather transparent, and thus oblivious to the structures of the
>> data being encrypted and the significance of erasing blocks. Thus here
>> the FTL data (assuming you mean the filesystem meta data?) is all
>> encrypted. The downside here is that I don't know when the filesystem
>> has finished using blocks.
>
> Erasing happens in UBIFS presumably by invoking a block erase on the
> MTD that turns the block in all 1 (except for stuck bits). That is
> outside of write().

No - UBIFS doesn't ever tell MTD or UBI to erase. It uses the
ubi_leb_map|unmap interfaces and UBI manages erasing when needed.

>
> So the encryption would not deal with erasing blocks but you might
> want to tune ubifs parameters that deal with erasing blocks. That is
> independent of actually encrypting the data but might affect the
> overall strength of your encryption scheme.

Yes.

>
>>
>>>
>>>
>>> Encrypting the FTL data may also pose a problem since the structure of
>>> the tables may be fixed to some extent and may be used as additional
>>> leverage if weakness is found in a cipher algorithm.
>>
>>
>> Is encrypting the FTL undesirable?
>
> It is probably desirable. It's just something to be aware of and
> something to consult with an encryption expert if you want to make
> sure your encryption scheme is really sound.

Thanks,

Andrew Murray

>
>>
>>>
>>>
>>> On 11 August 2015 at 07:38, Timo Ketola <Timo.Ketola@exertus.fi> wrote:
>
>>> > Why not postprocess the data so that the encrypted FF becomes FF again
>>> > like this:
>>> >
>>> > Lets say clear text data is I, encrypted data is O, encryption function
>>> > is e() and decryption function is d(). Then, what is normally done, is
>>> > of course:
>>> >
>>> > Write: O = e(I)
>>> > Read: I = d(O)
>>> >
>>> > Calculate F = ~e(FF), where F is encrypted and inverted version of 'all
>>> > bits set' (FF) data, and modify writing and reading:
>>> >
>>> > Write: O = e(I) ^ F
>>> > Read: I = d(O ^ F)
>>> >
>>> > Now encrypting FF input results in FF output and vice versa.
>>> >
>>> > Just wanted to introduce an idea.
>>>
>>> This post-processing function is in general hard to obtain. Since the
>>> encryption is seeded with block offset you would have to encrypt empty
>>> block with the block-specific iv to obtain the transform function and
>>> then apply it to the encrypted block to obtain flash data when writing
>>> and apply inversion on the flash data to obtain encrypted block when
>>> reading. So you would basically encrypt/decrypt each block twice.
>>>
>>> Without some serious research you cannot tell how this damages the
>>> security of the encryption.
>>
>>
>> I shy'd away from taking this approach as I'm not a crypto expert and
>> didn't want to tie UBI encryption to a specific crypto algorithm.
>>
>
> You could do this with any encryption algorithm provided you can get a
> reversible transform (such as XOR negation) that converts arbitrary
> block in all 1. The result may, however, be dodgy unless you are
> really sure what you are doing.
>
> Thanks
>
> Michal
