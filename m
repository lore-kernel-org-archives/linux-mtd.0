Received: from yx-out-1718.google.com ([74.125.44.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L3Ses-0003Tm-FI
	for linux-mtd@lists.infradead.org; Fri, 21 Nov 2008 09:50:38 +0000
Received: by yx-out-1718.google.com with SMTP id 3so554893yxi.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Nov 2008 01:50:37 -0800 (PST)
Message-ID: <80b317760811210150w3886fe28jf1f2961360e081f5@mail.gmail.com>
Date: Fri, 21 Nov 2008 10:50:37 +0100
From: "Richard Genoud" <richard.genoud@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH] Bug on atmel_nand HW ECC : OOB info not correctly written
In-Reply-To: <80b317760810130844l53709cf8j284d81d432d2696e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1223793748.7110.13.camel@ubuntu>
	<1223906461.6770.604.camel@macbook.infradead.org>
	<20081013161353.38b8ff51@hskinnemo-gx745.norway.atmel.com>
	<80b317760810130844l53709cf8j284d81d432d2696e@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Justin Waters <justin.waters@timesys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/10/13 Richard Genoud <richard.genoud@gmail.com>:
> 2008/10/13 Haavard Skinnemoen <haavard.skinnemoen@atmel.com>:
>> I have no clue, I'm afraid. What's the difference between NAND_ECC_HW
>> and NAND_ECC_HW_SYNDROME?
>>
>> I do think I have a large page NAND flash available for testing though,
>> so I can do that. Will any potential problems be easy to spot?
>>
>> In other words: What are the consequences of this bug?
>>
>> Haavard
>>

hi !
Have you some feed-back on this patch ?
Justin tested it successfully with a Samsung K9F2G08U0M-PCB0 256 MiB
with 2048 Byte page size
and 128 KiB Erase Block size on an at91sam9260-ek.
