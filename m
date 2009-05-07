Received: from smtpauth01.csee.onr.siteprotect.com ([64.26.60.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2CDg-0000lt-2E
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 22:37:53 +0000
Message-ID: <4A0362A5.3010101@boundarydevices.com>
Date: Thu, 07 May 2009 15:37:25 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page
	NAND chips
References: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>	<200905070016.52356.david-b@pacbell.net>	<7A436F7769CA33409C6B44B358BFFF0C0112FC6CF5@dlee02.ent.ti.com>
	<200905071011.06812.david-b@pacbell.net>
In-Reply-To: <200905071011.06812.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>, "Narnakaje,
	Snehaprabha" <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>> +static struct nand_ecclayout hwecc4_2048 __initconst = {
>>>> +       .eccbytes = 10,
>>> Not ".eccbytes = 40"?  This is 4 chunks, 10 ecc bytes each...
>> No, .eccbytes is for each chips->ecc.steps. 
> 
> So it's the same as ecc.bytes, which is not exported to userspace.
> 
> 
>> And all nand read/write 
>> APIs, we handle ecc.steps (for loop). There is chips->ecc.total that
>> is initialized as (chips->ecc.steps * chips->ecc.bytes).  
>>
>> It is strange that .eccbytes is for each chunk, while eccpos[] and
>> .oobfree[] have to handle/cover all chunks. 

No, eccbytes should equal ecc.total


i.e. from nand_base.c

static struct nand_ecclayout nand_oob_64 = {
        .eccbytes = 24,
        .eccpos = {
                   40, 41, 42, 43, 44, 45, 46, 47,
                   48, 49, 50, 51, 52, 53, 54, 55,
                   56, 57, 58, 59, 60, 61, 62, 63},
        .oobfree = {
                {.offset = 2,
                 .length = 38}}
};
Troy
