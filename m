Received: from mail-bw0-f67.google.com ([209.85.214.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSrsH-00071M-BM
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 13:58:34 +0000
Received: by bwz3 with SMTP id 3so701397bwz.6
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 05:58:30 -0800 (PST)
Subject: Re: [PATCH 7/7] mtd: OneNAND: lighten scary initial bad block messages
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <20101213122128.20685.9312.sendpatchset@ahunter-work.research.nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
	<20101213122128.20685.9312.sendpatchset@ahunter-work.research.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Dec 2010 15:58:01 +0200
Message-ID: <1292421481.2512.52.camel@localhost>
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

On Mon, 2010-12-13 at 14:21 +0200, Adrian Hunter wrote:
> From 5fa7a6377683aabd617f78518cd6cd49eae1679e Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <adrian.hunter@nokia.com>
> Date: Fri, 10 Dec 2010 12:04:20 +0200
> Subject: [PATCH 7/7] mtd: OneNAND: lighten scary initial bad block messages
> 
> Initial bad blocks are normal but the messages look like
> errors.  Make the messages less scary, make the main
> message an informational message not a warning, make the
> message displaying registers a debug message and include
> the address there instead of in the informational message.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>

Pushed this one to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
