Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSL0u-0007Gj-SG
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 04:30:07 +0000
Received: by laap9 with SMTP id p9so960197laa.36
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2012 21:30:00 -0700 (PDT)
Message-ID: <1336624000.1936.22.camel@brekeke>
Subject: Re: [RFC v2] UBI: UBIVIS (aka checkpointing) support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 10 May 2012 07:26:40 +0300
In-Reply-To: <1336585125-127220-1-git-send-email-richard@nod.at>
References: <1336585125-127220-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-n3JmxVr6mvvenQM0f3Cj"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-n3JmxVr6mvvenQM0f3Cj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 19:38 +0200, Richard Weinberger wrote:
> The following patch set implements UBIVIS (checkpointing) support for
> UBI.

Hi Richard, I would like to complain about the names again. I though I
better give this feed back as soon as possible...

Firs of all, thanks for doing this, I will look closer, and I am very
keen of merging this stuff once we are sure its design is good, allows
for future extensions and is backward-compatible.

Then naming :-) We discussed checkpoints in this list long time ago I
think. If you ask a random UBI user what would be UBI with
checkpointing, I am sure most people would tell you that this would mean
an ability to checkpoint a volume at any point of time, then do
arbitrary volume changes (e.g., upgrade the system, re-flash it), and
then be able to return to any of the old checkpoints.

This name is rally reserved to semantics like that. Btrfs implements
checkpoints. UBIFS could, in theory do as well. And UBI could do in
theory - you just need a large pool of unused PEBs and then you do COW.

Please, do not use word "checkpoint" for what you do at all - this is
asking for troubles - people will be confused.

Also, I think this new feature should be always compiled in. I do not
think we need this ifdef forest at all. You can detect run-time the
on-flash format version.

How about calling this "summary" as in JFFS2, or fastmap/fmap ?

Sorry for being pedantic, but clear terminology is really important, I
think.

Also the naming logic and the internal layout should allow us to add
more features. E.g., if someone comes up with real journal.

So may be just naming your stuff UBI2, having terms like "UBI2 format",
would be the easiest? Then someone could make this to be UBI3. A
documentation section could describe what UBI2 is and how it is
different from UBI1 or just UBI.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-n3JmxVr6mvvenQM0f3Cj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPq0OAAAoJECmIfjd9wqK0q3QP/3d8k9yQIOZyknGQJ4t6rhtx
7dkpSnp+mQ0uUYPKjnPLQ1HkEVS80rfQ1226j0j+rGIWMsmHvujHDFZLnT/cvxJ5
3JiLVhXoCsa1i8Tuvz1Z97sEmr/fc5r145kxX8BIISJNXkIm8Moq2OKCnQoV4bCR
QYJwXh6wiliQv7bSCx00C8J2i5wLwbd6LdNljef/rUc6h9vKwqgj1f1iDMlNOhPo
ZVjMUeuWqhSqRMzPp3bM4ECZbSraSV8eZcEOlctKVooKDIWAy30eCOQfuLzRqmpG
r6QCLN9E9ufSl8TqEOIY1B8K6cmuDSxJG0bZp4bWfCoUs9J7iztraHGy5+1Bzq/A
4RJHjSxhBAxYKaHd9DD5+btXusKBEbHzHH+1DEstVnophDksPtJbLle444wui+DQ
d29ReqgaiApyrlXxFDLOqk8uW8QRWkqzYqlxoyOB+Gs9Tw3WKfhbTN1YzvbNpfHd
jG5R3KDqW2/eDXpW5H8NV7gyboth9ikBAQv/GwKqAR/hZWlciOrzFvZ2oF/oJ3U+
NLL5JCt1KbcdPr3E8MotC+pWmKOP6a824oQqLgxnwOq4LNQyCw7wU/n9rp5Im032
Fce0qnNUWmxGhmLqPwm2qxpCZFiuVb31FbWZ9KDzJEBBaY8v9ICIj6nsrzXcB+eM
IPSEDRSdvecyY9EIS8mZ
=syx1
-----END PGP SIGNATURE-----

--=-n3JmxVr6mvvenQM0f3Cj--
