Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiAdX-0000jS-Vf
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 20:39:24 +0000
Received: by yenr9 with SMTP id r9so2042373yen.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 13:39:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120610100839.1f0ff1fe@pixies.home.jungo.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
 <20120606175507.GC17332@parrot.com>
 <1339054570.6875.84.camel@sauron.fi.intel.com>
 <4FD0E632.2080905@newsguy.com>
 <20120610100839.1f0ff1fe@pixies.home.jungo.com>
Date: Fri, 22 Jun 2012 13:39:20 -0700
Message-ID: <CAN8TOE90sB0-ZHZPX4+ASUDBCSRHgumVqDu0BOrcphyijm6Xgw@mail.gmail.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ivan Djelic <ivan.djelic@parrot.com>, dwmw2@infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 10, 2012 at 12:08 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> To summarize, return value of the 'mtd_read_oob()' API is
> inconsistent (sometimes max_bitflips, other times EUCLEAN), and does not
> adhere to return code policy of 'mtd_read()' - return EUCLEAN to the users,
> they're not interested with internals such as max_bitflips.
>
> This might affect users of 'mtd_read_oob()' which might falsely think
> the OOB read has failed.
>
> Mike, care to take a look and amend if necessary?
> I think this needs to be fixed pre v3.5 as well.

Mike, are you planning on handling this?

I think it would be safe to basically C&P the max_bitflips code from
mtd_read() into mtd_read_oob(). This would simply pass through the
EUCLEAN that may be returned for OOB-only case (only for my driver?),
and it would translate the 'ret_code > 0' case properly for data+OOB
reads. I'll resend officially if this looks OK. Or I'll defer to Mike
if he's working on this.

Brian

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5757307..37c9820 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -821,6 +821,27 @@ int mtd_read(struct mtd_info *mtd, loff_t from,
size_t len, size_t *retlen,
 }
 EXPORT_SYMBOL_GPL(mtd_read);

+int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
+{
+       int ret_code;
+       ops->retlen = ops->oobretlen = 0;
+       if (!mtd->_read_oob)
+               return -EOPNOTSUPP;
+       /*
+        * In cases where ops->datbuf != NULL, mtd->_read_oob() can have
+        * semantics similar to mtd->_read(), regarding max bitflips. In other
+        * cases, mtd->_read_oob() may return -EUCLEAN. In all cases, perform
+        * similar logic to mtd_read() (see above).
+        */
+       ret_code = mtd->_read_oob(mtd, from, ops);
+       if (unlikely(ret_code < 0))
+               return ret_code;
+       if (mtd->ecc_strength == 0)
+               return 0;       /* device lacks ecc */
+       return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
+}
+EXPORT_SYMBOL_GPL(mtd_read_oob);
+
 int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
              const u_char *buf)
 {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 63dadc0..81d61e7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -265,14 +265,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to,
size_t len, size_t *retlen,
 int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
size_t *retlen,
                    const u_char *buf);

-static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
-                              struct mtd_oob_ops *ops)
-{
-       ops->retlen = ops->oobretlen = 0;
-       if (!mtd->_read_oob)
-               return -EOPNOTSUPP;
-       return mtd->_read_oob(mtd, from, ops);
-}
+int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops);

 static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
                                struct mtd_oob_ops *ops)
