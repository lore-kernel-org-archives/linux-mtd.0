Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KcZI1-00015n-VY
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 05:27:54 +0000
Subject: Re: [PATCH 1/6] [MTD-UTILS] nandwrite: Qualifier Clean-up
From: Artem Bityutskiy <dedekind@infradead.org>
To: Grant Erickson <gerickson@nuovations.com>
In-Reply-To: <1220847899-22189-1-git-send-email-gerickson@nuovations.com>
References: <1220847899-22189-1-git-send-email-gerickson@nuovations.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 08 Sep 2008 08:28:02 +0300
Message-Id: <1220851682.4036.48.camel@sauron>
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

On Sun, 2008-09-07 at 21:24 -0700, Grant Erickson wrote:
> Static-qualified all globals except 'main' because they have no use
> beyond file scope.
> Constant-qualified MTD device and input positional parameter globals.
> Constant-qualified argv array.

Ack for whole series.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
