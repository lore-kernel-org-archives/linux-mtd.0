Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJW6A-0006er-5D
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2004 07:54:47 -0400
Message-ID: <4173AFAE.6060303@inf.u-szeged.hu>
Date: Mon, 18 Oct 2004 13:57:34 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>, linux-mtd@lists.infradead.org
References: <417156E1.9000009@yandex.ru>
In-Reply-To: <417156E1.9000009@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: JFFS2 bugfix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I tried reproduce your bug:

 > I've found bug in JFFS2. When there is no free space left on JFFS2
 > file system, and somebody for example tries to creade new directory,
 > JFFS2 frees memory twice.
 >
 > See dir.c, jffs2_create(), line 216.
 >
 > jffs2_do_create returns error.
 > jffs2_clear_inode(inode) is called and frees the jffs2_sb_info,
 > jffs2_full_dnode, etc.
 > iput(inode) is called, calling in turn the jffs2_clear_inode, and the
 > same structures are freed for the second time. This leads to the slab
 > cache corruption.

I was not successful. I write JFFS2 to full (there was no left space),
than I tried to mkdir, but there was no slab cache corruption.

 > --- dir.c       2004-10-16 21:02:22.886276648 +0400
 > +++ dir_corrected.c     2004-10-16 21:03:10.843766654 +0400
 > @@ -217,7 +217,6 @@
 >                               dentry->d_name.name, dentry->d_name.len);
 >
 >         if (ret) {
 > -               jffs2_clear_inode(inode);
 >                 make_bad_inode(inode);
 >                 iput(inode);
 >                 jffs2_free_raw_inode(ri);

If I know well now jffs2_clear_inode only try to free only the fragtree,
its dirents... but the inode is still present, and need to handle.

Maybe I am wrong. I am not very familiar with this part of JFFS2.
Are you sure that this is really a bug?

Regards,
Ferenc
