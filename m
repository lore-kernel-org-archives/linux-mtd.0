Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bo6Ee-0005Nq-C2
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2004 16:01:45 -0400
Received: from [10.1.1.113] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	23 Jul 2004 16:01:37 -0400
Date: Fri, 23 Jul 2004 15:57:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.60.0407231550080.4572@dell.enoriver.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: timeout of flash write, possible fix in gc.c?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   (A colleague passed this on to me to post, I did some editing so I 
hope I'm representing the problem accurately.)

   Scenario:  JFFS2 2.2 code back-ported to ~2.4.22 kernel source tree,
850DE processor with 2x16M AMD MirrorBit flash chips, concatenated.
3.5M of that is already spoken for, so the write test was run on the 
remaining 28.5M.  According to my colleague:

   "First we run the makefiles to fill the area until 95% space are
filled.  Then we run a modified checkfs which reads the file, does a
checksum and overwrites it again in a loop.

   (the makefiles and checkfs are the files under mtd/utils/checkfs)

   But sometimes we get the following messages endlessly:

   MTD do_write_oneword(): software timeout
   Write of 2616 bytes at 0x0198e594 failed. returned -5,retlen 0
   jffs2_garbage_collect_pristine():Not marking the space at 0x0198e594 
as dirty because the flash driver returned retlen zero
   MTD do_write_oneword(): software timeout
   Write of 2616 bytes at 0x0198e594 failed. returned -5, retlen 0
   jffs2_garbage_collect_pristine():Not marking the space at 0x0198e594 
as dirty because the flash driver returned retlen zero
   MTD do_write_oneword(): software timeout
   Write of 2616 bytes at 0x0198e594 failed. returned -5, retlen 0
   jffs2_garbage_collect_pristine():Not marking the space at 0x0198e594 
as dirty because the flash driver returned retlen zero
                         ................

         maybe the original code:

                   if (retlen) {
                         /* Doesn't belong to any inode */
                        nraw->next_in_ino = NULL;

                        nraw->flash_offset |= REF_OBSOLETE;
                        jffs2_add_physical_node_ref(c, nraw);
                        jffs2_mark_node_obsolete(c, nraw);
                   } else {
                        printk(KERN_NOTICE "Not marking the space at 0x%08x
as dirty because the flash driver returned retlen zero\n",
nraw->flash_offset);
                         jffs2_free_raw_node_ref(nraw);
                       }

         should be modified to:

                       /* Doesn't belong to any inode */
                        nraw->next_in_ino = NULL;

                        nraw->flash_offset |= REF_OBSOLETE;
                        jffs2_add_physical_node_ref(c, nraw);
                        jffs2_mark_node_obsolete(c, nraw);


         because:

if retlen==0 and we do not mark this node obsolete, next time when the 
GC comes in , the same flash space will be reserved and the mtd write 
fails again, so we will go into an endless loop."

   thoughts?

rday
