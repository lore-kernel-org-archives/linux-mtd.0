Received: from mail-fx0-f48.google.com ([209.85.161.48])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSryW-00009d-Cz
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 14:05:03 +0000
Received: by fxm2 with SMTP id 2so2065144fxm.21
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 06:04:58 -0800 (PST)
Subject: Re: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command
	line partitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <20101213122051.20685.46383.sendpatchset@ahunter-work.research.nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
	<20101213122051.20685.46383.sendpatchset@ahunter-work.research.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Dec 2010 16:04:29 +0200
Message-ID: <1292421869.2512.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-12-13 at 14:20 +0200, Adrian Hunter wrote:
> From d27a88c5f9f18a7c38784c085889c3e1053340cf Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <adrian.hunter@nokia.com>
> Date: Wed, 30 Dec 2009 07:40:16 +0100
> Subject: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line partitioning
> 
> Add the ability to parse MTD partition information from the
> kernel command line.
> 
> Note that a pointless BUG_ON is removed, as are redundant
> calls to 'del_mtd_partitions()' and 'del_mtd_device()'
> because they are also done by 'onenand_release()'.
> 
> Finally note that 'add_mtd_device()' returns 1 on failure
> so the error condition was incorrect.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>

I've pushed patches 1 and 7 to l2-mtd-2.6, but patch #2 is not
applicable. I think this is because of changes Kyungmin made recently.
Could you please re-send patches 2 and 3 on top of the l2 tree?

I guess I can apply 2 and 3 now. Patch 4 should wait for comments from
Tony, AFAICS. Patches 5 and 6 are dependent, and hence should wait as
well, AFAICS.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
