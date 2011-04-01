Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5bDE-0007pm-IK
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 10:04:17 +0000
Date: Fri, 1 Apr 2011 13:00:01 +0300
From: Phil Carmody <ext-phil.2.carmody@nokia.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/2] UBIFS: fix error path in dbg_debugfs_init_fs
Message-ID: <20110401100000.GA18707@esdhcp04044.research.nokia.com>
References: <1301642730-9582-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1301642730-9582-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/04/11 10:25 +0300, Artem Bityutskiy wrote:
> I was not completely happy about your fix and here is the fix I like
> more. It consists of 2 patches - the first one is preparational and
> the second one is the fix. Please, take a look.

The consolidation of the error paths certainly makes sense,
and indeed makes the fix much more clinical. Fully approve.

Acked-by: Phil Carmody <ext-phil.2.carmody@nokia.com>

Phil
