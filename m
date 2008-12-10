Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAOZf-0001Ed-IY
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 12:53:55 +0000
Subject: Re: Ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?UTF-8?Q?=D0=96=D0=B5=D0=BA=D0=B0?= <vortexx@ukr.net>
In-Reply-To: <00a101c95abc$ba2a0fc0$3503200a@head.local>
References: <00a101c95abc$ba2a0fc0$3503200a@head.local>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 14:51:26 +0200
Message-Id: <1228913486.13686.265.camel@sauron>
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

On Wed, 2008-12-10 at 13:44 +0200, =D0=96=D0=B5=D0=BA=D0=B0 wrote:
> Hi Artem!!!=20
> On my system after create UBI device /dev/ubi0_0 it was not created...
> I did check... here is a result
>=20
> # cat /sys/class/ubi/ubi0/dev
> 253:0
> # ls -l /dev/ubi0
> brw-rw----    1 root     root     253,   0 Jan  1 00:11 /dev/ubi0=20

Just pushed a fix which makes ubi utilities to be more verbose about
errors.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
