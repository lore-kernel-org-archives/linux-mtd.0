Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUaWZ-0002D4-0u
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 08:23:31 +0000
Received: by vws8 with SMTP id 8so1297007vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 01:23:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307606187.7374.36.camel@localhost>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
	<1307606187.7374.36.camel@localhost>
Date: Thu, 9 Jun 2011 12:23:28 +0400
Message-ID: <BANLkTi=hTm8QTnRwfmxHasDjYCRjoPGt-Q@mail.gmail.com>
Subject: Re: [PATCH 0/43 V2] mtd: simplify mtd partitions handling
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/9/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2011-06-08 at 20:05 +0400, Dmitry Eremin-Solenikov wrote:
>> Lots of mtd drivers have more or less the same common logic:
>> parse partitions, then register them. Currently this ends up
>> with lots of code duplication, each copy having it's own features
>> and bugs. In this patch serie I create a special function
>> (mtd_device_parse_register) which handles all issues with acquiring
>> partition information, registering mtd device(s) and returning correct
>> error code.
>>
>> Changes since V1:
>> - Added kerneldoc for mtd_device_parse_register
>> - removed lart.c patch (wrong commit message)
>> - dropped call to mtd_device_register from rbtx4939-flash
>> - small fixes within patches
>>
>> The following changes since commit
>> 1dc1d90aa53e6cec61f5369b6d1e185b3ef40c14:
>>
>>   mtd: davinci_nand: remove redundant mtd_device_unregister (2011-06-08
>> 18:00:41 +0300)
>>
>> are available in the git repository at:
>>   git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-parse-1st-2
>
> Pushed the series with minor tweaks to l2-mtd-2.6.git, thank you!

Thank you!

-- 
With best wishes
Dmitry
