Received: from smtp20.mail.bbt.yahoo.co.jp ([202.93.85.135])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ebdrj-00008e-UI
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 07:55:26 -0500
Message-ID: <002001c5e91a$a7c87180$0b01a8c0@YANO>
From: "Keijiro Yano" <keijiro_yano@yahoo.co.jp>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <000c01c5e6d6$abf22490$0b01a8c0@YANO> <4375EA0D.2060704@yandex.ru>
Date: Mon, 14 Nov 2005 21:55:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 mutex problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Well, the patch is not against the latest MTD CVS snapshot which is bad.

Thanks for your information.
I modify my patch to fix this problem.


--- fs.c 10 Feb 2005 10:15:41 -0000 1.1.1.1
+++ fs.c 14 Nov 2005 01:59:24 -0000
@@ -236,6 +236,8 @@
  c = JFFS2_SB_INFO(inode->i_sb);
 
  jffs2_init_inode_info(f);
+
+ down(&f->sem);
  
  ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
 
@@ -403,6 +405,8 @@
  f = JFFS2_INODE_INFO(inode);
  jffs2_init_inode_info(f);
 
+ down(&f->sem);
+ 
  memset(ri, 0, sizeof(*ri));
  /* Set OS-specific defaults for new inodes */
  ri->uid = cpu_to_je16(current->fsuid);

--- super.c 10 Feb 2005 10:15:41 -0000 1.1.1.1
+++ super.c 14 Nov 2005 01:36:34 -0000
@@ -51,7 +51,7 @@
 
  if ((flags & (SLAB_CTOR_VERIFY|SLAB_CTOR_CONSTRUCTOR)) ==
      SLAB_CTOR_CONSTRUCTOR) {
- init_MUTEX_LOCKED(&ei->sem);
+ init_MUTEX(&ei->sem);
  inode_init_once(&ei->vfs_inode);
  }
 }

--------------------------------------
Know more about Breast Cancer
http://pr.mail.yahoo.co.jp/pinkribbon/
