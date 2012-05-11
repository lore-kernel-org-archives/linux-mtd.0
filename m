Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSv48-0003KR-7H
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 18:59:50 +0000
Received: by laap9 with SMTP id p9so2649521laa.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 11:59:45 -0700 (PDT)
Message-ID: <1336762570.6126.6.camel@brekeke>
Subject: Re: [PATCH 1/7] [RFC] UBI: Add checkpoint on-chip layout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Fri, 11 May 2012 21:56:10 +0300
In-Reply-To: <4FAD493F.1040804@nod.at>
References: <1336585125-127220-1-git-send-email-richard@nod.at>
 <1336585125-127220-2-git-send-email-richard@nod.at>
 <1336735041.2625.35.camel@sauron.fi.intel.com> <4FACFFED.40105@nod.at>
 <1336738864.2625.66.camel@sauron.fi.intel.com> <4FAD493F.1040804@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PRwysKf3rmfDa0rmwh63"
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


--=-PRwysKf3rmfDa0rmwh63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 19:15 +0200, Richard Weinberger wrote:
> Am 11.05.2012 14:21, schrieb Artem Bityutskiy:
> >>> It is weird that you do not have an array of ECs instead for _every_
> >>> PEB. Why wasting the flash and time writing/reading this data?
> >>
> >> By array of ECs you mean that all ec values are written to the flash
> >> and pnum is the index?
> >> Sounds sane.
> >=20
> > Yes, to me it sounds like the only sane way, unless there is a strong
> > reason to have redundant "pnum" fields. :-)
>=20
> While looking at my own code a bit closer I found out why I haven't used =
the
> array approach. B-)
> Currently only ec values for PEBs within the free and used list are store=
d.
> Therefore, the array can have gaps. E.g. If PEB X is in the erroneous lis=
t.

I think this is not a good enough justification. I think we may use
0xFFFFFFFF and other high EC values to indicate that the block was bad
or erroneous or whatever.

BTW, did you think about scenario of moving dumping UBI2 on on one
device with one bad PEBs distribution and then flashing it to a
different device with a different bad PEB distribution? What would
happen when we have fastmap enabled? Also, what if I write it to a
larger flash with otherwise the same geometry?

I guess we could detect these things and fall-back to scanning?

--=20
Best Regards,
Artem Bityutskiy

--=-PRwysKf3rmfDa0rmwh63
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrWDKAAoJECmIfjd9wqK0AWsQAMq2tlRmNUbvBEesdYN6EhSq
tuSKJJ4/LIsaG51tT92NmmEW9tRHfQt6OEXdmLmDOGngDJ07cpoUcu6VRJFlqCSt
azCMXIF8X0bCMUlUH2iZyAfxH3kldh25dr4g1YyYDjkcTZs6OyQmMJYnzppkF+Pq
OXE/0d3jqVXBWadfzYtnWAOR0fV4L8Vv/IourOoHg6ONzfzYteox8ccaVsWs0Mhw
v+Nz+KZl3ut9gjqYA3RCbrzEBlwgJr1OYeFt1VWebxnY8jhDpfoxqYWZfPCsTl/L
mgcbG/m7/iAhVtXQpSPw8HzdzOEt793rBNUTzUkKoy1igeMzJRlnV2a+JAIKP0aM
7r95BXcuwbkvzbmJJddRAaK7CDKYR1rDgahKXQeDQBmLWlLnuSFsqiHa3CywG3e4
q/czglbgQ31P0l3663QuBdMukqQmAlAvlysNagCrq4LX2T9PHLwvaTfTdS9mX/zt
LZ+9A48HCyWBgmilaeP8PqXYCHTQ0tnJveZZl9mmCaFWb2iECnxzRBZFSE3shH29
xlblHtBKHJl/nfrdB2bU2MxMZkk/KvaAQUR+q+M1rQWBwEvZzHuD5335YKJ27LSg
vXAg/gcRE7LLyl/VrkYKy8saV+QQz7guc8adraYb9Z7nNmbsyIFG655tavQ51y0n
6TCUIjzl5I7zjW3qp9GF
=yCfM
-----END PGP SIGNATURE-----

--=-PRwysKf3rmfDa0rmwh63--
