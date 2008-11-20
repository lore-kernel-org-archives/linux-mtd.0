Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3DDd-000760-QR
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 17:21:30 +0000
Subject: Re: [PATCH] UBIFS: Fix Bulk read buf_len  intialization
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <919AC938BD8D49A68F2667677F5034D1@sisodomain.com>
References: <919AC938BD8D49A68F2667677F5034D1@sisodomain.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 20 Nov 2008 19:19:19 +0200
Message-Id: <1227201559.3954.4.camel@sauron>
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

right. I fixed this yesterday but forgot to push, sorry.
Just pushed the right patches.

Note, we consider the master branch of ubifs-2.6.git as
experimental and we re-base it often. So if you want more
stable UBIFS - use the linux-next branch as we noted here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

Anyway, it is nice to see you reacted so quickly. Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
