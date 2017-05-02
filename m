Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5QfQ-0006AA-8s
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 05:48:10 +0000
Subject: Re: [PATCH] mtd: nand: gpio: make nCE GPIO optional
To: Brian Norris <computersforpeace@gmail.com>
References: <20170210140110.87903682E7@localhost.localdomain>
 <20170501214627.GB140640@google.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Christophe LEROY <christophe.leroy@c-s.fr>
Message-ID: <e35093cc-f5f0-f561-10cb-40d5a141e819@c-s.fr>
Date: Tue, 2 May 2017 07:47:40 +0200
MIME-Version: 1.0
In-Reply-To: <20170501214627.GB140640@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Le 01/05/2017 à 23:46, Brian Norris a écrit :
> On Fri, Feb 10, 2017 at 03:01:10PM +0100, Christophe Leroy wrote:
>> On some hardware, the nCE signal is wired to the ChipSelect associated
>> to bus address of the NAND, so it is automatically driven during the
>> memory access and it is not managed by a GPIO.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> Not really a problem with this patch exactly, but FYI you're only making
> this optional for the non-DT case. For device tree, this is kinda hard
> to do, since the current binding suggests we retrieve the GPIOs based on
> index position, not by name. So if you leave one off...I guess we well
> just be off-by-1 on the indeces until we hit a non-optional one...which
> I guess is "CLE".
>
> If we wanted this to work for DT, we'd need to extend this driver (and
> binding doc) to support requesting GPIOs by name.
>

It works for me with devicetree.

I have the following definition in my DT:

		nand@1,0 {
			compatible = "gpio-control-nand";
			reg = <1 0x0 0x01>;
			#address-cells = <1>;
			#size-cells = <1>;
			gpios = <&qe_pio_c 24 1 	// RDY
				 0			// nCE
				 &qe_pio_c 26 1		// ALE
				 &qe_pio_c 25 1		// CLE
				 0>;			// nwp
		};

Christophe
