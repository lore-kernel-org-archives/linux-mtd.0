Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOtC3-0007WT-Uk
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 19:57:13 +0000
Received: by obbfr1 with SMTP id fr1so95291510obb.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2015 12:56:50 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 10 Aug 2015 20:56:50 +0100
Message-ID: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
Subject: [RFC] mtd: ubi: UBI Encryption
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We've recently implemented support for encryption within UBI for one of our
customers and now wish to use this experience to provide a suitable solution
for the community.

Our current implementation works on real hardware and the latest linux-mtd
kernel - however there are many issues that in my opinion make it unsuitable
for the wider community. I'm keen to address these issues with feedback from
linux-mtd such that we can get this in good shape. I'm happy to share the
current implementation if it helps form the basis of a discussion that will
address the general issues of adding encryption to UBI. (The diffstat for the
current implementation is about 407 insertions).

In summary:

 - The approach I've taken is to intercept data between UBI and MTD (e.g.
   mtd_read, mtd_write etc) and encrypt/decrypt it with the kernel crypto
   framework (e.g. crypto_*). This is good because it de-couples encryption
   from the rest of UBI, reduces/isolates complexity and ensures that everything
   is indiscriminately encrypted. Though there may be a more obvious place to do
   this.

 - This approach is also bad because it breaks an assumption that UBI and UBIFS
   make (as well as any other UBI users) that data returned from the MTD layer
   containing 'all bits set' is erased flash. The same is also true for writing
   data - for example when filling space with 0xFFs. Where we intercept and
   encrypt/decrypt the 'all bits set' data we break the assumption because
   we've turned it to garbage.

 - My work around for this erased flash issue was to conditionally
   encrypt/decrypt only when the input data is not 'all bits set'. This had
   minimal impact on UBI/UBIFS/etc but it is possible (though very unlikely)
   that the output of an encryption algorithm is 'all bits set' - Thus when you
   later attempt to decrypt the 'all bits set' cipher text we incorrectly treat
   it as erased flash so return it verbatim and thus cause corruption. I've not
   seen this issue occur despite reading and writing more than 50GB of data.

 - A better solution may be to correctly fix up the callers to the
   'interception' layer such that they can choose to read raw or with
   encryption. An example of where this would be needed is in 'torture_peb' -
   after an erase the fuction reads back the flash to see if its 'all
bits set'. This
   seems like the right approach to me.

 - I have implemented the 'better solution' and it appears to work - however
   modifications are then needed to UBIFS in order for that to work. For example
   when mounting UBIFS on empty flash it will scan and fail to find
   UBIFS_NODE_MAGIC headers (as expected) - it will then determine that the
   start scan wasn't empty space (as the 0xFFs have been decrypted into garbage)
   and return an error. I believe this is the only issue I found with UBIFS.
   (Of course another way to solve this would be to encrypt empty space - but
   this would increase wear as the empty space (decrypted to 0xFFs) wouldn't
   actually be erased flash thus requiring an additional erase prior to writing
   data.).

 - The current implementation  encrypts with cbc(aes) across fixed sized
   units of hdrs_min_io_size - it also uses an IV based on the physcial offset
   of the block and user provided IV. The key/IV is read from a fixed location
   in flash. I'm not sure of the best way to manage/locate keys - this is
   clearly a hack.

 - Encryption in UBI was preferred as it removed the complexity from userspace,
   though I suppose there is no reason why this can't be done within the MTD
   layer rather than in UBI and thus benefit all MTD users.

I'm keen to hear any feedback regarding the approaches I've mentioned and to
hear if anyone else working in this area. I'm also keen to hear if
this is wanted
or if this is a bad idea. I accept this isn't trivial undertaking.

Thanks,

Andrew Murray
