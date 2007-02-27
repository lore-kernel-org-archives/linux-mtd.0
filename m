Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HM6oF-0007EG-6i
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 13:12:22 -0500
Subject: Re: [RFC] [PATCH] UBI: convert to kthread API
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1172599497.3885.2.camel@zod.rchland.ibm.com>
References: <200702271450.41167.alexs@linux.vnet.ibm.com>
	<1172598460.17031.4.camel@sauron>
	<1172599497.3885.2.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 27 Feb 2007 20:11:29 +0200
Message-Id: <1172599889.17031.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Christoph Hellwig <hch@infradead.org>,
	Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-02-27 at 12:04 -0600, Josh Boyer wrote:
> On Tue, 2007-02-27 at 19:47 +0200, Artem Bityutskiy wrote:
> > Hello Alexander,
> >=20
> > On Tue, 2007-02-27 at 14:50 +0100, Alexander Schmidt wrote:
> > > UBI should use the kthread API, which makes completions and signal
> > > handling go away.
> >=20
> > how feasible and possible is to get rid of this UBI unit altogether?
>=20
> Depends I suppose.  Is it going to make a large runtime functionality or
> performance impact if a background thread isn't running?

Sorry for vagueness, I do not mean to remove th background _process_, we
really need it. I meant to remove the UBI unit source-wise and use the
kthread calls directly. I am busy with other stuff right now and wanted
Alexander to check how much ugliness or niceness we would introduce with
that change.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
