Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXAOh-000865-8I
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 18:05:32 +0000
Date: Mon, 17 Jul 2017 21:04:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] ubifs: Fix unlink code wrt. double hash lookups
Message-ID: <20170717180458.abqmp7w42yytfciv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard Weinberger,

The patch 781f675e2d7e: "ubifs: Fix unlink code wrt. double hash
lookups" from May 17, 2017, leads to the following static checker
warning:

	fs/ubifs/tnc.c:1893 search_dh_cookie()
	error: uninitialized symbol 'err'.

fs/ubifs/tnc.c
  1883  static int search_dh_cookie(struct ubifs_info *c, const union ubifs_key *key,
  1884                              struct ubifs_dent_node *dent, uint32_t cookie,
  1885                              struct ubifs_znode **zn, int *n)
  1886  {
  1887          int err;
                ^^^^^^^

This used to be initialized with:

	err = ubifs_lookup_level0(c, &start_key, &znode, &n);

  1888          struct ubifs_znode *znode = *zn;
  1889          struct ubifs_zbranch *zbr;
  1890          union ubifs_key *dkey;
  1891  
  1892          for (;;) {
  1893                  if (!err) {
                            ^^^^
Uninitialized.

  1894                          err = tnc_next(c, &znode, n);
  1895                          if (err)
  1896                                  goto out;
  1897                  }
  1898  
  1899                  zbr = &znode->zbranch[*n];
  1900                  dkey = &zbr->key;
  1901  
  1902                  if (key_inum(c, dkey) != key_inum(c, key) ||
  1903                      key_type(c, dkey) != key_type(c, key)) {
  1904                          err = -ENOENT;
  1905                          goto out;
  1906                  }
  1907  
  1908                  err = tnc_read_hashed_node(c, zbr, dent);
  1909                  if (err)
  1910                          goto out;
  1911  
  1912                  if (key_hash(c, key) == key_hash(c, dkey) &&
  1913                      le32_to_cpu(dent->cookie) == cookie) {
  1914                          *zn = znode;
  1915                          goto out;
  1916                  }
  1917          }
  1918  
  1919  out:
  1920  
  1921          return err;
  1922  }

regards,
dan carpenter
