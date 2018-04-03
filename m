Subject: Re: [PATCH] mtd: nand: raw: atmel: add module param to avoid using dma
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Josh Wu <rainyfeeling@outlook.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
References: <20180329131054.22506-1-peda@axentia.se>
 <20180329153322.5e2fc1e7@bbrezillon>
 <ed87cf13-a69a-6115-f0a8-5f51c4957d1d@axentia.se>
 <20180329154416.5c1a0013@bbrezillon>
 <b740406a-e91c-67ad-24a3-cbdbe259d00d@axentia.se>
 <20180402142249.7e076a64@bbrezillon>
 <e0d9bd59-8031-e387-676e-dc5811170a0c@axentia.se>
 <20180402212843.164d5d21@bbrezillon>
 <8e35701f-1bfa-c9c0-62e6-48ed19d7ba37@axentia.se>
 <20180403071843.GI14180@piout.net>
From: Peter Rosin <peda@axentia.se>
Message-ID: <6a2b49fb-8e2c-ff76-4743-08f8d6a8d5e9@axentia.se>
Date: Tue, 3 Apr 2018 10:37:44 +0200
MIME-Version: 1.0
In-Reply-To: <20180403071843.GI14180@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-04-03 09:18, Alexandre Belloni wrote:
> On 02/04/2018 at 22:23:17 +0200, Peter Rosin wrote:
>>>> No, but did it again and checked, see transcript below.
>>>
>>> I don't use devmem2. Is 'readback' information accurate or is it
>>> always what's been written? Because when you write 0x33 to 0xFFFFECBC,
>>> 0x33 is read back, but just after that, when you read it again it's 0.
>>
>> Looking at the devmem2 source, it seems very likely that the compiler
>> optimizes out the read and thus outputs what has been written.
>>
> 
> At least on x86, it is not optimized out.

Looking at the disassembly, they are gone here (not that I'm fluent).
I then tried to compile devmem2 with -O0 (instead of -Os) and the read
is then fine. So, I guess the devmem2 devs could claim that it's a
buildroot issue, but a volatile would certainly have helped...

Cheers,
Peter
