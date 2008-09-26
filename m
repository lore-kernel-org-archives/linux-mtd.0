Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KjEdm-0004Hp-H1
	for linux-mtd@lists.infradead.org; Fri, 26 Sep 2008 14:49:56 +0000
Subject: Re: [PATCH] drivers/mtd/ubi: Bad IS_ERR test
From: Artem Bityutskiy <dedekind@infradead.org>
To: Julien Brunel <brunel@diku.dk>
In-Reply-To: <200809261527.26007.brunel@diku.dk>
References: <200809261527.26007.brunel@diku.dk>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Sep 2008 17:48:48 +0300
Message-Id: <1222440528.5012.19.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	haver@vnet.ibm.com, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-09-26 at 15:27 +0200, Julien Brunel wrote:
> In case of error, the function add_volume returns an ERR pointer. The
> result of IS_ERR, which is supposed to be used in a test as it is, is
> here checked to be less than zero, which seems odd. We suggest to
> replace this test by a simple IS_ERR test.

Pushed to ubi-2.6.git, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
