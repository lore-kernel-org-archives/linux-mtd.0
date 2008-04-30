Received: from mail1.sea5.speakeasy.net ([69.17.117.3])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JrInv-00017Q-2J
	for linux-mtd@lists.infradead.org; Wed, 30 Apr 2008 20:21:27 +0000
Date: Wed, 30 Apr 2008 13:19:34 -0700 (PDT)
From: Trent Piepho <xyzzy@speakeasy.org>
To: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: [PATCH] nand_wait_ready() timeout scaling
In-Reply-To: <4818CC89.2010106@isoar.ca>
Message-ID: <Pine.LNX.4.64.0804301318110.32329@t2.domain.actdsltmp>
References: <1209583375-11136-1-git-send-email-andrewm@isoar.ca>
	<4818CC89.2010106@isoar.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 Apr 2008, Andrew E. Mileski wrote:
> Andrew E. Mileski wrote:
>> The nand_wait_ready() timeout was hardcoded to 2 jiffies, which does not
>> scale with the system timer frequency.  Using a guess of a 250 Hz system
>> timer frequency, I believe the timeout was meant to be 8 ms.  This patch
>> sets an 8 ms timeout that scales with the system timer frequency.
>>
>> Tested with a 1000 Hz system timer frequency and with a device requiring
>> at least a 3 ms timeout.
>
> Just realized that 100 Hz systems would have a problem with this patch
> since (100 * 8) / 1000 = 0.  Guess the simple solution is to make the
> timeout 10 ms.

msecs_to_jiffies() is what you want to use.
