Received: from mga11.intel.com ([192.55.52.93])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5zyJ-0003Kd-9i
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:35:04 +0000
Message-ID: <1331300238.29445.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/6] mtd: Fix unnecessary flash erase and write errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Parsons <lost.distance@yahoo.com>
Date: Fri, 09 Mar 2012 15:37:18 +0200
In-Reply-To: <1331129384.28469.YahooMailClassic@web29020.mail.ird.yahoo.com>
References: <1331129384.28469.YahooMailClassic@web29020.mail.ird.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 joakim.tjernlund@transmode.se, philipp.zabel@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-03-07 at 14:09 +0000, Paul Parsons wrote:
> The problem:
> 
> An HP iPAQ hx4700 consistently reports flash erase and write errors when running
> Linux:

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
