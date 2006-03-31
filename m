Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPEWD-0007AL-C8
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 02:58:11 -0500
Message-ID: <442CE0E8.1080105@yandex.ru>
Date: Fri, 31 Mar 2006 11:57:28 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	<20060330121156.GA31749@wohnheim.fh-wedel.de>
	<442CD1CB.7050509@intel.com>
In-Reply-To: <442CD1CB.7050509@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander Belyakov wrote:
>>> @@ -12,6 +12,9 @@
>>>  #ifdef CONFIG_MTD_PARTITIONS
>>>  #include <linux/mtd/partitions.h>
>>>  #endif
>>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>>> +#include <linux/mtd/stripe.h>
>>> +#endif
>>
>> Move the #ifdef into the header.
> 
> May I ask what is the reason for that (taking into account that 
> partitions.h is already included here the same way for the same purpose)?

Just in general, the

#ifdef EPRST
#include <elki-palki.h>
#endif

is not very nice. It is nicer to add the #ifdef protection in the header 
itself. This is not a major problem, but it is just nicer and Linux 
people like this. Just incapsulate all the protection in the header 
itself. Don't spread the protection over many .c files which may 
potentially want to include your header.


-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
