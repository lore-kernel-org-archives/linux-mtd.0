Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYcuV-0006vg-OP
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 10:40:25 +0000
Subject: Re: [PATCHv2 1/5] mtd-utils: move libmtd source files to lib/
	subdirectory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <eb53f5a0215250d7e523de47d15b0d12@localhost>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 13:35:18 +0300
Message-ID: <1279017318.31639.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-07 at 17:30 -0700, Kevin Cernekee wrote:
> Source files for libmtd, crc32, and fec are scattered throughout the
> tree.  Move them to a central location so they can be built into a
> common "libmtd.a" library used by all mtd-utils programs.
> 
> This patch only renames/deletes files and does not change the content.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Let's try to keep the tree always compilable. This patch alone breaks
compilation, so I merged it with the second patch and pushed to the
mtd-utils tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
