Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzwWJ-0003iu-9h
 for linux-mtd@lists.infradead.org; Sun, 05 Jan 2014 22:50:12 +0000
Received: by mail-pd0-f172.google.com with SMTP id g10so17476081pdj.3
 for <linux-mtd@lists.infradead.org>; Sun, 05 Jan 2014 14:49:48 -0800 (PST)
Date: Sun, 5 Jan 2014 14:49:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: find boot partition by CFE magic
Message-ID: <20140105224944.GC25372@norris-Latitude-E6410>
References: <1387651152-3884-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1387651152-3884-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rafał,

On Sat, Dec 21, 2013 at 07:39:11PM +0100, Rafał Miłecki wrote:
> Some devices have even nicer-to-recognize CFE thanks to the magic.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> This patch adds one line wider than 80 chars, however this improves code
> readability thanks to keeping one rule per line. I hope this can be
> accepted in this case.

I tripped on the same checkpatch error, and I thought the same thing
about readability. Probably worth an exception in this case. Forcing the
'||' or half the rule onto the next line wouldn't be too pretty.

> Both patches were verified with
> ./verify ../linux/l2-mtd/ mips-bcm47xx_defconfig < patch

Nice to know I'm not the only one running these tools :)

Both patches look good. Pushed to l2-mtd.git.

Brian
