Received: from mail-qk0-f173.google.com ([209.85.220.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG6oP-0005EB-Cp
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 14:40:31 +0000
Received: by qkdv3 with SMTP id v3so70843383qkd.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2015 07:40:07 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] mtd: pxa3xx_nand: rework the timing setup
To: Antoine Tenart <antoine.tenart@free-electrons.com>,
 sebastian.hesselbarth@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
References: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
 <20150717134159.GC10608@kwain>
Cc: boris.brezillon@free-electrons.com, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <55A912F0.7080605@vanguardiasur.com.ar>
Date: Fri, 17 Jul 2015 11:36:32 -0300
MIME-Version: 1.0
In-Reply-To: <20150717134159.GC10608@kwain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Antoine,

On 07/17/2015 10:41 AM, Antoine Tenart wrote:
> Hi guys,
>
> On Tue, Jul 07, 2015 at 05:08:23PM +0200, Antoine Tenart wrote:
>>
>> This series was part of a bigger one[1], which was split into smaller
>> ones as asked by Ezequiel[2]. When we take this into account, this is
>> v7. In addition, there was absolutely no comment for more than 1 month
>> (since June 2nd). Given this, I really expect the series to be merge
>> soon as other series are based on this.
>
> Any news on this series?
>

I'll try to take a look and do some testing over the weekend.

Robert: think you can test this on a pxa board? I have one here,
but it's non trivial for me to set it up.

Thanks,
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
