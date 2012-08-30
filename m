Received: from mail85.messagelabs.com ([216.82.241.211])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7DYZ-0003bV-Vd
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 22:49:48 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Fri, 31 Aug 2012 08:49:28 +1000
Subject: RE: [PATCH] Test for multi-bit error correction
Message-ID: <6871BC8982B258468985EE735D2C57524E269AFB5F@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 ,<1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>,
 <1346315075.2848.538.camel@sauron.fi.intel.com>
In-Reply-To: <1346315075.2848.538.camel@sauron.fi.intel.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
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

On Thu, 30 Aug 2012 18:24:35 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2012-08-30 at 18:05 +1000, Iwo Mergler wrote:
> >=20
> > I'm not sure what to do about this. Checkpatch.pl also complains if I
> > split the strings.
> > I could declare the format strings as const char * somewhere else, but=

> > I consider the
> > resulting code being less readable. Any suggestions?=20
>=20
> I think you can ignore these ones.
>=20

OK, thanks. Revised patch follows.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
