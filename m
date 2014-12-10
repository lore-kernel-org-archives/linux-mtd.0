Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XyUjx-0006yt-Qf
 for linux-mtd@lists.infradead.org; Wed, 10 Dec 2014 00:02:50 +0000
Message-ID: <54878D8B.70205@broadcom.com>
Date: Tue, 9 Dec 2014 16:02:19 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: implement common reboot notifier boilerplate
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
 <54815522.6000004@broadcom.com> <20141205180726.GN21347@ld-irv-0074>
In-Reply-To: <20141205180726.GN21347@ld-irv-0074>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ricard.wanderlof@axis.com, Artem Bityutskiy <dedekind1@gmail.com>,
 cdoban@broadcom.com, rjui@broadcom.com, richard.weinberger@gmail.com,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

I guess I'll leave this in your hands now unless there's anything else 
you need help will.

I don't see how this is controversial.  It is simply adding a reboot 
notifier so the MTD devices are shut down gracefully.  You already added 
it to NOR.  We're now just adding it generically for NAND and NOR.

Thanks,
  Scott

On 14-12-05 10:07 AM, Brian Norris wrote:
> On Thu, Dec 04, 2014 at 10:48:02PM -0800, Scott Branden wrote:
>> You need to change some spaces to tabs in the patch.
>
> Wow, sorry. I'm being very dense. I'll be sure to fix these up before
> applying.
>
>> Tested-by: Scott Branden <sbranden@broadcom.com>
>
> Thanks! I'll leave this for others to comment on, since this was
> seemingly controversial. Plus, I have plenty of other things to review
> for (maybe) 3.19 that have been around a lot longer than this, so these
> may delay until 3.20, given the nearness of the 3.19 merge window.
>
> Regards,
> Brian
>
