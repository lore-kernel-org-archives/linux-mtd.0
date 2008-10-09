Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kntv5-0003TL-HS
	for linux-mtd@lists.infradead.org; Thu, 09 Oct 2008 11:43:04 +0000
Subject: Re: [PATCH] [UBI] Print reseved_peb when it is too large
From: Artem Bityutskiy <dedekind@infradead.org>
To: dsaxena@plexity.net
In-Reply-To: <20081008195624.GA20104@trantor.hsd1.or.comcast.net>
References: <20081008195624.GA20104@trantor.hsd1.or.comcast.net>
Content-Type: text/plain; charset=utf-8
Date: Thu, 09 Oct 2008 14:41:37 +0300
Message-Id: <1223552497.4632.4.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-08 at 12:56 -0700, Deepak Saxena wrote:
> [UBI] Print reserved_peb when it is too large
>=20
> This patch makes debugging a missconfigured UBI a bit easier
> by providing the needed information in the boot log.
>=20
> Signed-off-by: Deepak Saxena <dsaxena@laptop.org>

Pushed to ubi-2.6.git, thank you.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
