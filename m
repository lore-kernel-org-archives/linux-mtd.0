Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MseTr-0002WL-D2
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 15:19:11 +0000
Message-ID: <4AC2247F.3030100@gmail.com>
Date: Tue, 29 Sep 2009 18:15:11 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: David Lambert <dave@lambsys.com>
Subject: Re: Long attach times attaching MTD to UBI
References: <4AC113E8.2030405@lambsys.com> <4AC1F018.5000207@nokia.com>
In-Reply-To: <4AC1F018.5000207@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/29/2009 02:31 PM, Adrian Hunter wrote:
> David Lambert wrote:
>> Please excuse me if this is a naive question as I am a newbie to MTD
>> and flash file systems.
>>
>> I am attempting to enable UBIFS on an Atmel AT91RM9200 using kernel
>> version 2.6.30.1. One of the attractions was fast mount times compared
>> to JFFS2 etc. Unfortunately I am running into VERY long attach times
>> as witnessed below. Obviously I must be doing something very wrong as
>> the documentation indicates that attaching a 1G partition should take
>> around 2 seconds, but mine is over 8 minutes!
>
> Is your NAND slow? Have you configured UBI debugging checks turned on?

Please, measure your nand throughput withmtd_speedtest:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
