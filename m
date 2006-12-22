Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gxgc5-00051u-Sv
	for linux-mtd@lists.infradead.org; Fri, 22 Dec 2006 04:22:53 -0500
Subject: Re: Eraseblocks torture: OneNAND results
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <14293333.417771166774338914.JavaMail.weblogic@ep_ml29>
References: <14293333.417771166774338914.JavaMail.weblogic@ep_ml29>
Content-Type: text/plain; charset=utf-8
Date: Fri, 22 Dec 2006 11:22:26 +0200
Message-Id: <1166779346.3939.62.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-12-22 at 07:58 +0000, Kyungmin Park wrote:
> Oh it's good news, In our environment. it's hard to produce the problem.
> I erase it more than 1,000k (2 weeks). but it's still working.

Disable checking and run it for a million cycles. Then enable checking
again.

modprobe torture.ko check=3D0 cycles_count=3D1000000

after this the eraseblocks will be more worn-out. Then you could run it
with checking.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
