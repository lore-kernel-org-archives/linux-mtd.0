Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HM6U2-0006k1-IW
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 12:51:29 -0500
Subject: Re: [RFC] [PATCH] UBI: convert to kthread API
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200702271450.41167.alexs@linux.vnet.ibm.com>
References: <200702271450.41167.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 27 Feb 2007 19:47:40 +0200
Message-Id: <1172598460.17031.4.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Christoph Hellwig <hch@infradead.org>,
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

Hello Alexander,

On Tue, 2007-02-27 at 14:50 +0100, Alexander Schmidt wrote:
> UBI should use the kthread API, which makes completions and signal
> handling go away.

how feasible and possible is to get rid of this UBI unit altogether?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
