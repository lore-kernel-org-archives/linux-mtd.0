Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KO59r-0007Kf-2J
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 06:27:35 +0000
Subject: Re: Deep thinking about the Wear-leveling mothed
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1217327479.2812.24.camel@localhost.localdomain>
References: <1217327479.2812.24.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 30 Jul 2008 09:22:53 +0300
Message-Id: <1217398973.9048.7.camel@sauron>
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

On Tue, 2008-07-29 at 18:31 +0800, xiaochuan-xu wrote:
> 2. Do we really need wear-leveling when the oldest PEB is far from the
> upper limit of reliable erasure?=20
>    the answer is NO!=20

I would not be so sure. When UBI looses an erase counter because of an
unclean reboot, it assigns average erase counter to that eraseblock.
This works fine because UBI maintains a reasonably small Max-Min
difference.

Also, I am not sure it is save to erase one eraseblock several million
times and do not erase neighbor eraseblocks. There are "radiation"
effects in some flashes, when unused eraseblocks slowly "rot" when their
neighbor eraseblocks are used a lot.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
