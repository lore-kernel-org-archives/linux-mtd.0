Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joe1L-0000RW-Hr
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 12:24:19 +0000
Subject: Re: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804230357y2d2f5e8cucb0fdeba6137435c@mail.gmail.com>
References: <1208882552.11721.13.camel@sauron>
	<bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
	<1208935971.11721.20.camel@sauron>
	<bae050c10804230101m64bc2558icf9a5ad7efb8c824@mail.gmail.com>
	<1208938571.11721.38.camel@sauron>
	<bae050c10804230207s79902591l8a977881d89e48c3@mail.gmail.com>
	<1208942023.11721.48.camel@sauron>
	<bae050c10804230351s699a851bmb950a18b22ae8e54@mail.gmail.com>
	<bae050c10804230357y2d2f5e8cucb0fdeba6137435c@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 23 Apr 2008 15:24:51 +0300
Message-Id: <1208953491.11721.62.camel@sauron>
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

On Wed, 2008-04-23 at 18:57 +0800, Nancy wrote:
> Does volume size must be aligned to LEB size?
Volume size is always multiple of LEB size.

> If I pass a unaligned LEB size to ubimkvol -s, then it will
> automatically make it aligned or what?
Try and find out please.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
