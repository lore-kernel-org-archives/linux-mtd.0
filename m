Received: from mout.web.de ([212.227.17.12])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUfZt-0000Ju-AO
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 17:00:53 +0000
From: Alexander Stein <alexanders83@web.de>
To: dedekind1@gmail.com
Subject: Re: Re: [PATCH] UBI: Fix potential NULL-pointer dereference
Date: Mon, 31 Mar 2014 19:00:25 +0200
Message-ID: <11273890.zrJp64Ac5Z@kongar>
In-Reply-To: <1396259200.9016.59.camel@sauron.fi.intel.com>
References: <1396040689-12419-1-git-send-email-alexanders83@web.de>
 <ED3E0BCACD909541BA94A34C4A164D4C5B3A869F@post.tritech.se>
 <1396259200.9016.59.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 31 March 2014, 12:46:40 wrote Artem Bityutskiy:
> On Mon, 2014-03-31 at 06:18 +0000, Mats K=C3=A4rrman wrote:
> > On Friday, March 28, 2014 10:04 PM, Alexander Stein wrote:
> > >
> > > It's no use to debug print a string before checking on NULL.
> > >
> >=20
> > If the string is NULL, that could be very useful to know when debug=
ging and
> > the print function should handle that gracefully, i.e. by not print=
ing anything
> > for %s.
>=20
> %s will just result in (null), I do not see any issue with this.

Oh, it does? I was not aware of that (kernel-specific) behavior.
Sorry for ne noise.

Best regards,
Alexander
