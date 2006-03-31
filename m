Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPDVL-0005zd-3X
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 01:53:11 -0500
Message-ID: <442CD1CB.7050509@intel.com>
Date: Fri, 31 Mar 2006 10:52:59 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<20060330121156.GA31749@wohnheim.fh-wedel.de>
In-Reply-To: <20060330121156.GA31749@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Thu, 30 March 2006 11:57:37 +0400, Belyakov, Alexander wrote:
>> diff -uNr a/drivers/mtd/maps/mphysmap.c b/drivers/mtd/maps/mphysmap.c
>> --- a/drivers/mtd/maps/mphysmap.c	2006-03-28 12:08:28.000000000
>> +0400
>> +++ b/drivers/mtd/maps/mphysmap.c	2006-03-28 12:10:48.000000000
>> +0400
>> @@ -12,6 +12,9 @@
>>  #ifdef CONFIG_MTD_PARTITIONS
>>  #include <linux/mtd/partitions.h>
>>  #endif
>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>> +#include <linux/mtd/stripe.h>
>> +#endif
>
> Move the #ifdef into the header.

May I ask what is the reason for that (taking into account that 
partitions.h is already included here the same way for the same purpose)?

> Your code suffers from a lot of very basic things that make it hard to
> review.  

What exactly you wish to see here? Hope I can bring clarifications by 
changing code/comments or via this mailing list.

Thanks,
Alexander Belyakov
