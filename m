Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsRY1-0007Hj-39
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 02:35:06 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L8B00K2I0HSR6E0@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 11:34:40 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L8B00CDK0HQ4A@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 11:34:40 +0900 (KST)
Date: Mon, 06 Sep 2010 08:04:38 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: RE: [PATCH 1/1][MTD] Adding IOCTLs for run-time partitioning support
In-reply-to: <1282574026.24044.70.camel@localhost>
To: dedekind1@gmail.com
Message-id: <002c01cb4d6c$0e2bf680$2a83e380$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: quoted-printable
References: <000101cb2f11$86c3f5d0$944be170$%hs@samsung.com>
	<1282574026.24044.70.camel@localhost>
Cc: 'David Woodhouse' <dwmw2@infradead.org>, v.dalal@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Monday, August 23, 2010 8:04 PM
> To: Rohit Hassan Sathyanarayan
> Cc: linux-mtd@lists.infradead.org; 'David Woodhouse'; =
v.dalal@samsung.com
> Subject: Re: [PATCH 1/1][MTD] Adding IOCTLs for run-time partitioning =
support
>=20
> On Thu, 2010-07-29 at 17:00 +0530, Rohit Hassan Sathyanarayan wrote:
> > Hi All
> >
> > Sending the patch on MTD for adding four IOCTLs.
> > MTDPARTITIONCREATE
> > MTDPARTITIONDELETE
> > MTDPARTITIONSETPERMISSION
> > MTDPARTITIONMERGE
> >
> >
> >
> > Signed-off-by: Rohit HS <rohit.hs@samsung.com>
>=20
> Could you pleas make scripts/checkpatch.pl happy?
>=20
  I checked it with scripts/checkpatch.pl but didn't faced any problem.
  I will surely recheck it.
> Could you please take a look at the solution from Roman and compare it
> to your solution: what is the difference, which one is better? He
> submitted the patch earlier than you. And I may be mistaken, but your
> solution looks broken, but I did not really look deep enough. See =
below.
>=20
  Functionally both are same.
  But implementation differences are,
  Roman's patch passes the mtd to be partitioned by open mtd node =
itself.=20
  Ex: If partitions are to be created on mtd4,then mtd4 itself is opened =
and
      Partitions are created and then mtd4 is deleted.

  In my patch, the mtd on which partitions are to be created is passed =
as=20
  argument in MTDPARTITIONCREATE ioctl.=20
  For changing from user to kernel space and access mtd, default read =
only
  mtd Partition is opened.
  Ex: If partitions are to be created on /dev/mtd4,then /dev/mtd0 is =
opened
      and mtd4 information is passed in MTDPARTITIONCREATE ioctl =
argument.

  Also permissions of the partitions can be changed with my patch.
  This patch also works independent of the device. I have tested this =
with
  Nand , OneNand and FlexOnenand.
  Implementation in kernel is minimal in my patch. =20

  MTDPARTITIONMERGE is just another option, advantage of merge option
  over(delete+delete+create) is definitely number of system calls.    =20
 =20
> Could you please also take a look at the discussion of Roman's patch =
and
> the request for the interface - Arn asked to have it look as much as
> possible as the corresponding ioctl for block devices.
>=20
> I did not really review your patch, but few things are below.
>=20
> > +#ifdef CONFIG_MTD_PARTITIONS
> > +
> > +		case MTDPARTITIONCREATE:
> > +		{
> > +		struct mtd_partition *pst_minfo =3D NULL;
> > +		struct mtd_partition *pst_minfo_hold =3D NULL;
> > +		struct mtd_partition st_free;
> > +		uint64_t u64_userfreeoffset =3D 0;
> > +		uint64_t u64_userfreesize =3D 0;
>=20
> Do not prefix variable names with types - kernel people hate this, and
> they will hate your patches if you do like this!
>=20
> General suggestion: when you modify an existing file, stick to the =
style
> used in this file, do not push for your own style. Or change the style
> of the whole file.
>=20
> > +		struct user_mtd *puser_partitions =3D NULL;
> > +		struct user_mtd_info upartition;
> > +		int i;
>=20
> Variable names are too long and cryptic, try to think about s
>=20
> > +			add_mtd_partitions(mtd, pst_minfo_hold,
> > +						upartition.num_partitions);
>=20
> So 'pst_minfo_hold' (bad name!) becomes the master partition. You
> allocate it in this function. But who delets it? When? Could you =
please
> point to the code which kfree()s this object?
>=20
  kfree() is at end of ioctl(MTDPARTITIONCREATE),by mistake it was not =
generated in patch.=20

> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =
=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9)

I have modified the patch as per your comments,

Regards,
Rohit.H.S




Signed-off-by: Rohit HS <rohit.hs@samsung.com>
---
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 91c8013..160538d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -22,6 +22,12 @@
=20
 #include <asm/uaccess.h>
=20
+#ifdef CONFIG_MTD_PARTITIONS
+#include <linux/mtd/partitions.h>
+#define MTD_PART_DEV_NUM	0x0000FFFF
+#define MTD_PART_FLAGS		0xFFFF0000
+#endif
+
 #define MTD_INODE_FS_MAGIC 0x11307854
 static struct vfsmount *mtd_inode_mnt __read_mostly;
=20
@@ -471,7 +477,15 @@ static int mtd_ioctl(struct file *file, u_int cmd, =
u_long arg)
 	int ret =3D 0;
 	u_long size;
 	struct mtd_info_user info;
-
+#ifdef CONFIG_MTD_PARTITIONS
+	struct mtd_partition	*pmtd;
+	struct mtd_partition	*pmtd1;
+	struct mtd_partition	free;
+	struct mtd_info *pinfo1;
+	struct mtd_info *pinfo2;
+	struct user_mtd	*ppart =3D NULL;
+	struct user_mtd_info	upart;
+#endif
 	DEBUG(MTD_DEBUG_LEVEL0, "MTD_ioctl\n");
=20
 	size =3D (cmd & IOCSIZE_MASK) >> IOCSIZE_SHIFT;
@@ -825,6 +839,117 @@ static int mtd_ioctl(struct file *file, u_int cmd, =
u_long arg)
 		}
 		file->f_pos =3D 0;
 		break;
+#ifdef CONFIG_MTD_PARTITIONS
+
+	case MTDPARTITIONCREATE:
+	{
+		u_int64_t	uoffset =3D 0;
+		u_int64_t	usize =3D 0;
+		u_int32_t	i;
+
+			if (copy_from_user(&upart, argp,
+				sizeof(struct user_mtd_info))) {
+				ret =3D -EFAULT;
+				break;
+			}
+			ppart =3D kzalloc(sizeof(struct user_mtd)*
+						upart.num_partitions
+						, GFP_KERNEL);
+			pmtd =3D kzalloc(sizeof(struct mtd_partition)*
+					upart.num_partitions,
+					GFP_KERNEL);
+			pmtd1 =3D pmtd;
+			if (ppart =3D=3D NULL) {
+				ret =3D -EFAULT;
+				break;
+			}
+			if (copy_from_user(ppart,
+					upart.pst_user_partitions,
+					sizeof(struct user_mtd)*
+					upart.num_partitions)) {
+				ret =3D -EFAULT;
+				break;
+			}
+			for (i =3D 0; i < upart.num_partitions; i++) {
+				pmtd->name  =3D ppart->name;
+				pmtd->size  =3D
+					ppart->partition_size;
+				usize +=3D pmtd->size;
+				pmtd->offset =3D
+					ppart->partition_offset;
+				uoffset +=3D pmtd->offset;
+				pmtd->mask_flags =3D
+					ppart->partition_mask;
+
+				ppart++;
+				pmtd++;
+			}
+			add_mtd_partitions(mtd, pmtd1,
+						upart.num_partitions);
+			if ((mtd->size - usize) > 0) {
+				free.name	=3D "FREE";
+				free.size	=3D mtd->size - usize;
+				free.offset	=3D usize;
+				free.mask_flags =3D 0;
+				add_mtd_partitions(mtd, &free, 1);
+			}
+			kfree(pmtd1);
+		break;
+	}
+	case MTDPARTITIONDELETE:
+	{
+		u_int32_t mtd_num;
+
+			if (copy_from_user(&mtd_num, argp,
+					sizeof(mtd_num))) {
+				ret =3D -EFAULT;
+				break;
+			}
+			pinfo1 =3D get_mtd_device(NULL,
+					mtd_num);
+
+			if (pinfo1 !=3D NULL) {
+				put_mtd_device(pinfo1);
+				del_mtd_device(pinfo1);
+			}
+		break;
+	}
+	case MTDPARTITIONSETPERMISSION:
+	{
+		u_int32_t flags;
+		int dev_num;
+
+			if (copy_from_user(&flags, argp,
+					sizeof(flags))) {
+				ret =3D -EFAULT;
+				break;
+			}
+			dev_num =3D (flags & MTD_PART_DEV_NUM);
+			flags =3D (flags & MTD_PART_FLAGS) >> 16;
+			pinfo1 =3D get_mtd_device(NULL, dev_num);
+			pinfo1->flags =3D flags;
+		break;
+	}
+	case MTDPARTITIONMERGE:
+	{
+		u_int8_t part_num[2];
+
+			if (copy_from_user(part_num, argp, 2)) {
+				ret =3D -EFAULT;
+				break;
+			}
+			pinfo1 =3D get_mtd_device(NULL, part_num[0]);
+			pinfo2 =3D get_mtd_device(NULL, part_num[1]);
+			if ((pinfo1 !=3D NULL) &&
+				(pinfo2 !=3D NULL)) {
+				pinfo1->size +=3D	pinfo2->size;
+				put_mtd_device(pinfo2);
+				del_mtd_device(pinfo2);
+			}
+		break;
+	}
+#endif
+
 	}
=20
 	default:
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index be51ae2..cfebc75 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -30,6 +30,19 @@ struct mtd_oob_buf64 {
 	__u64 usr_ptr;
 };
=20
+struct user_mtd {
+	char name[32];
+	 __u64 partition_size;
+	 __u64 partition_offset;
+	 __u32 partition_mask;
+};
+
+struct user_mtd_info {
+	struct user_mtd *pst_user_partitions;
+	__u32 num_partitions;
+};
+
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -110,7 +123,10 @@ struct otp_info {
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
-
+#define MTDPARTITIONCREATE      _IOW('M', 23, int)
+#define MTDPARTITIONDELETE      _IOW('M', 24, int)
+#define MTDPARTITIONSETPERMISSION _IOW('M', 26, int)
+#define MTDPARTITIONMERGE       _IOW('M', 27, int)
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
---
