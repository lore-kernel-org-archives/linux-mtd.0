Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sy1lf-0005OG-3p
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2012 14:25:20 +0000
Message-ID: <501E823E.7080101@nod.at>
Date: Sun, 05 Aug 2012 16:25:02 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: UBI fastmap updates
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343916747.25013.112.camel@sauron.fi.intel.com>
 <20120802161512.5ac7a303@spider.haslach.nod.at>
 <1343917741.25013.114.camel@sauron.fi.intel.com>
 <20120802165132.1bf1e5d7@spider.haslach.nod.at>
 <1343924267.25013.156.camel@sauron.fi.intel.com>
 <20120802183210.7076aa48@spider.haslach.nod.at>
 <1343925930.25013.163.camel@sauron.fi.intel.com>
 <501AB2C8.9010805@am.sony.com>
 <1343929200.25013.197.camel@sauron.fi.intel.com>
 <20120802194538.26e2ec98@spider.haslach.nod.at>
 <20120805112337.2a315c75@pixies.home.jungo.com>
In-Reply-To: <20120805112337.2a315c75@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigDEB34771C7FA71702DB3F5AE"
Cc: "nyoushchenko@mvista.com" <nyoushchenko@mvista.com>,
 artem.bityutskiy@linux.intel.com,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Heinz.Egger@linutronix.de" <Heinz.Egger@linutronix.de>,
 "thomas.wucher@linutronix.de" <thomas.wucher@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "Marius.Mazarel@ugal.ro" <Marius.Mazarel@ugal.ro>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDEB34771C7FA71702DB3F5AE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 05.08.2012 10:23, schrieb Shmulik Ladkani:
> On Thu, 2 Aug 2012 19:45:38 +0200 Richard Weinberger <richard@nod.at> w=
rote:
>> Okay, then let's explicitly reserve a few PEBs for fastmap.
>> This should be very easy task.
>=20
> Need to consider what's expected when migrating from a former non-FM
> UBI system to an FM enabled system, in the case where all PEBs where
> consumed (reserved) in the former system.

If no PEBs are available no fastmap can be installed.
*Maybe* we can steal some PEBs which reserved for bad block handling.

>> How much PEB should be reserved? 2 x sizeof(fastmap)?
>=20
> Since FM does not use EBA's atomic LEB change when writing the new
> fastmap, but instead implements its own FM "leb change" internally -
> then reserving 2x is needed if we'd like to avoid reusing the same
> fastmap PEB.

Yep.

Thanks,
//richard


--------------enigDEB34771C7FA71702DB3F5AE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJQHoJCAAoJEN9758yqZn9e7CsH/R4gcauhmpf45X6Q+nrJMKqM
wXW174uPDl8zryUGtaFUr2Hg1aqEjY4vkha30klfJypkSfb8m7Zgf//W6QRqRb/b
2XcCgNILzo6+Mq5Gi63MVonAHNlafNQkIHkDHQqyKoGTeSmmWp4hHJomFXGMzG+3
z7/dBdenx1jcHFYD/YM1x/t6MyuF11fuzjCvJ0saDcTdqxt/Pi60/yI6y58ZhYxP
+DwM53/kXNBiQs2HqfhhZLDGV8SIJydkgduv3uu0r4hf0hEgIFbuqOCs5pBsTU5k
tD+ZXbg0ZHWzB1mEcTexK9ZSvh3rvtNmkdmD3VmWtCRDlv4m+52UcpVdMNfB88w=
=lyki
-----END PGP SIGNATURE-----

--------------enigDEB34771C7FA71702DB3F5AE--
