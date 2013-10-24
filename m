Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZP9R-0000zZ-2w
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 17:56:53 +0000
Message-ID: <52695F49.20907@ti.com>
Date: Thu, 24 Oct 2013 23:26:25 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/5] mtd: m25p80: fix allocation size
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <20131024171729.GB20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131024171729.GB20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 24 October 2013 10:47 PM, Brian Norris wrote:
> On Wed, Oct 23, 2013 at 07:58:19PM -0700, Brian Norris wrote:
>> This patch fixes two memory errors:
>>
>> 1. During a probe failure (in mtd_device_parse_register?) the command
>>     buffer would not be freed.
>>
>> 2. The command buffer's size is determined based on the 'fast_read'
>>     boolean, but the assignment of fast_read is made after this
>>     allocation. Thus, the buffer may be allocated "too small".
>>
>> To fix the first, just switch to the devres version of kzalloc.
>>
>> To fix the second, increase MAX_CMD_SIZE unconditionally. It's not worth
>> saving a byte to fiddle around with the conditions here.
>>
>> This problem was reported by Yuhang Wang a while back.
>>
>> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
>> Reported-by: Yuhang Wang<wangyuhang2014@gmail.com>
>> Cc:<stable@vger.kernel.org>
> I pushed patches 1, 2, and 3 to l2-mtd.git (for Sourav's sake).
Thanks!
> I'll
> wait a little while on the others. Comments are still welcome on the
> whole series, though.
>
> Brian
