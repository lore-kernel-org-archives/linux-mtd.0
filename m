Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Snnoj-0001Pr-Ht
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2012 09:30:36 +0000
Date: Sun, 8 Jul 2012 11:21:46 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
Subject: question about fs/ubifs/orphan.c
Message-ID: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function ubifs_orphan_start_commit contains the code:

         list_for_each_entry(orphan, &c->orph_new, new_list) {
                 ubifs_assert(orphan->new);
                 orphan->new = 0;
                 *last = orphan;
                 last = &orphan->cnext;
         }
         *last = orphan->cnext;

After list_for_each_entry, orphan is just an address at an offset from the 
list head, not a pointer to a real structure.  So it does not seem correct 
to access its cnext field.

julia
