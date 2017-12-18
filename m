Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQsyK-0004BN-LD
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 10:48:38 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
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
 <20171218111919.4309cea4@xps13>
 <d6dce58e-49e5-3a21-2e37-415ec7b0cb95@prevas.dk>
 <20171218114546.67d0b44f@bbrezillon>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <7986bc6b-c723-d7c1-5b7a-5ca51702786f@prevas.dk>
Date: Mon, 18 Dec 2017 11:48:16 +0100
MIME-Version: 1.0
In-Reply-To: <20171218114546.67d0b44f@bbrezillon>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris
>> Will this be ready for 4.16?
> If no one is complaining about regressions with the new driver, then
> yes, it will be queued to the nand/next branch targeting 4.16.
>
>> What would you recommend, running with these patches
>> on top af 4.14 LTS or just stick with the pxa3xx driver?
> Depends whether the old driver works fine on your board or not.
> Backporting is likely to be painful because of the ->exec_op()
> infrastructure which was introduced recently, but if it solves issues
> you had with the old driver, then it's worth it.
Your newly submitted patch fixes our issues :-)
[PATCH] mtd: nand: pxa3xx: Fix READOOB implementation

Thanks
/Sean
