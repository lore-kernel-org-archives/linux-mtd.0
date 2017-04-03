Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cv0D6-00072s-Iq
 for linux-mtd@lists.infradead.org; Mon, 03 Apr 2017 11:31:50 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "Cyrille
 Pitchen" <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Campbell
 <ijc+devicetree@hellion.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, "galak@codeaurora.org"
 <galak@codeaurora.org>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Mon, 3 Apr 2017 11:31:05 +0000
Message-ID: <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
 <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
 <20170322155216.319efc3e@bbrezillon>
In-Reply-To: <20170322155216.319efc3e@bbrezillon>
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

Hi, Boris and Thomas

>>
>> Ok, but I recommend that 70s should be the first choice on this single
>> solution, it doesn't need to read twice to detect its bitflips count.
>
>That's exactly why we need to differentiate the 2 chips.

Sorry for later this response.=20
Below is the pseudo codes about how to differentiate these 2 series paralle=
l
NAND with on-die ECC:

if (NAND =3D=3D SLC ) { // on-die ECC only exists in SLC
//check device ID byte 4
     if ((ID.byte4 & 0x02) =3D=3D 0x02) {// internal ECC level =3D=3D10b
	if (ID.byte4 & 0x80) {//on-Die ECC enabled
                    if (ONFI.byte112 =3D=3D 4)
		 60s SLC NAND with on-die ECC
	    else if (ONFI.byte112 =3D=3D 8)
     	              70s SLC NAND with on-die ECC
	    else
                          Doesn't support on-die ECC
	}=09
	else
	  On-die ECC not enabled
     }
   else=20
        Doesn't support on-die ECC
}
else
   Doesn't support on-die ECC.

//beanhuo
