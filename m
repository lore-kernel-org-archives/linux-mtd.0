Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPZhJ-0001En-Dk
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 17:20:19 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Subject: Re: [RFC] mtd: ubi: UBI Encryption
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
Date: Wed, 12 Aug 2015 19:19:47 +0200
Cc: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8AC930D6-9BEE-4AA8-99AC-962027CCF336@sigma-star.at>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
To: Andrew Murray <amurray@embedded-bits.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I'm fairly new to MTD/UBI/UBIFS, but I have a bit of knowledge of =
cryptography, so I'll focus on that. :)

> On 10.08.2015, at 21:56, Andrew Murray <amurray@embedded-bits.co.uk> =
wrote:
>=20
> - The current implementation  encrypts with cbc(aes) across fixed =
sized
>   units of hdrs_min_io_size - it also uses an IV based on the physcial =
offset
>   of the block and user provided IV. The key/IV is read from a fixed =
location
>   in flash. I'm not sure of the best way to manage/locate keys - this =
is
>   clearly a hack.

So does this mean the IV for each encryption-unit is chosen from a =
predictable sequence?
If this is the case, using CBC makes the encryption vulnerable to =
certain types of attack.
In general CBC requires random IVs to be secure. A common solution for =
disk encryption is to use ESSIV [1].

Also, how do you handle cases where hdrs_min_io_size is not a multiple =
of the cipher's block size?
I'm not a 100% sure how often this will happen, but in theory it could =
happen and will cause problems when using modes like CBC =
(len(ciphertext) >=3D len(plaintext)).

[1] =
https://en.wikipedia.org/wiki/Disk_encryption_theory#Encrypted_salt-sector=
_initialization_vector_.28ESSIV.29

> - Encryption in UBI was preferred as it removed the complexity from =
userspace,
>   though I suppose there is no reason why this can't be done within =
the MTD
>   layer rather than in UBI and thus benefit all MTD users.

Generally speaking, I'd argue for moving encryption to the highest layer =
possible. So, if you exclusively use UBIFS and need encryption, add it =
to UBIFS or even your userspace application.
The main reason for this is that disk encryption on lower layers (e.g =
block-level) has fewer security guarantees, like no authentication of =
encrypted data for example. So it cannot prevent "evil maid" attacks.
There is a nice writeup on this topic here: [2], which focuses on the =
commonly used XTS mode, but makes valid points for disk encryption in =
general.

So, when you do encryption in UBI or MTD, be aware of the security =
implications and know your thread model.

[2] http://sockpuppet.org/blog/2014/04/30/you-dont-want-xts/


Thanks,
David
