Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQsWN-0006sl-MB
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 10:19:46 +0000
Date: Mon, 18 Dec 2017 11:19:19 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>
Subject: Re: [SPAM] Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171218111919.4309cea4@xps13>
In-Reply-To: <58014e55-ad67-5fcb-a2fb-947c17083ddb@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <75bd6b87-12ed-4003-262a-b1bd03a62cbd@prevas.dk>
 <20171212134706.49f3c57e@xps13>
 <2f16ce90-6e00-c95f-7a81-5603d9acf574@prevas.dk>
 <20171212143512.3b62d3f5@xps13>
 <48EEEC1C-954B-42E5-92BE-A00AD97A5789@prevas.dk>
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

On Mon, 18 Dec 2017 11:12:19 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> Hi Miquel
> >>>> https://gist.github.com/anonymous/08049fbb46bf6df2d24a07aab8783833 =
=20
> >>> This is really helpful. It shows the driver is the problem. I
> >>> don't know yet why it reads the NAND status instead of the actual
> >>> data at this moment. I am looking into it.
> >>>
> >>> I added one fixup in my github branch that could possibly help,
> >>> could you give it a try while I am going deeper in my research?
> >>>    =20
> >> Rebased on top of 8cec3f8653e0fe914d831f05cf91ab9face5c1a5
> >> The "print_req_error: I/O error, dev mtdblock1, sector 0" is gone
> >>
> >> And what you did have apperently fixed the issue with ecc.
> >> The driver is reading the bbt uboot have written :-)
> >>
> >> https://gist.github.com/anonymous/4476819c081896e5e265b3282db52e46 =20
> > That is good news but can you please also do a dump without -n but
> > with -o, it failed in this configuration until now and if I am not
> > doing any mistake, you did not try this with the last fix? =20
> Last fix?
> I have rebase my kernel on top of marvell/nand-next/nfc-rework
> 8cec3f865

Ok that should be fine!

I have added another fix just now for the same problem on write side.

I did not spot all of that because I only worked with NAND chips
bigger than 2k, where read/writes are split.

Thank you very much for your time.
Miqu=C3=A8l
