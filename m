Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N1CuS-0004PG-3m
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 05:42:00 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KRY00GI3D5RSO@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 14:41:51 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KRY00C3TD5PQ6@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 14:41:51 +0900 (KST)
Date: Fri, 23 Oct 2009 11:11:52 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH v5 2/3] MTD: OneNAND: multiblock erase support
To: Artem.Bityutskiy@nokia.com,
	"Korhonen Mika.2 (EXT-Ardites/Oulu)" <ext-mika.2.korhonen@nokia.com>
Message-id: <CCC9B5EE92E54F5F90437EBBE209AACE@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4ADDB69F.7060606@nokia.com> <1256272454.29885.198.camel@localhost>
Cc: amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mika,

Do you have any use case for using multiblock erase.


Thanks
Amit
----- Original Message ----- 
From: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
To: "Korhonen Mika.2 (EXT-Ardites/Oulu)" 
<ext-mika.2.korhonen@nokia.com>
Cc: <amul.saha@samsung.com>; <kyungmin.park@samsung.com>; 
<linux-mtd@lists.infradead.org>; "Adrian Hunter" 
<adrian.hunter@nokia.com>
Sent: Friday, October 23, 2009 10:04 AM
Subject: Re: [PATCH v5 2/3] MTD: OneNAND: multiblock erase 
support


> On Tue, 2009-10-20 at 16:09 +0300, Adrian Hunter wrote:
>> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
>> > Add support for multiblock erase command. OneNANDs 
>> > (excluding Flex-OneNAND)
>> > are capable of simultaneous erase of up to 64 
>> > eraseblocks which is much faster.
>> >
>> > This changes the erase requests for regions covering 
>> > multiple eraseblocks
>> > to be performed using multiblock erase.
>> >
>> > Signed-off-by: Mika Korhonen 
>> > <ext-mika.2.korhonen@nokia.com>
>> > ---
>>
>> Just a comment about fail_addr
>
> Mika, are you planning to amend this and re-send?
>
> -- 
> Best Regards,
> Artem Bityutskiy (????? ????????)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
