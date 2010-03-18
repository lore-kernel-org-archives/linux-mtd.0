Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NsNSS-0006Kd-7Y
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2010 21:40:53 +0000
Received: by fxm6 with SMTP id 6so17036fxm.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Mar 2010 14:40:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r5nhziss.fsf@tac.ki.iif.hu>
References: <87vdcwv139.fsf@tac.ki.iif.hu> <87ljdsibqe.fsf@macbook.be.48ers.dk>
	<87r5nhziss.fsf@tac.ki.iif.hu>
Date: Thu, 18 Mar 2010 21:40:45 +0000
Message-ID: <bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
Subject: Re: RFC: direct MTD support for SquashFS
From: Phillip Lougher <phillip.lougher@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-embedded@vger.kernel.org,
	Phillip Lougher <phillip@lougher.demon.co.uk>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 18, 2010 at 4:38 PM, Ferenc Wagner <wferi@niif.hu> wrote:
>
> I could only compare apples to oranges before porting the patch to the
> LZMA variant. =A0So I refrain from that for a couple of days yet. =A0But
> meanwhile I started adding a pluggable backend framework to SquashFS,
> and would much appreciate some comments about the applicability of this
> idea. =A0The patch is (intended to be) a no-op, applies on top of current
> git (a3d3203e4bb40f253b1541e310dc0f9305be7c84).

This looks promising, making the backend pluggable (like the new
compressor framework) is far better and cleaner than scattering the
code full of #ifdef's.  Far better than the previous patch :-)

A couple of specific comments...

+/* A backend is initialized for each SquashFS block read operation,
+ * making further sequential reads possible from the block.
+ */
+static void *bdev_init(struct squashfs_sb_info *msblk, u64 index,
size_t length)
+{
+	struct squashfs_bdev *bdev =3D msblk->backend_data;
+	struct buffer_head *bh;
+
+	bh =3D kcalloc((msblk->block_size >> bdev->devblksize_log2) + 1,
+			sizeof(*bh), GFP_KERNEL);

You should alloc against the larger of msblk->block_size and
METADATA_SIZE (8 Kbytes).  Block_size could be 4 Kbytes only.

+static int fill_bdev_super(struct super_block *sb, void *data, int silent)
+{
+	struct squashfs_sb_info *msblk;
+	struct squashfs_bdev *bdev;
+	int err =3D squashfs_fill_super2(sb, data, silent, &squashfs_bdev_ops);
+	if (err)
+		return err;
+
+	bdev =3D kzalloc(sizeof(*bdev), GFP_KERNEL);
+	if (!bdev)
+		return -ENOMEM;
+
+	bdev->devblksize =3D sb_min_blocksize(sb, BLOCK_SIZE);
+	bdev->devblksize_log2 =3D ffz(~bdev->devblksize);
+
+	msblk =3D sb->s_fs_info;
+	msblk->backend_data =3D bdev;
+	return 0;
+}

This function looks rather 'back-to-front' to me.  I'm assuming that
squashfs_fill_super2() will be the current fill superblock function?
This function wants to read data off the filesystem through the
backend, and yet the backend (bdev, mblk->backend_data) hasn't been
initialised when it's called...

Phillip
