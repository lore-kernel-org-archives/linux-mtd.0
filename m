Received: from mail-fx0-f48.google.com ([209.85.161.48])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVPv1-0001CG-IM
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2010 14:43:56 +0000
Received: by fxm2 with SMTP id 2so5664657fxm.21
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2010 06:43:54 -0800 (PST)
Subject: Re: Huge ubi or ubifs sync slowdown since 2.6.32
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <201012211136.22254.manningc2@actrix.gen.nz>
References: <201012211136.22254.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Dec 2010 16:43:12 +0200
Message-ID: <1293028992.12773.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-12-21 at 11:36 +1300, Charles Manning wrote:
> Hi All
> 
> I've been looking into a ubifs performance regression on linux-omap 2.6.37.
> 
> My test is pretty simple, copy a 2Mbyte file and sync.
> 
> # sync; date; cp 2Mbyte-file foo; sync; date
> 
> On 2.6.32 and earler, the time between the two dates was around 3 seconds.
> On linux-omap master it is around 14 seconds. Ouch!
> 
> At first I thought the problem was due to changes in the OMAP nand drivers, 
> but raw randwrite speed is actually a bit faster. This suggest the finger 
> should be pointed at ubi or ubifs.
> 
> I then thought that perhaps the layout of my ubinized image might be a 
> contributing factor so I erased the partition, ubiformatted and ubimkvoled. 
> The problem persisted,
> 
> Any suggestions as to what might be broken or how to debug this deeper?

Can you try this on nandsim and see if there are still differences? You
can make nandsim slower by injecting an udelay somewhere. Try this on
your x86 host - this way you'll narrow this down to an OMAP-specific or
platform-independent problem.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
