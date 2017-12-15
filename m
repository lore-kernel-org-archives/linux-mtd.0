Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePvAo-0006tH-D3
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 18:57:40 +0000
Date: Fri, 15 Dec 2017 19:56:27 +0100
In-Reply-To: <20171215182512.2449af9e@xps13>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171211105359.7eb1aeb3@xps13>
 <d0dee517-8061-5d40-aa82-6d4c5cda4fb1@prevas.dk>
 <a2502de6-b4c7-befb-6a08-de976be85d17@prevas.dk>
 <f70d94b8-5fc7-d091-9a5c-77597d2b7aa4@prevas.dk>
 <20171211150200.51c7f3b4@xps13> <20171211150929.722a361a@xps13>
 <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
 <20171212095119.475de032@xps13>
 <727489cf-d1f6-8777-c6f4-981127657c9d@prevas.dk>
 <20171212111227.4946cc15@xps13>
 <e9e6bf70-918f-b750-5893-55744dc34882@prevas.dk>
 <20171212120806.7c31463f@xps13>
 <a0267c71-4333-7dd4-dcf4-14aced37f8f9@prevas.dk>
 <20171212123523.48185f21@xps13>
 <75bd6b87-12ed-4003-262a-b1bd03a62cbd@prevas.dk>
 <20171212134706.49f3c57e@xps13>
 <2f16ce90-6e00-c95f-7a81-5603d9acf574@prevas.dk>
 <20171212143512.3b62d3f5@xps13>
 <48EEEC1C-954B-42E5-92BE-A00AD97A5789@prevas.dk>
 <20171212192327.57b1fa80@xps13>
 <9f578b28-ef3b-8e84-0a8c-b70c494efff0@prevas.dk>
 <20171213094105.73646658@xps13> <20171215182512.2449af9e@xps13>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Boris Brezillon <Boris.Brezillon@free-electrons.com>
From: =?ISO-8859-1?Q?Sean_Nyekj=E6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <45D7D798-BA86-41CD-AB56-156C1BD7FCC4@prevas.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hi Miquel

>I am very sorry for the delay but it took me some time to figure a way
>to reproduce your situation until I started doing the exact sequence I
>asked you to follow=2E It turns out there was a nasty error in the parser
>so you could not observe the last blocks of your chip because I messed
>up with high addresses=2E

Fantastic always nice to be able to reproduce the issue=2E Glad to be able=
 to help :-)

>
>I updated the Github branch [1], can you rebase on top of it? I think
>this time we should get something :)

I just did a quick boot with the new commits, and the kernel is able to fi=
nd the bbt table :-)

I also tried booting with ECC enabled and with that enabled the driver is =
unable to read the bbt and marked all blocks bad=2E

/Sean
