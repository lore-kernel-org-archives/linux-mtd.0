Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyfQk-0002WA-7O
 for linux-mtd@lists.infradead.org; Thu, 13 Apr 2017 14:09:04 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>, Campbell
 <ijc+devicetree@hellion.org.uk>, "richard@nod.at" <richard@nod.at>, "Mark
 Rutland" <mark.rutland@arm.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "galak@codeaurora.org" <galak@codeaurora.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Thu, 13 Apr 2017 14:08:17 +0000
Message-ID: <e8e5fb5458e04c07896598baae1420da@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
 <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
 <20170322155216.319efc3e@bbrezillon>
 <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
 <20170411145102.563fa388@bbrezillon>
 <90300f14cd2a4ae6967d8be0f7dff4e9@SIWEX5A.sing.micron.com>
 <20170411173051.7aafb717@bbrezillon>
 <5a96e73ef951414a82c01b67088b24d3@SIWEX5A.sing.micron.com>
 <20170412090313.539f81b2@bbrezillon>
In-Reply-To: <20170412090313.539f81b2@bbrezillon>
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

Hi, Boris

>One last question. Is it dangerous to call
>SET_FEATURE(disable/enable-ECC) on a NAND that has ECC enabled by default?
>We could use that to detect whether on-die ECC can be turned off or not an=
d
>adjust the chip->ecc init steps accordingly.
>
No any danger exist, NAND just gives response that set feature failed.
Also, it is a good solution to detect whether on-die ECC support or not thr=
ough
SET_FEATURE(disable/enable-ECC) successful or not.

>Thanks,
>
>Boris

Happy Easter!
//Bean
