Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jn9L5-0006jg-2x
	for linux-mtd@lists.infradead.org; Sat, 19 Apr 2008 09:26:31 +0000
Subject: Re: ubi and u-boot
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bernard Blackham <bernard@largestprime.net>
In-Reply-To: <4808AE6F.4030505@largestprime.net>
References: <4808AE6F.4030505@largestprime.net>
Content-Type: text/plain; charset=utf-8
Date: Sat, 19 Apr 2008 12:25:45 +0300
Message-Id: <1208597145.5965.358.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: u-boot-users@lists.sourceforge.net, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-04-18 at 22:21 +0800, Bernard Blackham wrote:
> [apologies for the cross post]
>=20
> Is anyone working on ubi/ubifs support in u-boot?

Someone mailed me some question and he said he is trying to make u-boot
UBI-aware, but that guy has not showed up anymore.

Yeah, it would be nice to have u-boot understand UBI. At leaset, it
would be nice to teach it to preserve erase counters when erasing flash.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
