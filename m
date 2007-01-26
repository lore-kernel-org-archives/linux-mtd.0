Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HAMH6-0002N3-Ao
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 03:17:35 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200701241019.27470.alexs@linux.vnet.ibm.com>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Jan 2007 10:04:24 +0200
Message-Id: <1169798664.9477.21.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander,

On Wed, 2007-01-24 at 10:19 +0100, Alexander Schmidt wrote:
> I am currently implementing a per volume update marker for UBI.
> It would be nice to know if you are interested in this feature and if you
> have remarks about my concept.

One remark about the patch: you did not update commentaries. For
example, the header commentary in upd.h. Let's keep commentaries
up-to-date please.

I'd suggest you to grep for "update" and "marker", carefully look at the
results, and fix/update if needed.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
