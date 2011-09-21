Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6S5m-00047I-DL
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 19:04:23 +0000
Received: by ewy2 with SMTP id 2so1726817ewy.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 12:04:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFDOyVB2pu+bTzsr7ugjPdyRQiAYkm32LFChh0NVYfVGkQnz7g@mail.gmail.com>
References: <CAFDOyVAzYULUuJMCTAcaFjkxxnzJRudGc9219zNLH7urpCiJAw@mail.gmail.com>
	<CAN8TOE8s-DbYNWuDht0KhU3wbW-4owNHxgvv-m_mftRReUzhRg@mail.gmail.com>
	<CAFDOyVB2pu+bTzsr7ugjPdyRQiAYkm32LFChh0NVYfVGkQnz7g@mail.gmail.com>
Date: Wed, 21 Sep 2011 12:04:19 -0700
Message-ID: <CAN8TOE_0+xQ_jjkr3wKBrv9p9K2MqUJpXwpuart9+X5xPQj+fg@mail.gmail.com>
Subject: Re: measuring the flash usage
From: Brian Norris <computersforpeace@gmail.com>
To: Folkert van Heusden <folkert.van.heusden@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 20, 2011 at 11:47 PM, Folkert van Heusden
<folkert.van.heusden@gmail.com> wrote:
>>> On regular Linux systems one can look at /proc/diskstats to see how
>>> often the system writes to a disk. It seems though that (at least
>>> kernel 2.6.19) for flash these counters are not updated.
>>
>> I don't have much experience with the /proc/diskstats but for me, it
>> at least lists the mtdblockX devices I have on my system (which I
>> don't use). If you use those (for instance, for JFFS2?), then I would
>> imagine that Linux will track stats as with other block devices. Is
>> this not your experience?
>
> They're there, they just won't get updated.

As Artem said: "That will only account I/O via mtdblock, but not via
mtd devices". I'll assume that you are not doing I/O via mtdblock. In
that case, they shouldn't get updated.

>> Generally, MTD is pretty good at printing important messages, which
>> should get logged by your system. Also, bitflips/ECC errors can be
>> tracked with ioctl(ECCGETSTATS). This info is retrieved, for example,
>> by nanddump.
>
> Are these values retained accross power off/reboots?

No, ECC stats are only kept in memory.

> And will this work for NOR flash?

I doubt it! For one, I didn't think NOR flash used ECC, so there are
no such stats to track. Also, nanddump isn't intended for NOR flash.

Brian
