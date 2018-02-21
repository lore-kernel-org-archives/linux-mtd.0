Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoLWW-0007Wh-4S
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 03:56:54 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C55378066C
 for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2018 16:45:56 +1300 (NZDT)
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Subject: Using mtd-physmap on parallel NOR device with gpio address muxing
Date: Wed, 21 Feb 2018 03:45:54 +0000
Message-ID: <c78fec5938654f87a7576ebc0e47414c@svr-chch-ex1.atlnz.lc>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=
=0A=
We have a custom board with a SoC with limited address space/pins on =0A=
it's local bus. Because of this we're restricted to connecting only =0A=
A0-24 to our parallel NOR flash devices. Because we want to have 128MB =0A=
of NOR flash on this device we've connected the A25 pin to a gpio. To =0A=
make use of this we've had to write our own mtd-map for this board.=0A=
=0A=
Is there any way of using a dts-aware map to support this kind of =0A=
arrangement? My rough way of summarizing the hardware design follows=0A=
=0A=
flash@e8000000 {=0A=
	compatible =3D "cfi-flash";=0A=
	reg =3D <0xe8000000 0x08000000>;=0A=
	bank-width =3D <2>;=0A=
	addr25-gpio =3D <&gpio0 6 GPIO_ACTIVE_HIGH>;=0A=
	partition@0 {=0A=
		...=0A=
	}=0A=
}=0A=
=0A=
Thanks,=0A=
Chris=0A=
