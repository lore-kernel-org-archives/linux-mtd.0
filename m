Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAIVe-000101-GD
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 16:06:11 +0000
Message-ID: <1494864339.18055.20.camel@gmail.com>
Subject: Re: [PATCH] ubifs: Fix inode leak in xattr code
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 stable@vger.kernel.org
Date: Mon, 15 May 2017 19:05:39 +0300
In-Reply-To: <a5e7b80e-e1db-7b57-3b94-4d8e3a43cc6a@nod.at>
References: <1494858005-18439-1-git-send-email-richard@nod.at>
 <1494860034.18055.17.camel@gmail.com>
 <a5e7b80e-e1db-7b57-3b94-4d8e3a43cc6a@nod.at>
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

On Mon, 2017-05-15 at 17:22 +0200, Richard Weinberger wrote:
> Alternatively we could add a iget_locked/drop_nlink/iput sequence to
> ubifs_tnc_remove_ino(). But that will make unlink() much slower for
> files
> that contain xattrs.

At that level we'd need to do it for every xattr, even those that were
never be accessed, which would be slow indeed.

But we really only need to check the inode cache: hey, icache, I am
dying, and if you have any of my guys (xattrs), I want them to die with
me. 

So the question is how to find our guys in the inode cache. I am not
sure. Probably be we'd have to have our own list of cached inodes in
the host inode, and maintain it.

Artem.
