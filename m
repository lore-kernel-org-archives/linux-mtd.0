From: rkaiser@sysgo.de (Robert Kaiser)
Date: Thu, 6 Mar 2003 13:10:17 +0100
Subject: [PATCH] NAND and mtdconcat
In-Reply-To: <NFBBLPGPLKFIKCCPLALEAENICFAA.cgan@iders.ca>
References: <NFBBLPGPLKFIKCCPLALEAENICFAA.cgan@iders.ca>
Message-ID: <200303061059.h26AxQl27547@dagobert.svc.sysgo.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Christian,


Am Mittwoch, 5. M?rz 2003 20:21 schrieb Christian Gan:
> Hello all,
>
> Attached is a patch for mtdconcat.c that supports NAND functions for the
> oob.  I've tested it on my own bench and it seems to work great on two 64MB
> NANDs concatenated into one MTD.
>
> Robert, since you were the original author of this file, can you verify it
> for me?

Looks OK to me. I can't test it right now as I don't have any suitable HW 
available, but I'll take your word that it works ;-)

One question though, you made changes like this:


@@ -410,11 +641,12 @@
 static int concat_suspend(struct mtd_info *mtd)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
+	struct mtd_info *subdev = NULL;
 	int i, rc = 0;

 	for(i = 0; i < concat->num_subdev; i++)
 	{
-		struct mtd_info *subdev = concat->subdev[i];
+        subdev = concat->subdev[i];
 		if((rc = subdev->suspend(subdev)) < 0)
 			return rc;
 	}
@@ -424,11 +656,12 @@

all over the place. Why? This might generate slightly more code and be slower 
(not that it would be noticeable though).

Other than that, I have no objections.

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
