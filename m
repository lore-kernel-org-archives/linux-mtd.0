Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP7LP-0002Ln-8m
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 11:03:50 +0000
Received: by obnw1 with SMTP id w1so144967435obn.3
 for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2015 04:03:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMqctTMQUmqqZKpYpF-cZc1NygW5mmSRoQjGE+-oOYQj-4w=Q@mail.gmail.com>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <CAFLxGvx5xEPRGU3kQDUz70egsPSxF-NLzoECM=y1n1LXqX9rpA@mail.gmail.com>
 <CAPcvp5Hc8x23VjNy4mStWBAJT5fUVXb5_i7a=iGiSv-O6ChBvg@mail.gmail.com>
 <CAOMqctTMQUmqqZKpYpF-cZc1NygW5mmSRoQjGE+-oOYQj-4w=Q@mail.gmail.com>
Date: Tue, 11 Aug 2015 12:03:25 +0100
Message-ID: <CAPcvp5Ft-5h22gvwHUk6=oQRx1wJkjJpQqfxJmHj855VRKFoiA@mail.gmail.com>
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

On 11 August 2015 at 11:23, Michal Suchanek <hramrach@gmail.com> wrote:
>
> On 11 August 2015 at 11:47, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
> > On 11 August 2015 at 07:30, Richard Weinberger
> > <richard.weinberger@gmail.com> wrote:
> >> On Mon, Aug 10, 2015 at 9:56 PM, Andrew Murray
> >> <amurray@embedded-bits.co.uk> wrote:
>
> >>
> >>>  - Encryption in UBI was preferred as it removed the complexity from userspace,
> >>>    though I suppose there is no reason why this can't be done within the MTD
> >>>    layer rather than in UBI and thus benefit all MTD users.
> >>
> >> I'm not sure if UBI is the right layer for that. I'd do it in MTD to
> >> have a dm_crypt like
> >> MTD driver. At best it will be compatible with dm_crypt's userspace tools.
> >
> > I've not investigated this - but it seems plausible. My 'interception'
> > layer works immediately above the MTD layer (i.e. the patchset looks a
> > bit like this):
> >
> > -       err = mtd_write(ubi->mtd, addr, len, &written, buf);
> > +       err = mtd_crypt_write(ubi, addr, len, &written, buf);
> >
> > Thus this code could just as easily exist on the other size of mtd_*.
> >
> > However this still leaves the issue of assumptions all over the place
> > that 0xFF == erased flash. Is it best to risk the collision that
> > crypto output could generate all 0xFFs - or is it best to overcome the
> > assumptions by fixing them up as an initial stage? I suspect the later
> > - besides helping the encryption problem it also means you aren't
> > relying on the content of the flash to determine its state (I wonder
> > if this could also be used to solve other issues where its difficult
> > to tell if flash is erased - e.g. inverted ECCs?).
>
> It's probably good idea to treat empty blocks as truly empty and only
> encrypt data blocks.


In some sense this is what I already have. My encryption hooks exist
just above the MTD layer and only get used if UBI attempts to write
data to MTD. One of my implementations doesn't encrypt data from UBI
if it contains all 0xFFs. (Of course the problem is reading those
0xFFs back from flash and determining if its empty data or encrypted
data).

>
> It is also possible to write all 1s to
> unencrypted ubifs block and the filesystem should handle it. The block
> will technically remain empty but it can be interpreted as data. If
> this does not work properly for non-encrypted flash it should be fixed
> I guess.


Yes this is what I do, if data is provided to UBI containing all 1s, I
write it to flash as all 1s. Upon reading it back I also return it to
UBI without modification. UBIFS expects this - and attempting to mount
UBIFS on a empty UBI volume will otherwise fail unless I do this (as
UBIFS makes the assumption that all 1s is empty flash).

I'm slightly uncomfortable that UBIFS makes this assumption, it seems
to be present as a very sensible sanity check - but it ties back in
the characteristics of flash back into a layer that should be
abstracted away from it.

>
>
> In other words you have two layers here - the layer of physical blocks
> which should be the same regardless of encryption and the layer of
> data blocks which is transformed by encryption.


This is my understanding if I s/phyiscal blocks/logical erase blocks/g
and s/data blocks/physical erase blocks/g

>
>
> It's good idea to weight options when dealing with encryption and erasing blocks
>  - one is to erase unused blocks in the hope that reading them back
> and getting stale data will then be more difficult
>  - other is to keep unused blocks intact as much as possible, avoid
> half-full blocks and only erase blocks that are about to be written so
> usage patterns are not as obvious - this only applies if the block
> usage tables and other FTL data is also encrypted.


In trying to keep encryption decoupled from UBI, my encryption layer
is rather transparent, and thus oblivious to the structures of the
data being encrypted and the significance of erasing blocks. Thus here
the FTL data (assuming you mean the filesystem meta data?) is all
encrypted. The downside here is that I don't know when the filesystem
has finished using blocks.

>
>
> Encrypting the FTL data may also pose a problem since the structure of
> the tables may be fixed to some extent and may be used as additional
> leverage if weakness is found in a cipher algorithm.


Is encrypting the FTL undesirable?

>
>
> On 11 August 2015 at 07:38, Timo Ketola <Timo.Ketola@exertus.fi> wrote:
> > Hi,
> >
> > I have been lurking in this list for a long time and this is my first
> > post here. I decided to write because I think I have yet another idea
> > for this one:
> >
> > On 10.08.2015 22:56, Andrew Murray wrote:
> >> ...
> >>  - My work around for this erased flash issue was to conditionally
> >>    encrypt/decrypt only when the input data is not 'all bits set'. This had
> >>    minimal impact on UBI/UBIFS/etc but it is possible (though very unlikely)
> >>    that the output of an encryption algorithm is 'all bits set' - Thus when you
> >>    later attempt to decrypt the 'all bits set' cipher text we incorrectly treat
> >>    it as erased flash so return it verbatim and thus cause corruption. I've not
> >>    seen this issue occur despite reading and writing more than 50GB of data.
> >> ...
> >
> > Why not postprocess the data so that the encrypted FF becomes FF again
> > like this:
> >
> > Lets say clear text data is I, encrypted data is O, encryption function
> > is e() and decryption function is d(). Then, what is normally done, is
> > of course:
> >
> > Write: O = e(I)
> > Read: I = d(O)
> >
> > Calculate F = ~e(FF), where F is encrypted and inverted version of 'all
> > bits set' (FF) data, and modify writing and reading:
> >
> > Write: O = e(I) ^ F
> > Read: I = d(O ^ F)
> >
> > Now encrypting FF input results in FF output and vice versa.
> >
> > Just wanted to introduce an idea.
>
> This post-processing function is in general hard to obtain. Since the
> encryption is seeded with block offset you would have to encrypt empty
> block with the block-specific iv to obtain the transform function and
> then apply it to the encrypted block to obtain flash data when writing
> and apply inversion on the flash data to obtain encrypted block when
> reading. So you would basically encrypt/decrypt each block twice.
>
> Without some serious research you cannot tell how this damages the
> security of the encryption.


I shy'd away from taking this approach as I'm not a crypto expert and
didn't want to tie UBI encryption to a specific crypto algorithm.

Andrew Murray

>
>
> Thanks
>
> Michal
