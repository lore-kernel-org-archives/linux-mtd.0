Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlgK0-0002ez-TN
 for linux-mtd@lists.infradead.org; Tue, 04 Nov 2014 15:47:05 +0000
Received: from rus19.rsint.net ([10.0.33.19])
 by amu315.rsint.net (Totemo SMTP Server) with SMTP ID 583
 for <linux-mtd@lists.infradead.org>;
 Tue, 4 Nov 2014 16:46:07 +0100 (CET)
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: jffs2: Dirent with empty name
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFD6C536F5.9EA6C74D-ONC1257D85.0062452C-C1257D86.0056A24A@rohde-schwarz.com>
Date: Tue, 4 Nov 2014 16:46:16 +0100
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

on two occasions now, one of our devices (linux-3.10.23, busybox-1.22.1) 
was bricked because jffs2 created a DIRENT node with nsize = 0 (empty 
name). In one case, the DIRENT referred to an empty directory, in the 
other case to an empty regular file (in different locations). Eventually, 
the filesystem failed to mount: "Dirent at %08x has zero at start of name. 
Aborting mount.".

The problem occurred while running repeated tests (for hours) where we cut 
power in the middle of removing, renaming and writing files in jffs2. The 
scripts always wrote the same directories and files, and none of them had 
an empty name. [Anyway, I don't think that a userland program can actually 
create a directory or file with an empty name -- the path is sanitized 
long before it reaches jffs2.]

>From the context in the erase block, it looks like the offending DIRENT 
and INODE nodes were copied by GC from another erase block (which is no 
longer available), and later summarized. The mount failure only happens 
after the nodes are summarized. Without summary, the nodes are accepted as 
they are, and even this can be a bad thing: When there is a subdirectory 
with an empty name, recursive operations on a directory higher up will 
fail because they run in a loop (dir/"" being interpreted as dir). In one 
case, /rw/foo/bar/"" still existed after 'rm -rf /rw/foo', which had some 
unpleasant consequences.

It's not a big issue to write a patch to ignore DIRENT nodes with nsize = 
0. At the moment, though, I am more concerned about how this DIRENT node 
came to be in the first place -- I am suspecting some mix-up in GC. Has 
anybody else observed this kind of problem?

Best regards,
Thomas Betker
