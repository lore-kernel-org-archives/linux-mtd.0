Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZU2I5-0007VP-Uh
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 00:40:42 +0000
Message-ID: <55DBB80E.9080100@cn.fujitsu.com>
Date: Tue, 25 Aug 2015 08:34:22 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] ubi: do not re-read the data already read out in retry
References: <1440143981-20826-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55D6ECC4.5070503@nod.at> <55DA6DC8.9010308@cn.fujitsu.com>
 <55DABDBB.4080404@nod.at> <55DAC1E2.2040700@cn.fujitsu.com>
 <20150824165916.GG81844@google.com>
In-Reply-To: <20150824165916.GG81844@google.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/25/2015 12:59 AM, Brian Norris wrote:
> On Mon, Aug 24, 2015 at 03:04:02PM +0800, Dongsheng Yang wrote:
>> TBH, my customer send me this requirement and I cooked this patch
>> to them.
>
> Ah, so it's highly likely the driver is just terrible! In that case, I'd
> suggest a nice NAK, until we find a legitimate use case.

Agreed, thanx Brian.

Yang
>
> Regards,
> Brian
>
