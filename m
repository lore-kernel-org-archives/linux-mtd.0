Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jns8q-0004C3-VZ
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 09:16:55 +0000
Subject: Re: ubi-utils
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804210148g7e36db07vd7df62e286da6490@mail.gmail.com>
References: <bae050c10804210148g7e36db07vd7df62e286da6490@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 21 Apr 2008 12:15:45 +0300
Message-Id: <1208769345.5965.363.camel@sauron>
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

Hi,

On Mon, 2008-04-21 at 16:48 +0800, Nancy wrote:
> Hi all,
>     Is there ubi-utils which can dump the specify volume mapped LEBs
> to a file (volume.img), then I can use ubiupdatevol to put the dummped
> file (volume.img) to Nand?

unubi should do this, but last time I tried it - it did not work for me.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
