Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpUOl-0005r7-4Z
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 12:01:52 -0400
Received: from [10.1.1.102] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	27 Jul 2004 12:01:49 -0400
Date: Tue, 27 Jul 2004 11:57:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.60.0407271156200.5684@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: Already there is  data 0x1985 shown in do_write_oneword() at a
 location before write (fwd)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   forwarded from a colleague:

---------- Forwarded message ----------
Date: Tue, 27 Jul 2004 11:26:25 -0400

         We met a situation that is write flash time out in 
do_write_oneword() on Am29LV128MH, so we printed the 
before-write-word,wanted-write-word, and the after-write-word. The 
interesting thing is that the before-write-word always is 0x1985 in 3 
times timeout write of total 52,688,813 times write, because 0x1985 is 
the first mark word of any jffs2 node, so it makes me guess if a dirty 
space is allocated to write by regarding this dirty space to be clean 
space.

         Any thought?

         Another thing is in jffs2_garbage_collect_pristine() function, 
the parts of the code is interesting

         if (!retried && (nraw == jffs2_alloc_raw_node_ref())) {
                /* Try to reallocate space and retry */
                uint32_t dummy;
                struct jffs2_eraseblock *jeb = &c->blocks[phys_ofs /
c->sector_size];
                 .....

         why not here we use:
                     if (!retried && (nraw = jffs2_alloc_raw_node_ref())) {
                             ....

thanks.
