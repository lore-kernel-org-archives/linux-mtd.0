Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjTQi-0007Oy-7e
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 13:36:53 +0000
Received: by mail-wi0-f180.google.com with SMTP id hi2so4586409wib.7
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 06:36:29 -0700 (PDT)
Message-ID: <5450ED01.4010305@vanguardiasur.com.ar>
Date: Wed, 29 Oct 2014 10:34:57 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Roger Quadros <rogerq@ti.com>, Frans Klaver <frans.klaver@xsens.com>
Subject: Re: [PATCH v2] mtd: omap: fix mtd devices not showing up
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <1414420445-9020-1-git-send-email-frans.klaver@xsens.com>
 <544F6611.1000801@ti.com> <20141029113612.GA2499@ci00147.xsens-tech.local>
 <5450ECC1.10701@ti.com>
In-Reply-To: <5450ECC1.10701@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="CjTc0FgtvjjXbpPfpA7KqWL1kthhBiuUc"
Cc: linux-omap@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CjTc0FgtvjjXbpPfpA7KqWL1kthhBiuUc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/29/2014 10:33 AM, Roger Quadros wrote:
> On 10/29/2014 01:36 PM, Frans Klaver wrote:
>> On Tue, Oct 28, 2014 at 11:46:57AM +0200, Roger Quadros wrote:
>>> On 10/27/2014 04:34 PM, Frans Klaver wrote:
>>>> Since commit 6d178ef2fd5e ("mtd: nand: Move ELM driver and rename as=

>>>> omap_elm"), I don't have any mtd devices present on my am335x. This
>>>> changes the link order of the omap_elm and omap2 objects, causing th=
em
>>>> to probe in the wrong order.
>>>>
>>>> To fix this, make elm_config defer probing until the omap_elm driver=
 is
>>>> actually loaded.
>>>>
>>>> Signed-off-by: Frans Klaver <frans.klaver@xsens.com>
>>>
>>> Acked-by: Roger Quadros <rogerq@ti.com>
>>
>> Thanks. How about Ezequiel's remark about doing both changes?
>=20
> I don't have any strong feeling for or against it. We shouldn't be depe=
nding on module load order anyways.
>=20

Agreed, feel free to disregard my suggestion.

--=20
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar


--CjTc0FgtvjjXbpPfpA7KqWL1kthhBiuUc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUUO0BAAoJEIOKbhOEIHKiGS8QAI4CJ4duQCRMer7rz1M1V44B
WKW0RI7mXRfvYB1suw1mNTxDt2/uIuqNsRxFoJG2XsB945qDLFVe0k713G05qiLc
hsVCKgS0MaBk9rxxWw4bs6+nhVWn09ri2uFunPhHSxNAyyanDd+6PIzHtlL1XjNk
wv4ZPJlc4gyA55yN8mRMnSXymTUAm9feIISPqoaE174Nlhh4VjmEEyHqBQ1uNKu6
AUwvZiWjnLAkAk2QyGX9nKmC1OJoxj+XvrxcX3pX9VahDcaJx7Fe/vcRR603cNXp
cJKqEau8veRpTP/6xkgModVM4UuNv7IO6msVbHxn4+QxY1UJVUepinbXl+GGpBCR
9LRzPiPEyBPeDmJf/s5YtOekg8UDz6wbuKWRfPlgEutOgSaf0kUCSlpwXN8GIMBM
ze3OwYjOu1auV1MWh5SI0IgTGN+1cbkLokLNz7xGBDbXLiI4xsQDMJLJf52CS//R
xhljCpIefcrUKNQibTRb2VAWRCYd1E1gQBSH+I5d64c792bqmlTGiaRke416K5/j
/xTQ3w6De2+cLE7BfPgFnPv/rvTGmHs2XQ4KWVJcH1ZXbLGzTFHzH7iYFo4KppGB
i/J1Avtx6WiqYJIrfb3WUK8NF8C9UwK9CTq26ISU5AiJg5hSP786n+KK04tQaNdr
KeCiYKrpNvS48D4bp/qZ
=Kg0s
-----END PGP SIGNATURE-----

--CjTc0FgtvjjXbpPfpA7KqWL1kthhBiuUc--
