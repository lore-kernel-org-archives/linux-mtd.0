Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAHO6-000844-Dl
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 14:54:19 +0000
Message-ID: <1494860034.18055.17.camel@gmail.com>
Subject: Re: [PATCH] ubifs: Fix inode leak in xattr code
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 stable@vger.kernel.org
Date: Mon, 15 May 2017 17:53:54 +0300
In-Reply-To: <1494858005-18439-1-git-send-email-richard@nod.at>
References: <1494858005-18439-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2017-05-15 at 16:20 +0200, Richard Weinberger wrote:
> To solve this problem, set i_nlink for all xattr inodes to 0, such
> that
> the iput() in the UBIFS xattr code makes the temporary inode vanish
> immediately.

What if there is iget right after iput? With this patch, will we need
to go all the way to the slow media instead of just getting having the
inode from the inode cache?
