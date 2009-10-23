Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N1FZy-00015T-E2
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 08:33:03 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KRY00567L2U7T@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 17:32:55 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KRY002H7L2S68@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 17:32:54 +0900 (KST)
Date: Fri, 23 Oct 2009 14:03:02 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH v5 2/3] MTD: OneNAND: multiblock erase support
To: Adrian Hunter <adrian.hunter@nokia.com>,
	"Korhonen Mika.2 (EXT-Ardites/Oulu)" <ext-mika.2.korhonen@nokia.com>
Message-id: <3AF129BF059348D6B4912F6DB21DA9B2@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4ADDB69F.7060606@nokia.com> <1256272454.29885.198.camel@localhost>
	<CCC9B5EE92E54F5F90437EBBE209AACE@sisodomain.com>
	<4AE147B9.4020409@nokia.com> <4AE164AE.80304@nokia.com>
Cc: amul.saha@samsung.com,
	"Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
>> ext Amit Kumar Sharma wrote:
>>> Hi Mika,
>>>
>>> Do you have any use case for using multiblock erase.
>>>
>>>
>>> Thanks
>>> Amit
>>>
>> Yes, e.g. during development/loop testing we need to 
>> flash a new system on an MTD partition.
>> The (UBIFS) system could be tiny but the partition large 
>> in which case the erase time becomes even more 
>> significant.
>> Even in more usual cases of reflashing a bigger system 
>> this gives ca. 5 % speed improvement.
>>
>> Mika
>>
>
> However the API is imperfect because AFAICT OneNAND 
> multiblock erase
> does not require that the blocks are sequential i.e. any 
> 64 eraseblocks
> from the same chip can be erased together.  So we would 
> really need an
> 'erasev()' API to take complete advantage of it.
>
I feel we should have a use case for multi block erase for 
UBI wear leveling.
it is just a opinion.
Multi block erase can  be useful if implement 'erasev' api 
at file system level.

Thanks
Amit 
