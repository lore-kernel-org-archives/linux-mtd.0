From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Alexander Stein <alexanders83@web.de>, Artem Bityutskiy
 <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: RE: [PATCH] UBI: Fix potential NULL-pointer dereference
Date: Mon, 31 Mar 2014 06:18:51 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A869F@post.tritech.se>
References: <1396040689-12419-1-git-send-email-alexanders83@web.de>
In-Reply-To: <1396040689-12419-1-git-send-email-alexanders83@web.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, March 28, 2014 10:04 PM, Alexander Stein wrote:=0A=
>=0A=
> It's no use to debug print a string before checking on NULL.=0A=
>=0A=
=0A=
If the string is NULL, that could be very useful to know when debugging and=
=0A=
the print function should handle that gracefully, i.e. by not printing anyt=
hing=0A=
for %s.=0A=
=0A=
BR // Mats=0A=
