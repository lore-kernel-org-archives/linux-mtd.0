Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6dvR-00081O-96
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 07:10:17 +0000
Received: by ewy3 with SMTP id 3so1706544ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 00:10:11 -0700 (PDT)
Subject: Re: [PATCH 0/2] UBIFS: fix error path in dbg_debugfs_init_fs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Phil Carmody <ext-phil.2.carmody@nokia.com>
In-Reply-To: <20110401100000.GA18707@esdhcp04044.research.nokia.com>
References: <1301642730-9582-1-git-send-email-dedekind1@gmail.com>
	<20110401100000.GA18707@esdhcp04044.research.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 10:07:42 +0300
Message-ID: <1301900862.2760.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 13:00 +0300, Phil Carmody wrote:
> On 01/04/11 10:25 +0300, Artem Bityutskiy wrote:
> > I was not completely happy about your fix and here is the fix I like
> > more. It consists of 2 patches - the first one is preparational and
> > the second one is the fix. Please, take a look.
> 
> The consolidation of the error paths certainly makes sense,
> and indeed makes the fix much more clinical. Fully approve.
> 
> Acked-by: Phil Carmody <ext-phil.2.carmody@nokia.com>

OK, thanks, pushed to ubifs-2.6.git tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
