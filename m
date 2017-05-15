Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAHq5-0004dV-81
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 15:23:15 +0000
Subject: Re: [PATCH] ubifs: Fix inode leak in xattr code
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
References: <1494858005-18439-1-git-send-email-richard@nod.at>
 <1494860034.18055.17.camel@gmail.com>
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <a5e7b80e-e1db-7b57-3b94-4d8e3a43cc6a@nod.at>
Date: Mon, 15 May 2017 17:22:49 +0200
MIME-Version: 1.0
In-Reply-To: <1494860034.18055.17.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Am 15.05.2017 um 16:53 schrieb Artem Bityutskiy:
> On Mon, 2017-05-15 at 16:20 +0200, Richard Weinberger wrote:
>> To solve this problem, set i_nlink for all xattr inodes to 0, such
>> that
>> the iput() in the UBIFS xattr code makes the temporary inode vanish
>> immediately.
> 
> What if there is iget right after iput? With this patch, will we need
> to go all the way to the slow media instead of just getting having the
> inode from the inode cache?

Hmm, why would we go down to the slow media?
Since the xattr was just looked up there is a high chance that the TNC
will still contain the node.
A new inode needs to be allocated, though.

Alternatively we could add a iget_locked/drop_nlink/iput sequence to
ubifs_tnc_remove_ino(). But that will make unlink() much slower for files
that contain xattrs.

Thanks,
//richard
