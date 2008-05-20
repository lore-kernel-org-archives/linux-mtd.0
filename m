Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyPs3-0001M4-M8
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 11:19:08 +0000
Subject: Re: ubiupdatevol from pipe/compressed file
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080520083957.GA29998@cloud.net.au>
References: <20080519084746.GA19325@cloud.net.au>
	<1211187241.27243.40.camel@sauron>
	<20080520083957.GA29998@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Tue, 20 May 2008 14:19:21 +0300
Message-Id: <1211282361.31023.1.camel@sauron>
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

Hi,

the patch looks good.

On Tue, 2008-05-20 at 18:39 +1000, Hamish Moffatt wrote:
> Actually, it looks like the kernel (drivers/mtd/ubi/upd.c) doesn't
> require the data in whole LEB chunks anyway, so this code could be
> revert with the check for a whole LEB worth of read() removed. I can
> send an updated patch tomorrow.

Yes, UBI accepts any amount of bytes at a time.

>=20
> My ubiupdatevol.c original may be out of date. If so I can rebase
> tomorrow.

OK, thanks.
=20
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
