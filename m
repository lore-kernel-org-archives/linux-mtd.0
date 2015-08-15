Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQZss-00031S-KU
 for linux-mtd@lists.infradead.org; Sat, 15 Aug 2015 11:44:23 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Subject: Re: [RFC] mtd: ubi: UBI Encryption
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CAPcvp5FKYU_gzFsSv4zaSQdq_asY7XQKFrsRAqPBw7xOFu20ZQ@mail.gmail.com>
Date: Sat, 15 Aug 2015 13:43:53 +0200
Cc: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B10D5461-5AEF-417F-91AC-43562E3F5342@sigma-star.at>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <8AC930D6-9BEE-4AA8-99AC-962027CCF336@sigma-star.at>
 <CAPcvp5FKYU_gzFsSv4zaSQdq_asY7XQKFrsRAqPBw7xOFu20ZQ@mail.gmail.com>
To: Andrew Murray <amurray@embedded-bits.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

> On 14.08.2015, at 09:48, Andrew Murray <amurray@embedded-bits.co.uk> =
wrote:

> ESSIV is apparently supported in kernel, I'll take a look and see if I
> can also use this.

Yep. ESSIV is also supported by dm_crypt for instance.

>> Also, how do you handle cases where hdrs_min_io_size is not a =
multiple of the cipher's block size?
>> I'm not a 100% sure how often this will happen, but in theory it =
could happen and will cause problems when using modes like CBC =
(len(ciphertext) >=3D len(plaintext)).
>=20
> At present I don't - I don't even have any assertions to guard this. I
> guess this is something I need to further consider - thanks.

The XTS mode is often used for disk encryption, since it is able to =
handle such cases.
XTS is also supported by the kernel crypto framework.

>>> - Encryption in UBI was preferred as it removed the complexity from =
userspace,
>>>  though I suppose there is no reason why this can't be done within =
the MTD
>>>  layer rather than in UBI and thus benefit all MTD users.
>>=20
>> Generally speaking, I'd argue for moving encryption to the highest =
layer possible. So, if you exclusively use UBIFS and need encryption, =
add it to UBIFS or even your userspace application.
>> The main reason for this is that disk encryption on lower layers (e.g =
block-level) has fewer security guarantees, like no authentication of =
encrypted data for example. So it cannot prevent "evil maid" attacks.
>> There is a nice writeup on this topic here: [2], which focuses on the =
commonly used XTS mode, but makes valid points for disk encryption in =
general.
>>=20
>> So, when you do encryption in UBI or MTD, be aware of the security =
implications and know your thread model.
>=20
> Thanks for the links. Ultimately it will be up to the
> user/system-designer to determine the best scheme (taking into account
> above considerations) - I'm hoping to provide a kernel based option
> that will be useful to some. There are already good userspace
> facilities for encryption I don't see this deprecating those.

Sure, it depends on the use case.
As Michal noted, FDE is a last resort and always better than no =
encryption at all. :)

Thanks,
David
