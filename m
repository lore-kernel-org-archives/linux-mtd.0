Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJpJg-00082L-Cd
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 13:16:25 +0000
Subject: Re: about the _dtype_ parameter
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?UTF-8?Q?=E8=AE=B8=E5=B0=8F=E5=B7=9D?= <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <TWMHGPGDBZQLPDUUCZBAWZYAUCWM.20061402067@cqu.edu.cn>
References: <TWMHGPGDBZQLPDUUCZBAWZYAUCWM.20061402067@cqu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 05 Jan 2009 15:15:43 +0200
Message-Id: <1231161343.6608.3.camel@localhost.localdomain>
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

On Sun, 2009-01-04 at 01:07 +0800, =E8=AE=B8=E5=B0=8F=E5=B7=9D wrote:
> In my test, I found that the third parameter of ubi_wl_get_peb()
> function _dtype_ is always UBI_SHORTTERM.

Which test?

> How does the UBIFS classify the data type?

Did you grep for this fs/ubifs? I think mostly we use UBI_UNKNOWN.

> and would we better classify these UBI_SHORTTERM data more
> fine granularity? Which is good for efficient wear-leveling scheme
> IMO.

May be. I've never done any good experiments for this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
