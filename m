Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L08ST-0000xd-8T
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 05:40:05 +0000
Subject: Re: MTD/flash perfomance statistics
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF05EC4818.8CEEBBD5-ON882574FE.00634AE0-882574FE.0063997B@selinc.com>
References: <OF05EC4818.8CEEBBD5-ON882574FE.00634AE0-882574FE.0063997B@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 12 Nov 2008 07:38:09 +0200
Message-Id: <1226468289.16925.28.camel@sauron>
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

On Tue, 2008-11-11 at 10:08 -0800, Bruce_Leonard@selinc.com wrote:
> We're using UBIFS/UBI/MTD/NAND and we want to find out how much of our=20
> time is spent accessing the flash.  Are there any tools or is there any=20
> code in that chain that collects any sort of statistics on flash=20
> performace/utilization?  I could do something as crude as a counter in my=
=20
> NAND driver, but if there's anything more sophisticated that I can just=20
> "use out of the box" so to speak that would be better.  Thanks.

Not sure what exactly you need, but probably you want oprofile?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
