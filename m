Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQumB-0007FK-30
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 12:44:13 +0000
Date: Mon, 18 Dec 2017 13:43:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171218134328.5a47d8d9@bbrezillon>
In-Reply-To: <7986bc6b-c723-d7c1-5b7a-5ca51702786f@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171212192327.57b1fa80@xps13>
 <9f578b28-ef3b-8e84-0a8c-b70c494efff0@prevas.dk>
 <20171213094105.73646658@xps13> <20171215182512.2449af9e@xps13>
 <45D7D798-BA86-41CD-AB56-156C1BD7FCC4@prevas.dk>
 <20171215201955.2431195c@xps13>
 <7892957c-273b-ea58-1d50-b35e70c69e02@prevas.dk>
 <20171217141916.04e377ab@bbrezillon>
 <461b45a8-de1f-0b54-567f-001ea30ee927@prevas.dk>
 <20171217230032.30853780@bbrezillon>
 <D17E776C-669D-4C40-B673-CBE7CE5D08F6@prevas.dk>
 <20171217231952.74637510@xps13>
 <4e25e578-f0a6-89a0-b6f8-98bda37d12de@prevas.dk>
 <20171218095609.30408c57@xps13>
 <a60415ac-061a-8177-dff8-da16727a236a@prevas.dk>
 <20171218103518.4d2f2009@xps13>
 <58014e55-ad67-5fcb-a2fb-947c17083ddb@prevas.dk>
 <20171218111919.4309cea4@xps13>
 <d6dce58e-49e5-3a21-2e37-415ec7b0cb95@prevas.dk>
 <20171218114546.67d0b44f@bbrezillon>
 <7986bc6b-c723-d7c1-5b7a-5ca51702786f@prevas.dk>
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

On Mon, 18 Dec 2017 11:48:16 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> Hi Boris
> >> Will this be ready for 4.16? =20
> > If no one is complaining about regressions with the new driver, then
> > yes, it will be queued to the nand/next branch targeting 4.16.
> > =20
> >> What would you recommend, running with these patches
> >> on top af 4.14 LTS or just stick with the pxa3xx driver? =20
> > Depends whether the old driver works fine on your board or not.
> > Backporting is likely to be painful because of the ->exec_op()
> > infrastructure which was introduced recently, but if it solves issues
> > you had with the old driver, then it's worth it. =20
> Your newly submitted patch fixes our issues :-)
> [PATCH] mtd: nand: pxa3xx: Fix READOOB implementation

Can you add your Tested-by?

>=20
> Thanks
> /Sean
