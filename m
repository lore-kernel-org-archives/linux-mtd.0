Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y91SD-0007Sg-Q0
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 01:00:03 +0000
Message-ID: <54ADD298.9050806@cn.fujitsu.com>
Date: Thu, 8 Jan 2015 08:43:04 +0800
From: Gu Zheng <guz.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RESEND PATCH 1/3] mtd:mtdblock: remove the needless mtdblks_lock
References: <547E7348.5020204@cn.fujitsu.com>
 <20150107205926.GO9759@ld-irv-0074>
In-Reply-To: <20150107205926.GO9759@ld-irv-0074>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
On 01/08/2015 04:59 AM, Brian Norris wrote:

> On Wed, Dec 03, 2014 at 10:19:52AM +0800, Gu Zheng wrote:
>> The global lock mtdblks_lock was used to protect the original mtdblks
>> array to avoid race conditions. As the mtdblks array was already gone,
>> but the mtdblks_lock is left, and it causes latency when open/release dev.
>> So we need to remove it here.
>>
>> Signed-off-by: Gu Zheng <guz.fnst@cn.fujitsu.com>
> 
> Pushed this first patch to l2-mtd.git. Thanks!

Thanks.

> 
> I'm kinda ambivalent about the next two. They don't seem like necessary
> cleanups, really. With the third patch, I think it's actually pretty
> important that the caller understand that it's using container_of(). I
> could be convinced otherwise though...

OK.

Regards,
Gu

> 
> Brian
> 
