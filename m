Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1D2w-0001pA-Q5
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 05:18:35 +0000
Subject: Re: UBI - NAND Flash Programming
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Musch, Edwin" <musche@dataio.com>
In-Reply-To: <B538B21A486F9E4CBBE577217764F37701662A53@email2.dataio.internal>
References: <B538B21A486F9E4CBBE577217764F37701662A53@email2.dataio.internal>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 May 2009 08:18:15 +0300
Message-Id: <1241500695.3760.32.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-04 at 08:39 -0700, Musch, Edwin wrote:
> 
> Hello
> 
> I am from Data I/O. We produce mass production Flash programming equipment.
> We received a request from Keymile/Germany to support the UBI.
> 
> As you will know we need to program the raw NAND Flash the same way than the application is handling the NAND Flash ( bad blocks )
> 
> Could you please give me further information regarding the Bad Block Handling? Since we are programming the NAND Flash only once we are not worried about wear levelling.
> 

You have an UBI image, and you need to flash it to your device,
right?

> 1) If we detect a bad block where should we move the Data
>    a. SKIP: go on with the next good block - or
>    b. Put the Data into a reserved area
>       c. Please let me know where this area is defined

a).

> 2) Do I need to update the Main area if I move a block? - Is there a header?
> 3) Could you explain the info within the spare area? 
>    a. Do I need to update anything if I move a block to different location?
>    b. ECC - In case I need to update the main area - How is it done?

I do not really understand these questions, sorry.

> 4) Are there any dynamic table somewhere that needs to be updated - Bad block table?

There might be. It depends what you MTD driver chooses. See the
NAND_USE_FLASH_BBT option in the linux kernel. I personally never
used on-flash BBT.

Please, take a look here:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_format

The flashing algorithm is described there.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
