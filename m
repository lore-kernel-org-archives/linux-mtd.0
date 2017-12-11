Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOLCl-0002IM-IM
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 10:22:07 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
 <20171129090305.0174246d@xps13>
 <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
 <20171130181847.0bbc58b5@xps13>
 <5bc5d326-af1f-44d2-468a-d211212c4612@prevas.dk>
 <20171201091539.5d6b7572@xps13>
 <744e99ee-91cf-28bc-21eb-c3fa01fb0a01@prevas.dk>
 <20171207213814.4c57098f@xps13>
 <26441ab5-8c70-4d7f-5e0d-bec3d59e2ef2@prevas.dk>
 <20171208102148.0a2c0fbe@xps13>
 <e1f47fe9-9b05-fdcd-b7ed-10e8cbced3a4@prevas.dk>
 <20171211105359.7eb1aeb3@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <d0dee517-8061-5d40-aa82-6d4c5cda4fb1@prevas.dk>
Date: Mon, 11 Dec 2017 11:20:40 +0100
MIME-Version: 1.0
In-Reply-To: <20171211105359.7eb1aeb3@xps13>
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

Hi Miquel,
> Actually, if you look carefully to the trace behind, you are not using
> the same bad block table with the bootloader ("Bad block table not
> found for chip 0") so the core then reads the OOB area of every first
> page for each block and looks at the first OOB bytes for the bad block
> markers. If there was data there, the block will be declared as bad.
With the new NFC driver, is the bad block table located elsewhere?
I have not done any changes to my bootloader when i did the switch to 
the new driver,
so i guess it should work as before.
> Can you please check that by using the configuration that actually
> boots and use nanddump in raw mode with the OOB area (options -n and -o)
> to show us the content of the first page of any block of the last NAND
> MTD device?
>
>
Will do

/Sean
