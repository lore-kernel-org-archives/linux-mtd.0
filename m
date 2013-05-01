Received: from mail-pa0-f46.google.com ([209.85.220.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXagK-00084D-UP
 for linux-mtd@lists.infradead.org; Wed, 01 May 2013 17:19:05 +0000
Received: by mail-pa0-f46.google.com with SMTP id ld11so957553pab.5
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2013 10:18:41 -0700 (PDT)
Received: from [192.168.1.112] ([69.76.8.2])
 by mx.google.com with ESMTPSA id hp1sm4457121pac.3.2013.05.01.10.18.39
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Wed, 01 May 2013 10:18:39 -0700 (PDT)
From: Brian Pomerantz <bapper@gmail.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_E17E2620-2D5B-46F2-8AEF-1D61BC5D18F4"
Subject: UBI fastmap used PEB search
Message-Id: <6C00A5CD-15B0-41F3-9505-276081572E77@gmail.com>
Date: Wed, 1 May 2013 10:18:37 -0700
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Apple-Mail=_E17E2620-2D5B-46F2-8AEF-1D61BC5D18F4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I have been doing some profiling on why it takes UBI attach longer as =
UBI volumes fill up.  I found that the majority of time takes place in =
fastmap.c during the search of the used PEB list when matching for the =
volume's LEBs.  Specifically, I saw that the inner loop =
"list_for_each_entry(tmp_aeb, &used, u.list)" gets hit a LOT.  The time =
it takes to search this list can be reduced if the attached patch is =
used, all it does is put a break in the loop when the pnum is matched.  =
This seems so obvious I figure there must be a reason it isn't done this =
way and I'm just missing it, is the patch valid or will it cause issues? =
 I'm also wondering if anyone has tried building the used list as a RB =
tree instead to further reduce the time spent spinning through the list.


--Brian


--Apple-Mail=_E17E2620-2D5B-46F2-8AEF-1D61BC5D18F4
Content-Disposition: attachment;
	filename=fastmap-pnum-break.patch
Content-Type: application/octet-stream;
	name="fastmap-pnum-break.patch"
Content-Transfer-Encoding: 7bit

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 0648c69..1542751 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -727,8 +727,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 			aeb = NULL;
 			list_for_each_entry(tmp_aeb, &used, u.list) {
-				if (tmp_aeb->pnum == pnum)
+				if (tmp_aeb->pnum == pnum) {
 					aeb = tmp_aeb;
+					break;
+				}
 			}
 
 			/* This can happen if a PEB is already in an EBA known

--Apple-Mail=_E17E2620-2D5B-46F2-8AEF-1D61BC5D18F4--
