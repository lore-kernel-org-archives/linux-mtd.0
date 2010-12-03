Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POSXp-0007Gz-NM
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 10:07:14 +0000
Date: Fri, 3 Dec 2010 11:07:19 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101203110719.3a9d14f2@wker>
In-Reply-To: <1291264926.14534.32.camel@koala>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Thu, 02 Dec 2010 06:42:06 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:
...
> Looking closer to my own code, I see that I treat PEB as
> "corrupted and should be preserved" if:
> 
> 1. EC header is OK.
> 2. VID header is corrupted.
> 3. data area is not "all 0xFFs".
> 
> And in 'nor_erase_prepare()' we first invalidate the VID header, and
> then invalidate the EC header. So there is a small window where you can
> end up with all 3 conditions to be true.
> 
> The solution is to first invalidate the EC header, and only then the VID
> header. Then in case of the race, we just lose the EC header, but VID
> header will be all-right, and UBI will handle this - it'll move the data
> from this PEB to another one, re-create EC header and use average EC
> count. But if you test this scenario, it will be great!!
> 
> This patch should help (compile-tested only).

This reset after clearing EC header and before clearing the VID
seems to be quite rare event. I tested with your patch and with
the mtd->writebuffer set to 64. Since no issues appeared while running
a nightly test (1662 test cycles succeeded), I interrupted the test
and simulated the reset in nor_erase_prepare() by adding a call of the
machine restart callback before clearing the VID header's magic:

nor_erase_prepare: ### RESET while clearing VID magic in peb # 149, off: 0xf6080000

After subsequent booting (reset simulation in nor_erase_prepare() has
been removed again) and mounting the partition I see following
message from wear_leveling_worker():

UBI: scrubbed PEB 149 (LEB 0:19), data moved to PEB 40

My question is: should this PEB really be preserved? I think, no.
It was prepared for erasure and would be entirely erased if no
interruption would occur.

Thanks,
Anatolij
