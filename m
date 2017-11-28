Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJfX9-0008IU-74
 for linux-mtd@lists.infradead.org; Tue, 28 Nov 2017 13:02:49 +0000
Date: Tue, 28 Nov 2017 14:02:10 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech \(KREV\)" <krev@triax.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171128140210.34215e19@xps13>
In-Reply-To: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sean,

> I'm currently in the process of doing bringup on a custom armada 38x
> board. During the firsts boots of the Linux kernel we saw that the
> NAND driver throws a lot of timeout messages.
>=20
> Like this:
> [ 28.321054] pxa3xx-nand f10d0000.flash: Wait time out!!!
> [ 28.521054] pxa3xx-nand f10d0000.flash: Wait time out!!!
> [ 28.721054] pxa3xx-nand f10d0000.flash: Wait time out!!!

Could you paste the entire dmesg please ?

Also, what kernel are you using ?

>=20
> That lead me to investigate the issue and found this thread (quite
> old): https://www.spinics.net/lists/arm-kernel/msg488581.html
>=20
> In the thread some is describing a possible race condition when the
> NAND framework is scanning for bad blocks.

Not sure this is still relevant, but, who knows.


Thanks,
Miqu=C3=A8l
