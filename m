Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBH7p-0006ZF-88
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 08:17:22 +0000
Subject: Re: [PATCH RESEND v3] mtd: spi-nor: fix flags for s25fl128s
To: Marek Vasut <marek.vasut@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
References: <4d3db993-d030-3659-2f62-94c373f57038@gmail.com>
 <808bf727-f562-79d4-a60f-5e437cc15da6@gmail.com>
 <514b12c9-447b-1688-29d3-aac839de08ac@gmail.com>
 <5d633567-ca28-abe6-2789-ba9291e4eaf1@gmail.com>
CC: Jagan Teki <jteki@openedev.com>, Brian Norris
 <computersforpeace@gmail.com>, MTD Mailing List
 <linux-mtd@lists.infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <973bf15c-62ae-4659-4f5e-d68e2423f4a2@atmel.com>
Date: Mon, 28 Nov 2016 09:16:58 +0100
MIME-Version: 1.0
In-Reply-To: <5d633567-ca28-abe6-2789-ba9291e4eaf1@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 29/10/2016 à 19:54, Marek Vasut a écrit :
> On 10/27/2016 11:13 PM, Heiner Kallweit wrote:
>> The Spansion S25FL128S also supports dual read mode.
>> In addition remove flag SECT_4K. 4K erases are supported,
>> but not uniformly.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> Reviewed-by: Jagan Teki <jteki@openedev.com>
> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> 
Applied to git://github.com/spi-nor/linux.git

Thanks!
