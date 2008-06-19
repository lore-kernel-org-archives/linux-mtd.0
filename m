Received: from topsns2.toshiba-tops.co.jp ([202.230.225.126])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9EHB-0003kx-J5
	for linux-mtd@lists.infradead.org; Thu, 19 Jun 2008 07:09:46 +0000
Date: Thu, 19 Jun 2008 16:09:38 +0900 (JST)
Message-Id: <20080619.160938.108184127.nemoto@toshiba-tops.co.jp>
To: joern@logfs.org
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080618175253.GD10271@logfs.org>
References: <20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
	<20080618174034.GA10271@logfs.org>
	<20080618175253.GD10271@logfs.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Jun 2008 19:52:53 +0200, J=F6rn Engel <joern@logfs.org> wrot=
e:
> I've had a quick go at it.  Three cleanup patches first, then the got=
o.
> Patches have been compile-tested, but not more.  Would these work?

Unfortunately, no.

> +		err =3D add_one_partition(master, parts + i, i, cur_offset);
> +		if (err)
> +			return err;
> +		slave =3D PART(parts[i].mtdp);
> +		cur_offset =3D slave->offset + slave->mtd.size;

This should be 'slave =3D PART(*parts[i].mtdp)', but anyway you cannot
dereference mtdp while it can be NULL.

Other parts of your patchset are very good for me.  Thanks.

This is my quick fix on top of your patchset.  Please fold this (or
your own fix) into first patch.

--- linux/drivers/mtd/mtdpart.c	2008-06-19 15:35:28.000000000 +0900
+++ linux/drivers/mtd/mtdpart.c	2008-06-19 15:36:43.000000000 +0900
@@ -324,7 +324,7 @@ int del_mtd_partitions(struct mtd_info *
 }
 EXPORT_SYMBOL(del_mtd_partitions);
 =

-static int add_one_partition(struct mtd_info *master,
+static struct mtd_part *add_one_partition(struct mtd_info *master,
 		const struct mtd_partition *part, int partno,
 		u_int32_t cur_offset)
 {
@@ -336,7 +336,7 @@ static int add_one_partition(struct mtd_
 		printk(KERN_ERR"memory allocation error while creating partitions fo=
r \"%s\"\n",
 			master->name);
 		del_mtd_partitions(master);
-		return -ENOMEM;
+		return NULL;
 	}
 	list_add(&slave->list, &mtd_partitions);
 =

@@ -495,7 +495,7 @@ out_register:
 		add_mtd_device(&slave->mtd);
 		slave->registered =3D 1;
 	}
-	return 0;
+	return slave;
 }
 =

 /*
@@ -511,15 +511,14 @@ int add_mtd_partitions(struct mtd_info *
 {
 	struct mtd_part *slave;
 	u_int32_t cur_offset =3D 0;
-	int i, err;
+	int i;
 =

 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts=
, master->name);
 =

 	for (i =3D 0; i < nbparts; i++) {
-		err =3D add_one_partition(master, parts + i, i, cur_offset);
-		if (err)
-			return err;
-		slave =3D PART(parts[i].mtdp);
+		slave =3D add_one_partition(master, parts + i, i, cur_offset);
+		if (!slave)
+			return -ENOMEM;
 		cur_offset =3D slave->offset + slave->mtd.size;
 	}
 =


---
Atsushi Nemoto
