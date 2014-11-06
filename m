Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmK2V-0001Mz-Hr
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 10:11:40 +0000
Date: Thu, 6 Nov 2014 13:09:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: potential memory corruption in check_leaf()
Message-ID: <20141106100901.GA19282@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem Bityutskiy,

The patch 1e51764a3c2a: "UBIFS: add new flash file system" from Jul
14, 2008, leads to the following static checker warning:

	fs/ubifs/debug.c:2039 check_leaf()
	warn: is 'node' large enough for 'struct ubifs_data_node'?

fs/ubifs/debug.c
  1978  static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
  1979                        void *priv)
  1980  {
  1981          ino_t inum;
  1982          void *node;
  1983          struct ubifs_ch *ch;
  1984          int err, type = key_type(c, &zbr->key);
  1985          struct fsck_inode *fscki;
  1986  
  1987          if (zbr->len < UBIFS_CH_SZ) {
                    ^^^^^^^^^^^^^^^^^^^^^^^
We check that ->len is at least 24 bytes.

  1988                  ubifs_err("bad leaf length %d (LEB %d:%d)",
  1989                            zbr->len, zbr->lnum, zbr->offs);
  1990                  return -EINVAL;
  1991          }
  1992  
  1993          node = kmalloc(zbr->len, GFP_NOFS);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Allocate node.

  1994          if (!node)
  1995                  return -ENOMEM;
  1996  
  1997          err = ubifs_tnc_read_node(c, zbr, node);
  1998          if (err) {
  1999                  ubifs_err("cannot read leaf node at LEB %d:%d, error %d",
  2000                            zbr->lnum, zbr->offs, err);
  2001                  goto out_free;
  2002          }
  2003  
  2004          /* If this is an inode node, add it to RB-tree of inodes */
  2005          if (type == UBIFS_INO_KEY) {
  2006                  fscki = add_inode(c, priv, node);
  2007                  if (IS_ERR(fscki)) {
  2008                          err = PTR_ERR(fscki);
  2009                          ubifs_err("error %d while adding inode node", err);
  2010                          goto out_dump;
  2011                  }
  2012                  goto out;
  2013          }
  2014  
  2015          if (type != UBIFS_DENT_KEY && type != UBIFS_XENT_KEY &&
  2016              type != UBIFS_DATA_KEY) {
  2017                  ubifs_err("unexpected node type %d at LEB %d:%d",
  2018                            type, zbr->lnum, zbr->offs);
  2019                  err = -EINVAL;
  2020                  goto out_free;
  2021          }
  2022  
  2023          ch = node;
                ^^^^^^^^^^
24 bytes is large enough for "ch".

  2024          if (le64_to_cpu(ch->sqnum) > c->max_sqnum) {
  2025                  ubifs_err("too high sequence number, max. is %llu",
  2026                            c->max_sqnum);
  2027                  err = -EINVAL;
  2028                  goto out_dump;
  2029          }
  2030  
  2031          if (type == UBIFS_DATA_KEY) {
  2032                  long long blk_offs;
  2033                  struct ubifs_data_node *dn = node;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
But it's not large enough for "dn".

  2034  
  2035                  /*
  2036                   * Search the inode node this data node belongs to and insert
  2037                   * it to the RB-tree of inodes.
  2038                   */
  2039                  inum = key_inum_flash(c, &dn->key);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The check waits until we use "dn" before complaining, in case there is
another size check after the assignment.

Also on the other side of the if statement:
fs/ubifs/debug.c:2071 check_leaf() warn: is 'node' large enough for 'struct ubifs_dent_node'?

regards,
dan carpenter
