Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3UEC-0000LK-5p
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 12:35:49 +0000
Date: Thu, 29 Oct 2009 13:35:35 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v12 0/4]: mtdoops: fixes and improvements
Message-ID: <20091029133535.2ea65f72@marrow.netinsight.se>
In-Reply-To: <20091015094057.7298e0d7@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again!

Here is another round of the mtdoops fixes for Artems tree. The patches
are:

1. Keep track of mtdoops page cleanliness in an array. This allows
   mtdoops_inc_counter to be called during panic (which fails in my
   case with the current code in mtd->read, although I believe this is
   MTD-driver dependent).

2. Add a maximum MTD partition size for mtdoops.

3. Make page size configurable to support longer messages. Mainly
   needed for patch 4, but also allows longer messages to be stored
   during panics (when the next oops area cannot be erased).

4. Refactor mtdoops as a kmsg_dumper device instead of a console device.

Apart from the changelog in each patch, the patch that removes the
always-erase-empty-areas has been dropped.

// Simon
