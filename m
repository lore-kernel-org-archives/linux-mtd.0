Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEY0Y-0001zX-FD
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 08:55:23 +0000
Subject: Re: [PATCH 0/2] Support skipping a certain number of good blocks
To: Mike Crowe <mac@mcrowe.com>, linux-mtd@lists.infradead.org
References: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
 <20161206181108.GA20416@mcrowe.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <cdfdbe5d-1aa8-e424-7691-338d0d63f7b1@sigma-star.at>
Date: Wed, 7 Dec 2016 09:53:49 +0100
MIME-Version: 1.0
In-Reply-To: <20161206181108.GA20416@mcrowe.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since both tools already have a --start[address] option to specify an offset,
wouldn't it make more sense for your case to add a flag that this offset should
not include bad blocks? IMO this would remove the ambiguity of having two
different offset options.

For both tools, instead of skipping bad blocks on the fly, it would IMO be cleaner
if you could add a simple check that iterates over the erase blocks ahead of time
and adjusts the offset if a block is bad. Then you wouldn't have to change the
later checks or add additional clutches to the already cluttered read/write loop.


David
