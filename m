Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpbTF-0004m6-Uo
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 10:52:34 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Wed, 28 May 2014 10:52:01 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B4097B0@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
 ,<1401194249.1304.140.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4091B2@post.tritech.se>
 ,<1401202545.1304.164.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4094CF@post.tritech.se>,
 <1401269453.2118.5.camel@sauron.fi.intel.com>
In-Reply-To: <1401269453.2118.5.camel@sauron.fi.intel.com>
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

On Wednesday, May 28, 2014 11:30 AM, Artem Bityutskiy wrote:=0A=
>> I guess you mean something in the line of=0A=
>> http://comments.gmane.org/gmane.linux.drivers.mtd/47872=0A=
>=0A=
> Yes, but without introducing a new option, but just changing the old one=
=0A=
> and add the path argument there.=0A=
=0A=
Well, you did have some valid complaints back then...=0A=
=0A=
How about having two options, one for global and one for per-fs enable,=0A=
both automatically selecting the appropriate sysfs file and with an=0A=
improved help text?=0A=
=0A=
I think the feature is no use anyway unless you understand something=0A=
about the implementation behind it.=0A=
=0A=
BR // Mats=0A=
