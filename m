Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCnIK-0005R8-2w
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 09:04:36 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so433470pdi.5
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 02:04:12 -0700 (PDT)
Message-ID: <52172581.6060101@gmail.com>
Date: Fri, 23 Aug 2013 17:04:01 +0800
From: Ming Liu <liu.ming50@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [JFFS2] Revision "jffs2: Fix lock acquisition order bug in
 jffs2_write_begin" introduces another dead lock.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: deng.chao1@zte.com.cn, thomas.betker@freenet.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all:

I've been working with 2.6.34 stable kernel and recently encountered a 
AB-BA dead lock issue with jffs2, the scenario is:

Run two scripts at the same time:

Script 1:

#!/bin/bash

while [ 1 ]

do

cp /mnt/mtd-folder/region_a/xxx.tar.gz /mnt/mtd-folder/region_b

usleep 10

done


Script 2:

#!/bin/bash

while [ 1 ]

do

tar -zxvf /mnt/mtd-folder/region_b/.tar.gz -C /dev/shm

done

In several hours, the processes "cp", "tar" and "jffs2_gcd_mtd" all turn 
to "D" state. After some investigation, I found that it's introduced by 
commit "jffs2: Fix lock acquisition order bug in jffs2_write_begin", 
which tried to fix a AB-BA dead lock as:

jffs2_garbage_collect_live

mutex_lock(&f->sem) (A)

jffs2_garbage_collect_dnode

     jffs2_gc_fetch_page

         read_cache_page_async

             do_read_cache_page

lock_page(page)             (B)



jffs2_write_begin

grab_cache_page_write_begin

     find_lock_page

lock_page(page)                     (B)

mutex_lock(&f->sem) (A)


But for do_generic_file_read()  first acquires the page lock, then 
f->sem,causes another AB-BA deadlock with jffs2_write_begin(), which 
firstacquires f->sem, then the page lock:

jffs2_write_begin

mutex_lock(&f->sem) (A)

grab_cache_page_write_begin

     find_lock_page

lock_page(page)                     (B)

do_generic_file_read

lock_page_killable(page) (B)

     jffs2_readpage

mutex_lock(&f->sem)                     (A)


I also noticed there was another thread discussed a similar deadlock 
also related to the same commit, with the title: "[JFFS2]The patch 
"jffs2: Fix lock acquisition order bug in jffs2_write_begin" introduces 
another dead lock bug.", posted by Deng Chao. And Deng had proposed a 
idea that involving in a function "read_cache_page_async_trylock" 
instead of "read_cache_page_async", is there anybody has implement that?

the best,
thank you
