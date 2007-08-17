Received: from smtpd4.aruba.it ([62.149.128.209] helo=smtp4.aruba.it)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IM5NQ-00076m-B3
	for linux-mtd@lists.infradead.org; Fri, 17 Aug 2007 13:12:52 -0400
Message-ID: <46C5D764.5000303@andorsystems.com>
Date: Fri, 17 Aug 2007 19:14:12 +0200
From: giulio fedel <giulio.fedel@andorsystems.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: jffs2 kernel dump with 2.6.22-rc7
References: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>
In-Reply-To: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In jffs2_do_unlink() in fs/jffs2/write.c
the jffs2_complete_reservation(c) is called even if 
jffs2_reserve_space() is not called. This cause an unmatched 
up(&c->alloc_sem) so the locking mechanism does not work.
People using MTD_CAP_NORFLASH flash _and_ CONFIG_JFFS2_SUMMARY do not 
see the problem (see  os-linux.h for the definition of 
jffs2_can_mark_obsolete(c)).

I think this is your problem (it was the mine).

Regards.

     Giulio Fedel


--- fs/jffs2/write.c.orig       2007-08-17 19:01:04.000000000 +0200
+++ fs/jffs2/write.c    2007-08-17 19:00:41.000000000 +0200
@@ -549,6 +549,7 @@ int jffs2_do_unlink(struct jffs2_sb_info
                 /* File it. This will mark the old one obsolete. */
                 jffs2_add_fd_to_list(c, fd, &dir_f->dents);
                 up(&dir_f->sem);
+               jffs2_complete_reservation(c);
         } else {
                 struct jffs2_full_dirent **prev = &dir_f->dents;
                 uint32_t nhash = full_name_hash(name, namelen);
@@ -605,7 +606,6 @@ int jffs2_do_unlink(struct jffs2_sb_info
                 up(&dead_f->sem);
         }

-       jffs2_complete_reservation(c);

         return 0;
  }
