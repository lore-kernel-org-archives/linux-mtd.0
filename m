Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW9VN-00051z-Uj
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 12:43:10 +0000
Subject: Re: [PATCH] Remove duplicated unlikely() in IS_ERR()
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hirofumi Nakagawa <hnakagawa@miraclelinux.com>
In-Reply-To: <48A52D69.1040501@miraclelinux.com>
References: <48A52D69.1040501@miraclelinux.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 21 Aug 2008 15:39:30 +0300
Message-Id: <1219322370.18027.71.camel@sauron>
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

Hi,

On Fri, 2008-08-15 at 16:16 +0900, Hirofumi Nakagawa wrote:
> Hi
> Some drivers have duplicated unlikely() macros.
> IS_ERR() already has unlikely() in itself.
> This patch cleans up such pointless codes although there is no real
> effect on the kernel's behaviour.

Your patch did not apply cleanly, but I've done all the manual work
and pushed UBIFS-related part of it to ubifs-2.6.git. Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
