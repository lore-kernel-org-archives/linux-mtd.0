Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1gi-00029y-VG
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 21:19:42 +0000
Subject: Re: [PATCH 0/3] Virtual MTD concat device driver
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
 <20180906225949.48497cb5@bbrezillon> <20180906230314.4f7744a6@bbrezillon>
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Message-ID: <26fcb16f-381a-8e5a-f256-e06e05491485@nospam.obeliks.de>
Date: Thu, 6 Sep 2018 23:19:28 +0200
MIME-Version: 1.0
In-Reply-To: <20180906230314.4f7744a6@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

(sorry for the duplicate reply, the message to the list bounced because 
I had my mailer configured wrong)

On 06/09/18 23:03, Boris Brezillon wrote:
> On Thu, 6 Sep 2018 22:59:49 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>
>> Hi Bernhard,
>>
>> On Thu,  6 Sep 2018 18:14:10 +0200
>> Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote:
>>
>>> Hi everybody,
>>>
>>> when porting my router board from a mach-file based OpenWRT target to a
>>> device-tree based target, I found that there is no generic way to create
>>> a mtd_concat device from within the dts. The following patches attempt
>>> to provide that possibility.
>> There's a fundamental issue with this patch series: DT is supposed to
>> represent the hardware, not how you want to use it, and clearly, your
>> concatenated MTD dev is a virtual device, not a real one, so I doubt it
>> will pass DT maintainers' review.
> BTW, did you consider doing that through the command line?

Would you mind elaborating on that?

The biggest problem that I see is that I have to specify the fixed 
partitions somewhere, and I would really like to keep that in the dts 
file, where they would also be if it was only a single chip.

Best Regards
Bernhard
