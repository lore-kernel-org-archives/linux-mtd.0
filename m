Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHyaW-0002DL-JK
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 09:41:45 +0000
Subject: Re: Is there really need to build Block Device Emulation over UBI?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10801231913r43473c02r2d9093a205a00c87@mail.gmail.com>
References: <bae050c10801231913r43473c02r2d9093a205a00c87@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 24 Jan 2008 11:37:39 +0200
Message-Id: <1201167459.6934.42.camel@sauron>
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

On Thu, 2008-01-24 at 11:13 +0800, Nancy wrote:
> Hi,
>    Is there really need to build Block Device Emulation over UBI? Why
> can't use the mtd_blkdev.c and mtdblock.c directly?
>    Thanks to gluebi, make UBI and MTD become one. More interesting
> thing is,  volume can be treat like a mtd partition. mtdblock.c do not
> have wear-leveling and bad block management mechanism but UBI has.
> gluebi make all those functions mix together right?
>    I have tried, and it work.

Frankly, I am very busy now and have no time to review so much code.
Please, communicate via the mailing list instead. And please, send
patches instead of whole files.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
