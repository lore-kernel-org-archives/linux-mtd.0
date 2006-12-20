Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GwxYO-0006xk-SC
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 04:16:03 -0500
Subject: Re: Reduce boot time with jffs2 and CM-X255
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0612201005480.11369@lnxricardw.se.axis.com>
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
	<4588F67A.6080602@sacet.com> <1166604838.3939.12.camel@sauron>
	<Pine.LNX.4.64.0612201005480.11369@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 20 Dec 2006 11:15:39 +0200
Message-Id: <1166606139.3939.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-12-20 at 10:06 +0100, Ricard Wanderlof wrote:
> At least in the 2.6.18 kernels, summary support is marked as EXPERIMENTAL=
.=20
> Is it stable enough to be used for production? (I don't know, just=20
> curious).

Well, we heavily utilize it, and I know some serious projects like OLPC
where summary is utilized. So I would say it is stable enough.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
