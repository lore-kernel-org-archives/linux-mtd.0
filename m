Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anCoe-00046f-Cs
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 22:17:49 +0000
From: Richard Weinberger <richard@nod.at>
Subject: Reconsidering exportable UBIFS
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Christoph Hellwig <hch@infradead.org>
Message-ID: <5702E7F5.1050807@nod.at>
Date: Tue, 5 Apr 2016 00:17:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Currently UBIFS is not exportable.
I'm not sure whether it is completely impossible or if I just miss a detail.
So I've some questions.

Documentation/filesystems/nfs/Exporting states that the only required function
is fh_to_dentry().
This function should on UBIFS be implementable using generic_fh_to_dentry().
While UBIFS reuses in theory inode numbers we can ignore i_generation as
the flash chip is long dead before we start reusing inodes. Same as for JFFS2.
But the same document states also that fh_to_parent() and get_parent() are optional
but strongly recommended.
What does this mean? Will NFS work but puppies die and turn into zombies?

Implementing get_parent() is a little unpleasant.
UBIFS's on-flash layout does not support querying the parent.
We could change UBIFS's struct ubifs_ino_node, but I'd change the
on-flash layout only as last resort.

The biggest problem I see is that UBIFS does not really support telldir()
and seekdir().
Directory offsets in UBIFS are plain hash values, so telldir()/seekdir() won't
correctly work if UBIFS faces hash collisions.
Currently UBIFS implements a hack which stores the UBIFS dent object into
file->private_data such that consecutive readdir()s are guaranteed to work.
A comment on UBIFS's readdir states:
 * This means that UBIFS cannot support NFS which requires full
 * 'seekdir()'/'telldir()' support.

Is this still true? Maybe we can have NFS even if it is not perfect in
terms of performance.

Artem, did I miss another show stopper? :-)

Thanks,
//richard
