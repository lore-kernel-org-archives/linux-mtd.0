Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG9uS-0002yF-7A
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 17:58:57 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 sebastian.hesselbarth@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mtd: pxa3xx_nand: rework the timing setup
References: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
 <20150717134159.GC10608@kwain> <55A912F0.7080605@vanguardiasur.com.ar>
Date: Fri, 17 Jul 2015 19:55:29 +0200
In-Reply-To: <55A912F0.7080605@vanguardiasur.com.ar> (Ezequiel Garcia's
 message of "Fri, 17 Jul 2015 11:36:32 -0300")
Message-ID: <87h9p2is8e.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> Hi Antoine,
>
> On 07/17/2015 10:41 AM, Antoine Tenart wrote:
>> Hi guys,
>>
>> On Tue, Jul 07, 2015 at 05:08:23PM +0200, Antoine Tenart wrote:
>>>
>>> This series was part of a bigger one[1], which was split into smaller
>>> ones as asked by Ezequiel[2]. When we take this into account, this is
>>> v7. In addition, there was absolutely no comment for more than 1 month
>>> (since June 2nd). Given this, I really expect the series to be merge
>>> soon as other series are based on this.
>>
>> Any news on this series?
>>
>
> I'll try to take a look and do some testing over the weekend.
>
> Robert: think you can test this on a pxa board? I have one here,
> but it's non trivial for me to set it up.

Sure, if somebody sends patches to me, it's very easy and automated, so please
send the whole serie to robert.jarzmik@free.fr, and I'll reply to this mail with
the test result on both cm-x300 and zylonite board.

Cheers.

-- 
Robert
