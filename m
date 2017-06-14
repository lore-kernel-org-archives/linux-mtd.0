Received: from da1vs02.rockwellcollins.com ([205.175.227.29])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLAtW-0005cE-Vt
 for linux-mtd@lists.infradead.org; Wed, 14 Jun 2017 16:11:48 +0000
Received: by mail-it0-f69.google.com with SMTP id s131so3417168itd.6
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2017 09:11:25 -0700 (PDT)
MIME-Version: 1.0
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Wed, 14 Jun 2017 11:11:24 -0500
Message-ID: <CADFuHZ411pOkuCSyHNqS=GNh92XJcYgec729FEJebUcusFRQwQ@mail.gmail.com>
Subject: Regarding jffs2 failure to report extended attributes
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are having a product which is running an old Linux kernel 2.6.27
and using jffs2 filesystem. We use SELinux policy and security labels
on this system.

One of the jffs2 partition we use as rw and copy some files and read
back those files at regular interval. Now, following is the scenario
we encounter in the field and that is completely random.

Directory structure for example, /mnt/dir_abc/file_xyz
SELinux security label (stored as extended attributes) on "dir_abc" is
not reported and instead it shows the default label "file_t" while
security label on "file_xyz" is intact. No process touches the
"dir_abc" during the process and it's inode number remains the same as
whatever is set by default in jffs2.img. We can see that the inode
version number is changed though in the jffs2dump analysis. So
definitely garbage collection is moving the data around.

When looking at the hexdump of this mtd partition, we can see that the
security label for "dir_abc" is in there but somehow filesystem does
not report it and instead report the default label "file_t".

Now, after doing multiple power cycles on the same unit and
mount/unmount on this partition, the issue disappears and filesystem
stats showing the correct label again.

We understand that it is an old kernel and may be missing fixes but it
is not possible to update to latest kernel. So, are there any specific
commit list on jffs2 that we should review and try to back-port to
avoid problems like this. We are looking for areas for which we should
review commits as definitely there are number of commits after 2.6.27
on jffs2 subsystem.

Best Regards,
Ronak Desai
