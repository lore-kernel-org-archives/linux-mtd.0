Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGEcS-0004RL-O3
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 01:09:46 +0000
From: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>
To: Pavel Machek <pavel@ucw.cz>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "cyrille.pitchen@atmel.com"
 <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mark.marshall@omicronenergy.com"
 <mark.marshall@omicronenergy.com>, "b44839@freescale.com"
 <b44839@freescale.com>, "prabhakar@freescale.com" <prabhakar@freescale.com>
Subject: Re: [PATCHv2] mtd: nand: fsl_ifc: fix handing of bit flips in erased
 pages
Date: Thu, 1 Jun 2017 01:09:17 +0000
Message-ID: <3ff6a5a52b4744caaa481d482cab54bd@svr-chch-ex1.atlnz.lc>
References: <20170419231804.5a04ed69@bbrezillon> <20170419221507.GA24914@amd>
 <20170420002748.5c76c9b9@bbrezillon> <20170420114057.GA4705@amd>
 <20170421105107.GA7259@amd> <20170517122224.GB583@amd>
 <20170517143211.205ff5de@bbrezillon> <20170517130059.GA3437@amd>
 <20170517152548.6d52c41b@bbrezillon> <20170517200305.GA12537@amd>
 <20170531205917.GA21878@amd>
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

Hi Pavel,=0A=
=0A=
Just a minor thing. Sorry about the late comment.=0A=
=0A=
On 01/06/17 08:59, Pavel Machek wrote:=0A=
> +=0A=
> +		res =3D check_erased_page(chip, buf);=0A=
> +		return res;=0A=
> +	}=0A=
=0A=
Can we just remove 'res' and change this line to:=0A=
	return check_erased_page(chip, buf);=0A=
=0A=
=0A=
=0A=
Cheers,=0A=
Darwin=0A=
