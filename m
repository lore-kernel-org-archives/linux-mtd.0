Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PntuN-0007OG-ML
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:23:40 +0000
Received: by wyf22 with SMTP id 22so2405230wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:23:37 -0800 (PST)
Subject: Re: [PATCH 4/5] mtd: tests : move ebcnt and pgcnt definitions
	before usage in printing.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <1297159362-8407-5-git-send-email-adrian.hunter@nokia.com>
References: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
	<1297159362-8407-5-git-send-email-adrian.hunter@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:22:27 +0200
Message-ID: <1297434147.2760.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-02-08 at 12:02 +0200, Adrian Hunter wrote:
> From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> 
> ebcnt and pgcnt variable initialization is moved before printk which
> uses them.
> 
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>

Pushed all patches to l2-mtd-2.6.git except of this one, because Roman
had already sent it and I already applied it.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
