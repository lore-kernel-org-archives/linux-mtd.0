Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRdzC-0001jT-Lu
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 11:23:51 +0000
Message-ID: <5795F6AE.8070508@mentor.com>
Date: Mon, 25 Jul 2016 16:53:26 +0530
From: Rajeev Kumar <rajeev_kumar@mentor.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>
CC: <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] MTD: UBI: speed up init by moving status messages
 to debugfs
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <5795EA91.2030304@nod.at>
In-Reply-To: <5795EA91.2030304@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard

On 07/25/2016 04:01 PM, Richard Weinberger wrote:
> Rajeev,
>
> Am 25.07.2016 um 11:46 schrieb Rajeev Kumar:
>> This patch simply moves the verbose status messages associated with
>> UBI's fastmap feature to debugfs, thereby decreasing UBI
>> initialization time from 97 mS to 16 mS. Note that the first time
>> fastmap is invoked, building the fastmap took 146 mS. In order to
>> reproduce the test conditions, build with CONFIG_MTD_UBI_FASTMAP=y and
>> CONFIG_DYNAMIC_DEBUG=y and append the following to bootargs:
>>
>> initcall_debug ubi.mtd=0 ubi.fm_autoconvert=1
>>
>> ubi.mtd=0 is needed at every boot if you want ubi to be
>> autoloaded. ubi.fm_autoconvert switch is needed only once, when
>> fastmap is created.
>
> So, you're working on a system which has to boot as fast as possible
> and writing kernel logs hurts the performance. (Slow UART?)
> Why do you change logging only in UBI (Fastmap)? Many other subsystems
> print during boot and would also hurt the performance.
> In such a situation I'd assume that changing the kernel log level or
> using the quiet kernel parameter would help more.
>

Agreed, but the question is do we really need these all values for 
UBI(Fastmap) on console every time system is booted ?

Thanks
~Rajeev

> Thanks,
> //richard
>
