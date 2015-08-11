Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP69w-0004ME-J6
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 09:47:54 +0000
Received: by oihn130 with SMTP id n130so102505111oih.2
 for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2015 02:47:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvx5xEPRGU3kQDUz70egsPSxF-NLzoECM=y1n1LXqX9rpA@mail.gmail.com>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <CAFLxGvx5xEPRGU3kQDUz70egsPSxF-NLzoECM=y1n1LXqX9rpA@mail.gmail.com>
Date: Tue, 11 Aug 2015 10:47:31 +0100
Message-ID: <CAPcvp5Hc8x23VjNy4mStWBAJT5fUVXb5_i7a=iGiSv-O6ChBvg@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 August 2015 at 07:30, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Mon, Aug 10, 2015 at 9:56 PM, Andrew Murray
> <amurray@embedded-bits.co.uk> wrote:
>> We've recently implemented support for encryption within UBI for one of our
>> customers and now wish to use this experience to provide a suitable solution
>> for the community.
>>
>> Our current implementation works on real hardware and the latest linux-mtd
>> kernel - however there are many issues that in my opinion make it unsuitable
>> for the wider community. I'm keen to address these issues with feedback from
>> linux-mtd such that we can get this in good shape. I'm happy to share the
>> current implementation if it helps form the basis of a discussion that will
>> address the general issues of adding encryption to UBI. (The diffstat for the
>> current implementation is about 407 insertions).
>>
>> In summary:
>>
>>  - The approach I've taken is to intercept data between UBI and MTD (e.g.
>>    mtd_read, mtd_write etc) and encrypt/decrypt it with the kernel crypto
>>    framework (e.g. crypto_*). This is good because it de-couples encryption
>>    from the rest of UBI, reduces/isolates complexity and ensures that everything
>>    is indiscriminately encrypted. Though there may be a more obvious place to do
>>    this.
>>
>>  - This approach is also bad because it breaks an assumption that UBI and UBIFS
>>    make (as well as any other UBI users) that data returned from the MTD layer
>>    containing 'all bits set' is erased flash. The same is also true for writing
>>    data - for example when filling space with 0xFFs. Where we intercept and
>>    encrypt/decrypt the 'all bits set' data we break the assumption because
>>    we've turned it to garbage.
>>
>>  - My work around for this erased flash issue was to conditionally
>>    encrypt/decrypt only when the input data is not 'all bits set'. This had
>>    minimal impact on UBI/UBIFS/etc but it is possible (though very unlikely)
>>    that the output of an encryption algorithm is 'all bits set' - Thus when you
>>    later attempt to decrypt the 'all bits set' cipher text we incorrectly treat
>>    it as erased flash so return it verbatim and thus cause corruption. I've not
>>    seen this issue occur despite reading and writing more than 50GB of data.
>>
>>  - A better solution may be to correctly fix up the callers to the
>>    'interception' layer such that they can choose to read raw or with
>>    encryption. An example of where this would be needed is in 'torture_peb' -
>>    after an erase the fuction reads back the flash to see if its 'all
>> bits set'. This
>>    seems like the right approach to me.
>>
>>  - I have implemented the 'better solution' and it appears to work - however
>>    modifications are then needed to UBIFS in order for that to work. For example
>>    when mounting UBIFS on empty flash it will scan and fail to find
>>    UBIFS_NODE_MAGIC headers (as expected) - it will then determine that the
>>    start scan wasn't empty space (as the 0xFFs have been decrypted into garbage)
>>    and return an error. I believe this is the only issue I found with UBIFS.
>>    (Of course another way to solve this would be to encrypt empty space - but
>>    this would increase wear as the empty space (decrypted to 0xFFs) wouldn't
>>    actually be erased flash thus requiring an additional erase prior to writing
>>    data.).
>>
>>  - The current implementation  encrypts with cbc(aes) across fixed sized
>>    units of hdrs_min_io_size - it also uses an IV based on the physcial offset
>>    of the block and user provided IV. The key/IV is read from a fixed location
>>    in flash. I'm not sure of the best way to manage/locate keys - this is
>>    clearly a hack.
>
> Hm, what do you mean by "read from a fixed location in flash"?
> Did you change the UBI on-flash format to store new meta data?

No this was read from an offset within another MTD partition defined
in the kernel .config. In this case it was the internal flash of a
SoC. This allowed us to keep the key in the SoC and boot an encrypted
rootfs such that the external NAND held only encrypted data. This
seemed less complex than needing an intermediary filesystem (e.g.
initramfs) that would need to find keys prior to attaching UBI.

I'm not sure how best to apply this to the general use case. Perhaps
userspace should be required to provide keys thus requiring some
intermediary filesystem (and UBI API)? Or perhaps the current Kconfig
approach provides enough flexibility for most users.

>
> How do you chain the encrypted blocks? You have to deal with bad blocks.

The encryption is performed within the minimum units of
hdrs_min_io_size. In our case we used cbc(aes) (though that is
configurable), the key size was smaller than hdrs_min_io_size and thus
I believe some benefit is gained. Blocks aren't chained together - but
we thought we'd start with something simple that worked. Therefore cbc
works across hdrs_min_io_size but not between them.

> IOW if you lose a block it should only affect encrypted data with in
> the same block.

Yes, but on the granularity of hdrs_min_io_size.

>
>>  - Encryption in UBI was preferred as it removed the complexity from userspace,
>>    though I suppose there is no reason why this can't be done within the MTD
>>    layer rather than in UBI and thus benefit all MTD users.
>
> I'm not sure if UBI is the right layer for that. I'd do it in MTD to
> have a dm_crypt like
> MTD driver. At best it will be compatible with dm_crypt's userspace tools.

I've not investigated this - but it seems plausible. My 'interception'
layer works immediately above the MTD layer (i.e. the patchset looks a
bit like this):

-       err = mtd_write(ubi->mtd, addr, len, &written, buf);
+       err = mtd_crypt_write(ubi, addr, len, &written, buf);

Thus this code could just as easily exist on the other size of mtd_*.

However this still leaves the issue of assumptions all over the place
that 0xFF == erased flash. Is it best to risk the collision that
crypto output could generate all 0xFFs - or is it best to overcome the
assumptions by fixing them up as an initial stage? I suspect the later
- besides helping the encryption problem it also means you aren't
relying on the content of the flash to determine its state (I wonder
if this could also be used to solve other issues where its difficult
to tell if flash is erased - e.g. inverted ECCs?).

Andrew Murray

>
> --
> Thanks,
> //richard
