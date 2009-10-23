Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1FDG-0007B1-Hw
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 08:09:35 +0000
Message-ID: <4AE164AE.80304@nokia.com>
Date: Fri, 23 Oct 2009 11:09:18 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "Korhonen Mika.2 (EXT-Ardites/Oulu)" <ext-mika.2.korhonen@nokia.com>
Subject: Re: [PATCH v5 2/3] MTD: OneNAND: multiblock erase support
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4ADDB69F.7060606@nokia.com> <1256272454.29885.198.camel@localhost>
	<CCC9B5EE92E54F5F90437EBBE209AACE@sisodomain.com>
	<4AE147B9.4020409@nokia.com>
In-Reply-To: <4AE147B9.4020409@nokia.com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
> ext Amit Kumar Sharma wrote:
>> Hi Mika,
>>
>> Do you have any use case for using multiblock erase.
>>
>>
>> Thanks
>> Amit
>>   
> Yes, e.g. during development/loop testing we need to flash a new system 
> on an MTD partition.
> The (UBIFS) system could be tiny but the partition large in which case 
> the erase time becomes even more significant.
> Even in more usual cases of reflashing a bigger system this gives ca. 5 
> % speed improvement.
> 
> Mika
> 

However the API is imperfect because AFAICT OneNAND multiblock erase
does not require that the blocks are sequential i.e. any 64 eraseblocks
from the same chip can be erased together.  So we would really need an
'erasev()' API to take complete advantage of it.
