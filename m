Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15t9bz-0005bi-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2001 16:25:03 +0100
Message-ID: <20011015083406.A17771@recycle.lbl.gov>
Date: Mon, 15 Oct 2001 08:34:06 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: linux/completion.h
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David said:
> Don't define it in compatmac.h, and surround the case BLKGETSIZE64 with
> #ifdef BLKGETSIZE64. I was given a patch to do this but haven't yet merged
> it.

You did merge the part that protects the BLKGETSIZE64 cases with an #ifdef.
All Alex has to do is disable the #define BLKGETSIZE64 from compatmac.h.

There might be good reason for _some_ people to define BLKGETSIZE64 in
compatmac.h, but I don't think that's a robust default.

       - Larry
