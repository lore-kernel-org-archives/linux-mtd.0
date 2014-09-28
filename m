Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYAFK-0005zj-Ua
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 08:54:23 +0000
Message-ID: <5427CCA4.6060909@codeaurora.org>
Date: Sun, 28 Sep 2014 11:53:56 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [RFC/PATCH 5/5] mtd: ubi: Add sysfs entry to force all pebs' scan
References: <1411886287-8947-1-git-send-email-tlinder@codeaurora.org>
 <CAFLxGvz5RXmC3vuCWkNSiAn91j6dC_9Q9XF3njObb_jBbL-ohw@mail.gmail.com>
In-Reply-To: <CAFLxGvz5RXmC3vuCWkNSiAn91j6dC_9Q9XF3njObb_jBbL-ohw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Pratibhasagar V <pratibha@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, dedeking1@gmail.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/28/2014 11:42 AM, Richard Weinberger wrote:
> Tanya,
>
> On Sun, Sep 28, 2014 at 8:38 AM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
>> A given eraseblock can be read many times or not at all.
>> We do not have the account of such eraseblocks that have
>> not been accessed since a pre-defined threshold interval.
>> By means of scanning the entire flash device it is possible to identify
>> all such eraseblocks.
>>
>> Add a sysfs entry to force scan on all the PEBs on demand basis.
>>
>> The sysfs entry would be available under /sys/class/ubi/ubiX/peb_scan
>>   - echo 1 to this entry would trigger the scan, ignored if in progress
>>   - On reading returns the scan status (1 = Scan executing, 0 = Scan not
>>     executing)
>
> Did you see that?
> http://linux-kernel.2935.n7.nabble.com/RFC-UBI-bitrot-checking-td949453.html
> Maybe we can combine our work.
> Although your patch seems to be in better shape than mine. :)

oh, I'm sorry, missed that (its new :) )
this patch was tested thoroughly and working. I would appreciate if you 
could review this patch and perhaps we could improve it if required.


-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation
