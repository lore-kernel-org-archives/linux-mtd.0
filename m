Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LB2FG-0008OQ-VF
	for linux-mtd@lists.infradead.org; Fri, 12 Dec 2008 07:15:31 +0000
Subject: Re: UBIFS:  HELP --- cannot figure out correct linux bootlin
From: Artem Bityutskiy <dedekind@infradead.org>
To: Philip Rakity <prakity@yahoo.com>
In-Reply-To: <725079.80117.qm@web58905.mail.re1.yahoo.com>
References: <725079.80117.qm@web58905.mail.re1.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 12 Dec 2008 09:13:17 +0200
Message-Id: <1229065997.13686.410.camel@sauron>
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

On Thu, 2008-12-11 at 14:37 -0800, Philip Rakity wrote:
> Found the problem:=20
>=20
> Can we add a note to the UBI and UBIFS FAQ and Howto:  ?
>=20
> Note:  UBI and UBIFS must not be modules if you are using UBIFS for the l=
inux rootfs

Well, this is said for UBI at this FAQ entry:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_attachmtd

I've extended the UBIFS FAQ entry and added this information:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubifs

Thanks for suggestion.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
