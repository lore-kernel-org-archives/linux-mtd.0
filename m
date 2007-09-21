Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYkV7-0003cl-K9
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 11:33:40 -0400
Subject: Re: [PATCH] MTD: OneNAND: fix error print
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1190298515.14370.201.camel@sauron>
References: <1190298515.14370.201.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Fri, 21 Sep 2007 18:32:45 +0300
Message-Id: <1190388765.14370.217.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
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

On Thu, 2007-09-20 at 17:28 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Thu, 20 Sep 2007 19:14:50 +0300
> Subject: [PATCH] MTD: OneNAND: fix error print
>=20
> Do not scare people if a correctable ECC error was detected.
>=20
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch is included at "[PATCH try 2] MTD: OneNAND: fix numerous
races", please, use that one instead.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
