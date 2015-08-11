Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP6j5-0001T8-1W
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 10:24:12 +0000
Received: by wicja10 with SMTP id ja10so69342730wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2015 03:23:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPcvp5Hc8x23VjNy4mStWBAJT5fUVXb5_i7a=iGiSv-O6ChBvg@mail.gmail.com>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <CAFLxGvx5xEPRGU3kQDUz70egsPSxF-NLzoECM=y1n1LXqX9rpA@mail.gmail.com>
 <CAPcvp5Hc8x23VjNy4mStWBAJT5fUVXb5_i7a=iGiSv-O6ChBvg@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 11 Aug 2015 12:23:07 +0200
Message-ID: <CAOMqctTMQUmqqZKpYpF-cZc1NygW5mmSRoQjGE+-oOYQj-4w=Q@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
To: Andrew Murray <amurray@embedded-bits.co.uk>
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

On 11 August 2015 at 11:47, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
> On 11 August 2015 at 07:30, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
>> On Mon, Aug 10, 2015 at 9:56 PM, Andrew Murray
>> <amurray@embedded-bits.co.uk> wrote:
>>> We've recently implemented support for encryption within UBI for one of our
>>> customers and now wish to use this experience to provide a suitable solution
>>> for the community.
>>>
>>> Our current implementation works on real hardware and the latest linux-mtd
>>> kernel - however there are many issues that in my opinion make it unsuitable
>>> for the wider community. I'm keen to address these issues with feedback from
>>> linux-mtd such that we can get this in good shape. I'm happy to share the
>>> current implementation if it helps form the basis of a discussion that will
>>> address the general issues of adding encryption to UBI. (The diffstat for the
>>> current implementation is about 407 insertions).
>>>
>>> In summary:
>>>
>>>  - The approach I've taken is to intercept data between UBI and MTD (e.g.
>>>    mtd_read, mtd_write etc) and encrypt/decrypt it with the kernel crypto
>>>    framework (e.g. crypto_*). This is good because it de-couples encryption
>>>    from the rest of UBI, reduces/isolates complexity and ensures that everything
>>>    is indiscriminately encrypted. Though there may be a more obvious place to do
>>>    this.
>>>
>>>  - This approach is also bad because it breaks an assumption that UBI and UBIFS
>>>    make (as well as any other UBI users) that data returned from the MTD layer
>>>    containing 'all bits set' is erased flash. The same is also true for writing
>>>    data - for example when filling space with 0xFFs. Where we intercept and
>>>    encrypt/decrypt the 'all bits set' data we break the assumption because
>>>    we've turned it to garbage.
>>>
>>>  - My work around for this erased flash issue was to conditionally
>>>    encrypt/decrypt only when the input data is not 'all bits set'. This had
>>>    minimal impact on UBI/UBIFS/etc but it is possible (though very unlikely)
>>>    that the output of an encryption algorithm is 'all bits set' - Thus when you
>>>    later attempt to decrypt the 'all bits set' cipher text we incorrectly treat
>>>    it as erased flash so return it verbatim and thus cause corruption. I've not
>>>    seen this issue occur despite reading and writing more than 50GB of data.
>>>
>>>  - A better solution may be to correctly fix up the callers to the
>>>    'interception' layer such that they can choose to read raw or with
>>>    encryption. An example of where this would be needed is in 'torture_peb' -
>>>    after an erase the fuction reads back the flash to see if its 'all
>>> bits set'. This
>>>    seems like the right approach to me.
>>>
>>>  - I have implemented the 'better solution' and it appears to work - however
>>>    modifications are then needed to UBIFS in order for that to work. For example
>>>    when mounting UBIFS on empty flash it will scan and fail to find
>>>    UBIFS_NODE_MAGIC headers (as expected) - it will then determine that the
>>>    start scan wasn't empty space (as the 0xFFs have been decrypted into garbage)
>>>    and return an error. I believe this is the only issue I found with UBIFS.
>>>    (Of course another way to solve this would be to encrypt empty space - but
>>>    this would increase wear as the empty space (decrypted to 0xFFs) wouldn't
>>>    actually be erased flash thus requiring an additional erase prior to writing
>>>    data.).
>>>
>>>  - The current implementation  encrypts with cbc(aes) across fixed sized
>>>    units of hdrs_min_io_size - it also uses an IV based on the physcial offset
>>>    of the block and user provided IV. The key/IV is read from a fixed location
>>>    in flash. I'm not sure of the best way to manage/locate keys - this is
>>>    clearly a hack.
>>
>> Hm, what do you mean by "read from a fixed location in flash"?
>> Did you change the UBI on-flash format to store new meta data?
>
> No this was read from an offset within another MTD partition defined
> in the kernel .config. In this case it was the internal flash of a
> SoC. This allowed us to keep the key in the SoC and boot an encrypted
> rootfs such that the external NAND held only encrypted data. This
> seemed less complex than needing an intermediary filesystem (e.g.
> initramfs) that would need to find keys prior to attaching UBI.
>
> I'm not sure how best to apply this to the general use case. Perhaps
> userspace should be required to provide keys thus requiring some
> intermediary filesystem (and UBI API)? Or perhaps the current Kconfig
> approach provides enough flexibility for most users.
>
>>
>> How do you chain the encrypted blocks? You have to deal with bad blocks.
>
> The encryption is performed within the minimum units of
> hdrs_min_io_size. In our case we used cbc(aes) (though that is
> configurable), the key size was smaller than hdrs_min_io_size and thus
> I believe some benefit is gained. Blocks aren't chained together - but
> we thought we'd start with something simple that worked. Therefore cbc
> works across hdrs_min_io_size but not between them.
>
>> IOW if you lose a block it should only affect encrypted data with in
>> the same block.
>
> Yes, but on the granularity of hdrs_min_io_size.
>
>>
>>>  - Encryption in UBI was preferred as it removed the complexity from userspace,
>>>    though I suppose there is no reason why this can't be done within the MTD
>>>    layer rather than in UBI and thus benefit all MTD users.
>>
>> I'm not sure if UBI is the right layer for that. I'd do it in MTD to
>> have a dm_crypt like
>> MTD driver. At best it will be compatible with dm_crypt's userspace tools.
>
> I've not investigated this - but it seems plausible. My 'interception'
> layer works immediately above the MTD layer (i.e. the patchset looks a
> bit like this):
>
> -       err = mtd_write(ubi->mtd, addr, len, &written, buf);
> +       err = mtd_crypt_write(ubi, addr, len, &written, buf);
>
> Thus this code could just as easily exist on the other size of mtd_*.
>
> However this still leaves the issue of assumptions all over the place
> that 0xFF == erased flash. Is it best to risk the collision that
> crypto output could generate all 0xFFs - or is it best to overcome the
> assumptions by fixing them up as an initial stage? I suspect the later
> - besides helping the encryption problem it also means you aren't
> relying on the content of the flash to determine its state (I wonder
> if this could also be used to solve other issues where its difficult
> to tell if flash is erased - e.g. inverted ECCs?).

It's probably good idea to treat empty blocks as truly empty and only
encrypt data blocks. It is also possible to write all 1s to
unencrypted ubifs block and the filesystem should handle it. The block
will technically remain empty but it can be interpreted as data. If
this does not work properly for non-encrypted flash it should be fixed
I guess.

In other words you have two layers here - the layer of physical blocks
which should be the same regardless of encryption and the layer of
data blocks which is transformed by encryption.

It's good idea to weight options when dealing with encryption and erasing blocks
 - one is to erase unused blocks in the hope that reading them back
and getting stale data will then be more difficult
 - other is to keep unused blocks intact as much as possible, avoid
half-full blocks and only erase blocks that are about to be written so
usage patterns are not as obvious - this only applies if the block
usage tables and other FTL data is also encrypted.

Encrypting the FTL data may also pose a problem since the structure of
the tables may be fixed to some extent and may be used as additional
leverage if weakness is found in a cipher algorithm.

On 11 August 2015 at 07:38, Timo Ketola <Timo.Ketola@exertus.fi> wrote:
> Hi,
>
> I have been lurking in this list for a long time and this is my first
> post here. I decided to write because I think I have yet another idea
> for this one:
>
> On 10.08.2015 22:56, Andrew Murray wrote:
>> ...
>>  - My work around for this erased flash issue was to conditionally
>>    encrypt/decrypt only when the input data is not 'all bits set'. This had
>>    minimal impact on UBI/UBIFS/etc but it is possible (though very unlikely)
>>    that the output of an encryption algorithm is 'all bits set' - Thus when you
>>    later attempt to decrypt the 'all bits set' cipher text we incorrectly treat
>>    it as erased flash so return it verbatim and thus cause corruption. I've not
>>    seen this issue occur despite reading and writing more than 50GB of data.
>> ...
>
> Why not postprocess the data so that the encrypted FF becomes FF again
> like this:
>
> Lets say clear text data is I, encrypted data is O, encryption function
> is e() and decryption function is d(). Then, what is normally done, is
> of course:
>
> Write: O = e(I)
> Read: I = d(O)
>
> Calculate F = ~e(FF), where F is encrypted and inverted version of 'all
> bits set' (FF) data, and modify writing and reading:
>
> Write: O = e(I) ^ F
> Read: I = d(O ^ F)
>
> Now encrypting FF input results in FF output and vice versa.
>
> Just wanted to introduce an idea.

This post-processing function is in general hard to obtain. Since the
encryption is seeded with block offset you would have to encrypt empty
block with the block-specific iv to obtain the transform function and
then apply it to the encrypted block to obtain flash data when writing
and apply inversion on the flash data to obtain encrypted block when
reading. So you would basically encrypt/decrypt each block twice.

Without some serious research you cannot tell how this damages the
security of the encryption.

Thanks

Michal
