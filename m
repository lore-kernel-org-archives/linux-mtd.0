Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47] helo=penguin.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mxQ6-0004Fi-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2002 15:15:42 +0100
Subject: Re: cvs snapshot
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <13142.1031233231@redhat.com>
References: <1031233157.28699.116.camel@spawn>
	<1031229012.20555.102.camel@spawn> <8639.1031231214@redhat.com>  
	<13142.1031233231@redhat.com>
Content-Type: multipart/mixed; boundary="=-9Dja48TV81XUqzIAgrwr"
Date: 05 Sep 2002 16:15:40 +0200
Message-Id: <1031235341.20555.124.camel@spawn>
Mime-Version: 1.0
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

--=-9Dja48TV81XUqzIAgrwr
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2002-09-05 at 15:40, David Woodhouse wrote:
> 
> kenneth.johansson@etx.ericsson.se said:
> >  Have the code for mkfs.jffs2 changed since last snapshot ?. 
> 
> Nope. 
In that case here is a patch to fix the permissions when cross building
of a disk image.

--- util/mkfs.jffs2.c   Fri Jul  5 00:00:09 2002
+++ util2/mkfs.jffs2.c  Thu Sep  5 16:10:21 2002
@@ -568,8 +568,8 @@
 
        ri.ino = cpu_to_target32(ino);
        ri.mode = cpu_to_target32(statbuf->st_mode);
-       ri.uid = cpu_to_target32(statbuf->st_uid);
-       ri.gid = cpu_to_target32(statbuf->st_gid);
+       ri.uid = cpu_to_target16(statbuf->st_uid);
+       ri.gid = cpu_to_target16(statbuf->st_gid);
        ri.atime = cpu_to_target32(statbuf->st_atime);
        ri.ctime = cpu_to_target32(statbuf->st_ctime);
        ri.mtime = cpu_to_target32(statbuf->st_mtime);

---------

I do still have a difference can you see what type of data this is thats
wrong. The diff is from a correct image to a incorrect.




-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se


--=-9Dja48TV81XUqzIAgrwr
Content-Disposition: attachment; filename=image.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=image.diff; charset=ANSI_X3.4-1968

--- jffs2.ppc.txt	Thu Sep  5 15:12:46 2002
+++ jffs2_2.x86.txt	Thu Sep  5 16:08:22 2002
@@ -23,9 +23,9 @@
 000160 00 00 00 03 00 00 00 05 3d 76 85 fb 03 04 00 00  >........=3Dv.....=
.<
 000170 76 4a 7c 10 b7 b7 88 2e 63 6c 69 ff 19 85 e0 02  >vJ|.....cli.....<
 000180 00 00 00 44 a4 ef 22 3e 00 00 00 05 00 00 00 01  >...D..">........<
-000190 00 00 41 ff 04 d2 00 00 00 00 00 00 3d 76 85 fb  >..A.........=3Dv.=
.<
+000190 00 00 41 ff 00 00 00 00 00 00 00 00 3d 76 85 fb  >..A.........=3Dv.=
.<
 0001a0 3d 76 85 fb 3d 76 85 fb 00 00 00 00 00 00 00 00  >=3Dv..=3Dv.......=
...<
-0001b0 00 00 00 00 00 00 00 00 00 00 00 00 eb 79 c2 92  >.............y..<
+0001b0 00 00 00 00 00 00 00 00 00 00 00 00 2e 47 c8 69  >.............G.i<
 0001c0 19 85 e0 01 00 00 00 2b 3e 42 24 27 00 00 00 04  >.......+>B$'....<
 0001d0 00 00 00 04 00 00 00 06 3d 76 85 fb 03 04 00 00  >........=3Dv.....=
.<
 0001e0 32 b4 46 8d 2b cb 60 9a 70 70 70 ff 19 85 e0 02  >2.F.+.`.ppp.....<

--=-9Dja48TV81XUqzIAgrwr--
