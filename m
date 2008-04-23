Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoZXa-0005V4-1D
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 07:37:18 +0000
Subject: Re: ubi-utils
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804230027h6121713fw2f594d49d89e5137@mail.gmail.com>
References: <bae050c10804210148g7e36db07vd7df62e286da6490@mail.gmail.com>
	<1208769345.5965.363.camel@sauron>
	<bae050c10804210243l848eeb6m97a33c5a65d5dfc6@mail.gmail.com>
	<1208776123.5965.367.camel@sauron>
	<bae050c10804210449w14e75e0wf977815c22423358@mail.gmail.com>
	<1208881852.11721.6.camel@sauron>
	<bae050c10804230027h6121713fw2f594d49d89e5137@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 23 Apr 2008 10:37:46 +0300
Message-Id: <1208936266.11721.25.camel@sauron>
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

On Wed, 2008-04-23 at 15:27 +0800, Nancy wrote:
> OK, pass, will you please answer me one question:
> Compare with attaching only 1 MTD device, attaching 2 MTD devices will
> eat system resources a lot? will slow down the Nand write or read
> speed?
> All I need to know is the performances differences. Thanks a lot !

As I understand you are talking about splitting your single chip on 2
partitions and you are questioning about the difference between 1 big
partition and 2 smaller.

Well, I never tried this with real flash. But theoretically there should
be no difference. But I do not recommend you doing this with your MLC
NAND where an eraseblock survives just 10000 erase-cycles.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
