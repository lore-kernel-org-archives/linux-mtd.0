Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN2ky-00088I-EG
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 13:59:45 +0000
Received: by lboj14 with SMTP id j14so116607lbo.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 06:59:42 -0700 (PDT)
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive
 number in case of unrecoverable error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Wed, 25 Apr 2012 16:59:39 +0300
In-Reply-To: <4F944165.4010400@tribudubois.net>
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
 <1335100568.28267.12.camel@brekeke> <4F944165.4010400@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MKPqT3W2lbug90W2JXmz"
Message-ID: <1335362381.5114.17.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MKPqT3W2lbug90W2JXmz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-22 at 19:35 +0200, Jean-Christophe DUBOIS wrote:
> >   Also, please,
> > tell  whether this fixes a real-life bug or you are fixing a complaint
> > of a static analysis tools or something like this?
> >   And please, tell how
> > you tested it.

I'd like to get some answers to the above questions. The reason I am
asking is that JFFS2 is old and does not see too much maintanance
anymore, so I feel that it is important important to be careful about
merging something which does not fix a real life issue.

--=20
Best Regards,
Artem Bityutskiy

--=-MKPqT3W2lbug90W2JXmz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmANLAAoJEJtuLFy+q7feFKsH/iCXgL7QmmhiPo1VdHWmrq+k
LGpCoCAv5Ti53ECVkAHeaCynv8z4imC1lkSXE/1J+/LdbTwYkk9u66T1U9tddO+b
IzHEuTGCXqIuovMY8JbXNeUxJ8MvXLtFM8cWJbPZtWMthSTit3i+K35FvrxnTD0P
jxyt/wGddzhrM33vGtWNFKysnDaYwbHP2Ag3WOVrz1e82g7GWtXYpluSYphWv5iZ
FznceohRGeEACN1CQkhERxYkFUAnXV41txwg+35xjG4mVCjEOQUGNLHwGhD57s2Z
n20ooFbFV1flmJkM98y+3SPVoZbLG7gQa+KaiXwPyj9TswxFrBxhKiODncEtQx4=
=Miv5
-----END PGP SIGNATURE-----

--=-MKPqT3W2lbug90W2JXmz--
