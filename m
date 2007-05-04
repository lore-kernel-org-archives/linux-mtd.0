Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hjs2Y-0002WO-A8
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 03:17:20 -0400
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Florin Malita <fmalita@gmail.com>
In-Reply-To: <463A04A5.5030103@gmail.com>
References: <463A04A5.5030103@gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 04 May 2007 10:17:10 +0300
Message-Id: <1178263030.3659.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-05-03 at 11:49 -0400, Florin Malita wrote:
> Coverity (CID 1614) spotted new_seb being dereferenced after kfree() in=20
> create_vtbl's write_error path.

Applied with minor trailing white-space cleanup, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
