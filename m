Received: from mgw2.diku.dk ([130.225.96.92])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OgNsM-0005g8-R5
	for linux-mtd@lists.infradead.org; Tue, 03 Aug 2010 20:14:16 +0000
Date: Tue, 3 Aug 2010 22:12:08 +0200 (CEST)
From: Julia Lawall <julia@diku.dk>
To: dedekind1@gmail.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: question about drivers/mtd/ubi/cdev.c
Message-ID: <Pine.LNX.4.64.1008032206060.20393@ask.diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was wondering about the following code in the function rename_volumes in 
the file drivers/mtd/ubi/cdev.c:

list_for_each_entry(re, &rename_list, list) {
	...
        if (no_remove_needed)
                continue;
	...
        re = kzalloc(sizeof(struct ubi_rename_entry), GFP_KERNEL);
	if (!re) { ... }
        re->remove = 1;
        re->desc = desc;
        list_add(&re->list, &rename_list);
	...
}

Is there a danger of repeating computation since re is redefined and moved 
back to the beginning of the list?

julia
