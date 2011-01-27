Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PiPjy-00007P-Nd
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 11:10:15 +0000
Message-ID: <4D41528B.9030008@nokia.com>
Date: Thu, 27 Jan 2011 13:10:03 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: 4KiB page OneNAND OOB
References: <4D413FBC.4080403@nokia.com>
	<0a2301cbbe08$ea2d8a60$be889f20$%park@samsung.com>
In-Reply-To: <0a2301cbbe08$ea2d8a60$be889f20$%park@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 'linux-mtd Mailing List' <linux-mtd@lists.infradead.org>,
	'Kyungmin Park' <kmpark@infradead.org>,
	"'Tereshonkov Roman \(Nokia-D/Helsinki\)'" <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27/01/11 11:59, Kyungmin Park wrote:
> Hi Adrian,
>
> Umm strange, I also got the 4KiB page OneNAND, but it has 4 bytes free from
> 2 at each spare area, So current code is right.
>
> 8011h 10022h Managed by internal ECC logic
> 8012h 10024h Managed by internal ECC logic
>

OK.  We have:

8010h 10020h                                BI
8011h 10022h                  Managed by Internal ECC logic
8012h 10024h Reserved for the internal use          Managed by Internal ECC logic
8013h 10026h    4bit ECC parity values              Reserved for the internal use
8014h 10028h                      4bit ECC parity values
8015h 1002Ah                      4bit ECC parity values
8016h 1002Ch                      4bit ECC parity values
8017h 1002Eh                      4bit ECC parity values

I will make a patch that will let the board select the 3-byte  free option.

> Thank you,
> Kyungmin Park
>
> -----Original Message-----
> From: Adrian Hunter [mailto:adrian.hunter@nokia.com]
> Sent: Thursday, January 27, 2011 6:50 PM
> To: Kyungmin Park; Kyungmin Park
> Cc: linux-mtd Mailing List; Tereshonkov Roman (Nokia-D/Helsinki)
> Subject: 4KiB page OneNAND OOB
>
> Hi
>
> Current onenand_base.c has
>
> /**
>    *  onenand_oob_128 - oob info for Flex-Onenand with 4KB page
>    *  For now, we expose only 64 out of 80 ecc bytes
>    */
> static struct nand_ecclayout onenand_oob_128 = {
> 	.eccbytes	= 64,
> 	.eccpos		= {
> 		6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
> 		22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
> 		38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
> 		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
> 		70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
> 		86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
> 		102, 103, 104, 105
> 		},
> 	.oobfree	= {
> 		{2, 4}, {18, 4}, {34, 4}, {50, 4},
> 		{66, 4}, {82, 4}, {98, 4}, {114, 4}
> 	}
> };
>
> but our manual for a 4KiB Samsung OneNAND specifies
> that each 512 byte sector has 16 bytes of OOB
>
> 0-1 bad block info
> 2-3 free
> 5-6 reserved
> 7-15 ecc
>
> which implies ecc layout should be as follows for
> 4KiB pageOneNAND.
>
> /**
>    *  onenand_oob_128 - oob info for Onenand with 4KB page
>    *  For now, we expose only 64 out of 72 ecc bytes
>    */
> static struct nand_ecclayout onenand_oob_128 = {
> 	.eccbytes	= 64,
> 	.eccpos		= {
> 		7, 8, 9, 10, 11, 12, 13, 14, 15,
> 		23, 24, 25, 26, 27, 28, 29, 30, 31,
> 		39, 40, 41, 42, 43, 44, 45, 46, 47,
> 		55, 56, 57, 58, 59, 60, 61, 62, 63,
> 		71, 72, 73, 74, 75, 76, 77, 78, 79,
> 		87, 88, 89, 90, 91, 92, 93, 94, 95,
> 		103, 104, 105, 106, 107, 108, 109, 110, 111,
> 		119
> 		},
> 	.oobfree	= {
> 		{2, 3}, {18, 3}, {34, 3}, {50, 3},
> 		{66, 3}, {82, 3}, {98, 3}, {114, 3}
> 	}
> };
>
> Do 4KiB OneNANDs need a different onenand_oob_128 from
> FlexOneNAND?
>
>
> Regards
> Adrian
>
>
