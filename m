Received: from smtp5.cluster.oleane.net ([195.25.12.27])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15o3Oa-0008Um-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2001 14:46:08 +0100
Received: from toxote.mangrove-systems.fr (Mix-Caen-107-1-139.abo.wanadoo.fr [193.249.16.139]) by smtp5.cluster.oleane.net with SMTP id f91DsdM49387 for <linux-mtd@lists.infradead.org>; Mon, 1 Oct 2001 15:54:40 +0200 (CEST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Guillaume Laisney <glaisney@libertysurf.fr>
To: <linux-mtd@lists.infradead.org>
Subject: blkpg + newbie question
Date: Mon, 1 Oct 2001 16:00:45 +0000
MIME-Version: 1.0
Message-Id: <01100116004500.01364@toxote.mangrove-systems.fr>
Content-Transfer-Encoding: quoted-printable
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

Hello,

I'm currently trying to get Midori linux running on a disk-on-chip 2000.
It seems that there are a few missing cases in nftlcore.c (function=20
nftl_ioctl)  that hangs midori when it calls ioctl( ...,BLKPG,...)

the code  below seems to work OK.

Now a little question...
It is the first time I'm using DOCs, and I found them really slow compare=
d=20
with compact-flashes. I'm I missing something ? could it be a software is=
sue ?



Guillaume




static int nftl_ioctl(struct inode * inode, struct file * file, unsigned =
int=20
cmd, unsigned long arg)
{
=09struct NFTLrecord *nftl;
=09int p;

=09nftl =3D NFTLs[MINOR(inode->i_rdev) >> NFTL_PARTN_BITS];

=09if (!nftl) return -EINVAL;

=09switch (cmd) {
=09case HDIO_GETGEO: {
=09=09struct hd_geometry g;

=09=09g.heads =3D nftl->heads;
=09=09g.sectors =3D nftl->sectors;
=09=09g.cylinders =3D nftl->cylinders;
=09=09g.start =3D part_table[MINOR(inode->i_rdev)].start_sect;
=09=09return copy_to_user((void *)arg, &g, sizeof g) ? -EFAULT : 0;
=09}
=09case BLKGETSIZE:   /* Return device size */
=09=09return put_user(part_table[MINOR(inode->i_rdev)].nr_sects,
                                (long *) arg);
=09case BLKGETSIZE64:
=09=09return put_user((u64)part_table[MINOR(inode->i_rdev)].nr_sects << 9=
,
                                (u64 *)arg);

=09case BLKFLSBUF:
=09=09if (!capable(CAP_SYS_ADMIN)) return -EACCES;
=09=09fsync_dev(inode->i_rdev);
=09=09invalidate_buffers(inode->i_rdev);
=09=09if (nftl->mtd->sync)
=09=09=09nftl->mtd->sync(nftl->mtd);
=09=09return 0;

=09case BLKRRPART:
=09=09if (!capable(CAP_SYS_ADMIN)) return -EACCES;
=09=09if (nftl->usecount > 1) return -EBUSY;
=09=09/*=20
=09=09 * We have to flush all buffers and invalidate caches,
=09=09 * or we won't be able to re-use the partitions,
=09=09 * if there was a change and we don't want to reboot
=09=09 */
=09=09p =3D (1<<NFTL_PARTN_BITS) - 1;
=09=09while (p-- > 0) {
=09=09=09kdev_t devp =3D MKDEV(MAJOR(inode->i_dev), MINOR(inode->i_dev)+p=
);
=09=09=09if (part_table[p].nr_sects > 0)
=09=09=09=09invalidate_device (devp, 1);

=09=09=09part_table[MINOR(inode->i_dev)+p].start_sect =3D 0;
=09=09=09part_table[MINOR(inode->i_dev)+p].nr_sects =3D 0;
=09=09}
=09=09
#if LINUX_VERSION_CODE < 0x20328
=09=09resetup_one_dev(&nftl_gendisk, MINOR(inode->i_rdev) >> NFTL_PARTN_B=
ITS);
#else
=09=09grok_partitions(&nftl_gendisk, MINOR(inode->i_rdev) >> NFTL_PARTN_B=
ITS,
=09=09=09=091<<NFTL_PARTN_BITS, nftl->nr_sects);
#endif
=09=09return 0;

#if (LINUX_VERSION_CODE < 0x20303)=09=09
=09RO_IOCTLS(inode->i_rdev, arg);  /* ref. linux/blk.h */
#else
=09case BLKROSET:
=09case BLKROGET:
=09case BLKSSZGET:
=09case BLKELVGET:
=09case BLKELVSET:
=09case BLKPG:
=09=09return blk_ioctl(inode->i_rdev, cmd, arg);
#endif

=09default:
=09=09return -EINVAL;
=09}
}
