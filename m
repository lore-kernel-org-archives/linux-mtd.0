Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVKDg-0005pz-Uj
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 05:57:29 +0000
Subject: Re: [PATCH] Remove duplicated unlikely() in IS_ERR()
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hirofumi Nakagawa <hnakagawa@miraclelinux.com>
In-Reply-To: <48A52D69.1040501@miraclelinux.com>
References: <48A52D69.1040501@miraclelinux.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 19 Aug 2008 08:55:20 +0300
Message-Id: <1219125321.18027.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: yoshfuji@linux-ipv6.org, christof.schmitt@de.ibm.com,
	netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-08-15 at 16:16 +0900, Hirofumi Nakagawa wrote:
> Hi
> Some drivers have duplicated unlikely() macros.
> IS_ERR() already has unlikely() in itself.
> This patch cleans up such pointless codes although there is no real
> effect on the kernel's behaviour.
>=20
> Thanks,
> Hirofumi Nakagawa
>=20
> Signed-off-by: Hirofumi Nakagawa <hnakagawa@miraclelinux.com>
> ---

Hmm, after thinking a bit I am not sure this is the right way to go.
Indeed, we try to avoid likly()/unlikely(), unless this is really
hot-path. Some kernel developers even think these hints should never
be used. So I'd say, the right thing would bo to remove unlikely()
from IS_ERR() macro instead.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
