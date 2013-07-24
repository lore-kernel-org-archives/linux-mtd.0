Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1yJp-0001lF-FM
 for linux-mtd@lists.infradead.org; Wed, 24 Jul 2013 12:37:26 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: RE: xattr patches from feb?
Date: Wed, 24 Jul 2013 12:36:50 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCC0C48@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCA20D3@post.tritech.se>,
 <51C837D9.5060007@pengutronix.de>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA8176@post.tritech.se>,
 <51CC0B15.8080804@pengutronix.de>,
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA820E@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCA820E@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marc,=0A=
=0A=
I have now run your patches both on the bench using the integck test progra=
m and=0A=
in live systems for an extended period of time. The xattr node related erro=
rs I saw=0A=
before has not appeared any more.=0A=
All tests run on a MPC5125 based system using NOR FLASH.=0A=
=0A=
Tested-by: Mats Karrman <mats.karrman@tritech.se>=0A=
=0A=
BR // Mats=0A=
________________________________________=0A=
From: linux-mtd [linux-mtd-bounces@lists.infradead.org] on behalf of Mats K=
=E4rrman [Mats.Karrman@tritech.se]=0A=
Sent: Thursday, June 27, 2013 12:59 PM=0A=
To: Marc Kleine-Budde=0A=
Cc: linux-mtd=0A=
Subject: RE: xattr patches from feb?=0A=
=0A=
On Thu, June 27, 2013 11:51 AM, Marc Kleine-Budde [mkl@pengutronix.de] wrot=
e:=0A=
> Can you please (re)check if these patches are still the ones on my=0A=
> server?=0A=
=0A=
Yes, my patch is equivalent to your committs=0A=
1a5ef9e82c7c76a90de94190df6d0ad9cfad2452=0A=
and=0A=
88dfd5c021b6a628a3b51e8f9f34e4d26a01f4f4=0A=
=0A=
> Can I have your Tested-by? Do they fix your problems?=0A=
=0A=
I'm still testing but so far it looks promising.=0A=
=0A=
> If so, we should try to get them mainline.=0A=
=0A=
Sounds like a great idea!=0A=
=0A=
// Mats=0A=
______________________________________________________=0A=
Linux MTD discussion mailing list=0A=
http://lists.infradead.org/mailman/listinfo/linux-mtd/=0A=
