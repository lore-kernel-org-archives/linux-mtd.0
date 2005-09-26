Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJwc8-0005Y2-HK
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 13:18:23 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050926110150.GG17756@wohnheim.fh-wedel.de>
References: <1127433949.6937.30.camel@localhost.localdomain>
	<20050925150635.GD28978@wohnheim.fh-wedel.de>
	<4337B727.2050809@yandex.ru>
	<20050926093440.GE17756@wohnheim.fh-wedel.de>
	<4337C35C.6060007@yandex.ru>
	<20050926110150.GG17756@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed; boundary="=-34lyUa/kZYqPavJPEvcW"
Date: Mon, 26 Sep 2005 11:17:53 -0600
Message-Id: <1127755073.6937.74.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2 whitespace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-34lyUa/kZYqPavJPEvcW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Mon, 2005-09-26 at 13:01 +0200, Jörn Engel wrote:
> On Mon, 26 September 2005 13:46:04 +0400, Artem B. Bityutskiy wrote:
> > Jörn Engel wrote:
> > >Because we want things like ebh, summary, xattr, etc.?  If we accept
> > >this patch, it makes life a bit worse for people who write the stuff
> > >we want.  It may be the straw that makes them go away and never come
> > >back.

I agree that other patches are more important than code formatting.
However, we may also enable more people to contribute to jffs2 if the
code is as readable/understandable as possible. I want to help make a
small, but tangible step in that direction.

> Imo, the costs outweigh the benefit.  [ Which doesn't mean that I
> question the benefit.  It's just not big enough. ]

Since there appears to be at least some benefit, maybe we can do this in
easy to digest pieces. I have made another patch just against the files
concerning compression in jffs2. These files had a lot of problems and I
do not believe they conflict with any of the main outstanding patches
(ebh, xattr, centsum).

Thanks to Jörn and Artem for their feedback; it is much appreciated.

Pete

--=-34lyUa/kZYqPavJPEvcW
Content-Disposition: attachment; filename=jffs2-whitespace-compr.patch
Content-Type: text/x-patch; name=jffs2-whitespace-compr.patch; charset=utf-8
Content-Transfer-Encoding: 7bit

--- mtd/fs/jffs2/compr.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr.c	2005-09-26 10:31:27.000000000 -0600
@@ -24,151 +24,150 @@
 static int jffs2_compression_mode = JFFS2_COMPR_MODE_PRIORITY;
 
 /* Statistics for blocks stored without compression */
-static uint32_t none_stat_compr_blocks=0,none_stat_decompr_blocks=0,none_stat_compr_size=0;
+static uint32_t none_stat_compr_blocks = 0, none_stat_decompr_blocks = 0, none_stat_compr_size = 0;
 
 /* jffs2_compress:
  * @data: Pointer to uncompressed data
  * @cdata: Pointer to returned pointer to buffer for compressed data
  * @datalen: On entry, holds the amount of data available for compression.
- *	On exit, expected to hold the amount of data actually compressed.
+ *      On exit, expected to hold the amount of data actually compressed.
  * @cdatalen: On entry, holds the amount of space available for compressed
- *	data. On exit, expected to hold the actual size of the compressed
- *	data.
+ *      data. On exit, expected to hold the actual size of the compressed
+ *      data.
  *
  * Returns: Lower byte to be stored with data indicating compression type used.
- * Zero is used to show that the data could not be compressed - the 
+ * Zero is used to show that the data could not be compressed - the
  * compressed version was actually larger than the original.
  * Upper byte will be used later. (soon)
  *
  * If the cdata buffer isn't large enough to hold all the uncompressed data,
- * jffs2_compress should compress as much as will fit, and should set 
+ * jffs2_compress should compress as much as will fit, and should set
  * *datalen accordingly to show the amount of data which were compressed.
  */
 uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-			     unsigned char *data_in, unsigned char **cpage_out, 
-			     uint32_t *datalen, uint32_t *cdatalen)
+			unsigned char *data_in, unsigned char **cpage_out,
+			uint32_t *datalen, uint32_t *cdatalen)
 {
 	int ret = JFFS2_COMPR_NONE;
-        int compr_ret;
-        struct jffs2_compressor *this, *best=NULL;
-        unsigned char *output_buf = NULL, *tmp_buf;
-        uint32_t orig_slen, orig_dlen;
-        uint32_t best_slen=0, best_dlen=0;
-
-        switch (jffs2_compression_mode) {
-        case JFFS2_COMPR_MODE_NONE:
-                break;
-        case JFFS2_COMPR_MODE_PRIORITY:
-                output_buf = kmalloc(*cdatalen,GFP_KERNEL);
-                if (!output_buf) {
-                        printk(KERN_WARNING "JFFS2: No memory for compressor allocation. Compression failed.\n");
-                        goto out;
-                }
-                orig_slen = *datalen;
-                orig_dlen = *cdatalen;
-                spin_lock(&jffs2_compressor_list_lock);
-                list_for_each_entry(this, &jffs2_compressor_list, list) {
-                        /* Skip decompress-only backwards-compatibility and disabled modules */
-                        if ((!this->compress)||(this->disabled))
-                                continue;
-
-                        this->usecount++;
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        *datalen  = orig_slen;
-                        *cdatalen = orig_dlen;
-                        compr_ret = this->compress(data_in, output_buf, datalen, cdatalen, NULL);
-                        spin_lock(&jffs2_compressor_list_lock);
-                        this->usecount--;
-                        if (!compr_ret) {
-                                ret = this->compr;
-                                this->stat_compr_blocks++;
-                                this->stat_compr_orig_size += *datalen;
-                                this->stat_compr_new_size  += *cdatalen;
-                                break;
-                        }
-                }
-                spin_unlock(&jffs2_compressor_list_lock);
-                if (ret == JFFS2_COMPR_NONE) kfree(output_buf);
-                break;
-        case JFFS2_COMPR_MODE_SIZE:
-                orig_slen = *datalen;
-                orig_dlen = *cdatalen;
-                spin_lock(&jffs2_compressor_list_lock);
-                list_for_each_entry(this, &jffs2_compressor_list, list) {
-                        /* Skip decompress-only backwards-compatibility and disabled modules */
-                        if ((!this->compress)||(this->disabled))
-                                continue;
-                        /* Allocating memory for output buffer if necessary */
-                        if ((this->compr_buf_size<orig_dlen)&&(this->compr_buf)) {
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                kfree(this->compr_buf);
-                                spin_lock(&jffs2_compressor_list_lock);
-                                this->compr_buf_size=0;
-                                this->compr_buf=NULL;
-                        }
-                        if (!this->compr_buf) {
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                tmp_buf = kmalloc(orig_dlen,GFP_KERNEL);
-                                spin_lock(&jffs2_compressor_list_lock);
-                                if (!tmp_buf) {
-                                        printk(KERN_WARNING "JFFS2: No memory for compressor allocation. (%d bytes)\n",orig_dlen);
-                                        continue;
-                                }
-                                else {
-                                        this->compr_buf = tmp_buf;
-                                        this->compr_buf_size = orig_dlen;
-                                }
-                        }
-                        this->usecount++;
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        *datalen  = orig_slen;
-                        *cdatalen = orig_dlen;
-                        compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen, NULL);
-                        spin_lock(&jffs2_compressor_list_lock);
-                        this->usecount--;
-                        if (!compr_ret) {
-                                if ((!best_dlen)||(best_dlen>*cdatalen)) {
-                                        best_dlen = *cdatalen;
-                                        best_slen = *datalen;
-                                        best = this;
-                                }
-                        }
-                }
-                if (best_dlen) {
-                        *cdatalen = best_dlen;
-                        *datalen  = best_slen;
-                        output_buf = best->compr_buf;
-                        best->compr_buf = NULL;
-                        best->compr_buf_size = 0;
-                        best->stat_compr_blocks++;
-                        best->stat_compr_orig_size += best_slen;
-                        best->stat_compr_new_size  += best_dlen;
-                        ret = best->compr;
-                }
-                spin_unlock(&jffs2_compressor_list_lock);
-                break;
-        default:
-                printk(KERN_ERR "JFFS2: unknow compression mode.\n");
-        }
+	int compr_ret;
+	struct jffs2_compressor *this, *best = NULL;
+	unsigned char *output_buf = NULL, *tmp_buf;
+	uint32_t orig_slen, orig_dlen;
+	uint32_t best_slen = 0, best_dlen = 0;
+
+	switch (jffs2_compression_mode) {
+	case JFFS2_COMPR_MODE_NONE:
+		break;
+	case JFFS2_COMPR_MODE_PRIORITY:
+		output_buf = kmalloc(*cdatalen, GFP_KERNEL);
+		if (!output_buf) {
+			printk(KERN_WARNING "JFFS2: No memory for compressor allocation. Compression failed.\n");
+			goto out;
+		}
+		orig_slen = *datalen;
+		orig_dlen = *cdatalen;
+		spin_lock(&jffs2_compressor_list_lock);
+		list_for_each_entry(this, &jffs2_compressor_list, list) {
+			/* Skip decompress-only backwards-compatibility and disabled modules */
+			if ((!this->compress)||(this->disabled))
+				continue;
+
+			this->usecount++;
+			spin_unlock(&jffs2_compressor_list_lock);
+			*datalen  = orig_slen;
+			*cdatalen = orig_dlen;
+			compr_ret = this->compress(data_in, output_buf, datalen, cdatalen, NULL);
+			spin_lock(&jffs2_compressor_list_lock);
+			this->usecount--;
+			if (!compr_ret) {
+				ret = this->compr;
+				this->stat_compr_blocks++;
+				this->stat_compr_orig_size += *datalen;
+				this->stat_compr_new_size  += *cdatalen;
+				break;
+			}
+		}
+		spin_unlock(&jffs2_compressor_list_lock);
+		if (ret == JFFS2_COMPR_NONE)
+			kfree(output_buf);
+		break;
+	case JFFS2_COMPR_MODE_SIZE:
+		orig_slen = *datalen;
+		orig_dlen = *cdatalen;
+		spin_lock(&jffs2_compressor_list_lock);
+		list_for_each_entry(this, &jffs2_compressor_list, list) {
+			/* Skip decompress-only backwards-compatibility and disabled modules */
+			if ((!this->compress)||(this->disabled))
+				continue;
+			/* Allocating memory for output buffer if necessary */
+			if ((this->compr_buf_size < orig_dlen)&&(this->compr_buf)) {
+				spin_unlock(&jffs2_compressor_list_lock);
+				kfree(this->compr_buf);
+				spin_lock(&jffs2_compressor_list_lock);
+				this->compr_buf_size = 0;
+				this->compr_buf = NULL;
+			}
+			if (!this->compr_buf) {
+				spin_unlock(&jffs2_compressor_list_lock);
+				tmp_buf = kmalloc(orig_dlen, GFP_KERNEL);
+				spin_lock(&jffs2_compressor_list_lock);
+				if (!tmp_buf) {
+					printk(KERN_WARNING "JFFS2: No memory for compressor allocation. (%d bytes)\n", orig_dlen);
+					continue;
+				} else {
+					this->compr_buf = tmp_buf;
+					this->compr_buf_size = orig_dlen;
+				}
+			}
+			this->usecount++;
+			spin_unlock(&jffs2_compressor_list_lock);
+			*datalen  = orig_slen;
+			*cdatalen = orig_dlen;
+			compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen, NULL);
+			spin_lock(&jffs2_compressor_list_lock);
+			this->usecount--;
+			if (!compr_ret) {
+				if ((!best_dlen) || (best_dlen > *cdatalen)) {
+					best_dlen = *cdatalen;
+					best_slen = *datalen;
+					best = this;
+				}
+			}
+		}
+		if (best_dlen) {
+			*cdatalen = best_dlen;
+			*datalen  = best_slen;
+			output_buf = best->compr_buf;
+			best->compr_buf = NULL;
+			best->compr_buf_size = 0;
+			best->stat_compr_blocks++;
+			best->stat_compr_orig_size += best_slen;
+			best->stat_compr_new_size  += best_dlen;
+			ret = best->compr;
+		}
+		spin_unlock(&jffs2_compressor_list_lock);
+		break;
+	default:
+		printk(KERN_ERR "JFFS2: unknow compression mode.\n");
+	}
  out:
-        if (ret == JFFS2_COMPR_NONE) {
-	        *cpage_out = data_in;
-	        *datalen = *cdatalen;
-                none_stat_compr_blocks++;
-                none_stat_compr_size += *datalen;
-        }
-        else {
-                *cpage_out = output_buf;
-        }
+	if (ret == JFFS2_COMPR_NONE) {
+		*cpage_out = data_in;
+		*datalen = *cdatalen;
+		none_stat_compr_blocks++;
+		none_stat_compr_size += *datalen;
+	} else {
+		*cpage_out = output_buf;
+	}
 	return ret;
 }
 
 int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-		     uint16_t comprtype, unsigned char *cdata_in, 
+		     uint16_t comprtype, unsigned char *cdata_in,
 		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen)
 {
-        struct jffs2_compressor *this;
-        int ret;
+	struct jffs2_compressor *this;
+	int ret;
 
 	/* Older code had a bug where it would write non-zero 'usercompr'
 	   fields. Deal with it. */
@@ -185,26 +184,25 @@
 		memset(data_out, 0, datalen);
 		break;
 	default:
-                spin_lock(&jffs2_compressor_list_lock);
-                list_for_each_entry(this, &jffs2_compressor_list, list) {
-                        if (comprtype == this->compr) {
-                                this->usecount++;
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                ret = this->decompress(cdata_in, data_out, cdatalen, datalen, NULL);
-                                spin_lock(&jffs2_compressor_list_lock);
-                                if (ret) {
-                                        printk(KERN_WARNING "Decompressor \"%s\" returned %d\n", this->name, ret);
-                                }
-                                else {
-                                        this->stat_decompr_blocks++;
-                                }
-                                this->usecount--;
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                return ret;
-                        }
-                }
+		spin_lock(&jffs2_compressor_list_lock);
+		list_for_each_entry(this, &jffs2_compressor_list, list) {
+			if (comprtype == this->compr) {
+				this->usecount++;
+				spin_unlock(&jffs2_compressor_list_lock);
+				ret = this->decompress(cdata_in, data_out, cdatalen, datalen, NULL);
+				spin_lock(&jffs2_compressor_list_lock);
+				if (ret) {
+					printk(KERN_WARNING "Decompressor \"%s\" returned %d\n", this->name, ret);
+				} else {
+					this->stat_decompr_blocks++;
+				}
+				this->usecount--;
+				spin_unlock(&jffs2_compressor_list_lock);
+				return ret;
+			}
+		}
 		printk(KERN_WARNING "JFFS2 compression type 0x%02x not available.\n", comprtype);
-                spin_unlock(&jffs2_compressor_list_lock);
+		spin_unlock(&jffs2_compressor_list_lock);
 		return -EIO;
 	}
 	return 0;
@@ -212,60 +210,60 @@
 
 int jffs2_register_compressor(struct jffs2_compressor *comp)
 {
-        struct jffs2_compressor *this;
+	struct jffs2_compressor *this;
 
-        if (!comp->name) {
-                printk(KERN_WARNING "NULL compressor name at registering JFFS2 compressor. Failed.\n");
-                return -1;
-        }
-        comp->compr_buf_size=0;
-        comp->compr_buf=NULL;
-        comp->usecount=0;
-        comp->stat_compr_orig_size=0;
-        comp->stat_compr_new_size=0;
-        comp->stat_compr_blocks=0;
-        comp->stat_decompr_blocks=0;
-        D1(printk(KERN_DEBUG "Registering JFFS2 compressor \"%s\"\n", comp->name));
-
-        spin_lock(&jffs2_compressor_list_lock);
-
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (this->priority < comp->priority) {
-                        list_add(&comp->list, this->list.prev);
-                        goto out;
-                }
-        }
-        list_add_tail(&comp->list, &jffs2_compressor_list);
+	if (!comp->name) {
+		printk(KERN_WARNING "NULL compressor name at registering JFFS2 compressor. Failed.\n");
+		return -1;
+	}
+	comp->compr_buf_size = 0;
+	comp->compr_buf = NULL;
+	comp->usecount = 0;
+	comp->stat_compr_orig_size = 0;
+	comp->stat_compr_new_size = 0;
+	comp->stat_compr_blocks = 0;
+	comp->stat_decompr_blocks = 0;
+	D1(printk(KERN_DEBUG "Registering JFFS2 compressor \"%s\"\n", comp->name));
+
+	spin_lock(&jffs2_compressor_list_lock);
+
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (this->priority < comp->priority) {
+			list_add(&comp->list, this->list.prev);
+			goto out;
+		}
+	}
+	list_add_tail(&comp->list, &jffs2_compressor_list);
 out:
-        D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
-                printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
-        })
+	D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
+		printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
+	})
 
-        spin_unlock(&jffs2_compressor_list_lock);
+	spin_unlock(&jffs2_compressor_list_lock);
 
-        return 0;
+	return 0;
 }
 
 int jffs2_unregister_compressor(struct jffs2_compressor *comp)
 {
-        D2(struct jffs2_compressor *this;)
+	D2(struct jffs2_compressor *this;)
 
-        D1(printk(KERN_DEBUG "Unregistering JFFS2 compressor \"%s\"\n", comp->name));
+		D1(printk(KERN_DEBUG "Unregistering JFFS2 compressor \"%s\"\n", comp->name));
 
-        spin_lock(&jffs2_compressor_list_lock);
+	spin_lock(&jffs2_compressor_list_lock);
+
+	if (comp->usecount) {
+		spin_unlock(&jffs2_compressor_list_lock);
+		printk(KERN_WARNING "JFFS2: Compressor modul is in use. Unregister failed.\n");
+		return -1;
+	}
+	list_del(&comp->list);
 
-        if (comp->usecount) {
-                spin_unlock(&jffs2_compressor_list_lock);
-                printk(KERN_WARNING "JFFS2: Compressor modul is in use. Unregister failed.\n");
-                return -1;
-        }
-        list_del(&comp->list);
-
-        D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
-                printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
-        })
-        spin_unlock(&jffs2_compressor_list_lock);
-        return 0;
+	D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
+		printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
+	})
+	spin_unlock(&jffs2_compressor_list_lock);
+	return 0;
 }
 
 #ifdef CONFIG_JFFS2_PROC
@@ -274,184 +272,184 @@
 
 char *jffs2_list_compressors(void)
 {
-        struct jffs2_compressor *this;
-        char *buf, *act_buf;
+	struct jffs2_compressor *this;
+	char *buf, *act_buf;
 
-        act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE,GFP_KERNEL);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                act_buf += sprintf(act_buf, "%10s priority:%d ", this->name, this->priority);
-                if ((this->disabled)||(!this->compress))
-                        act_buf += sprintf(act_buf,"disabled");
-                else
-                        act_buf += sprintf(act_buf,"enabled");
-                act_buf += sprintf(act_buf,"\n");
-        }
-        return buf;
+	act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE, GFP_KERNEL);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		act_buf += sprintf(act_buf, "%10s priority:%d ", this->name, this->priority);
+		if ((this->disabled)||(!this->compress))
+			act_buf += sprintf(act_buf, "disabled");
+		else
+			act_buf += sprintf(act_buf, "enabled");
+		act_buf += sprintf(act_buf, "\n");
+	}
+	return buf;
 }
 
 char *jffs2_stats(void)
 {
-        struct jffs2_compressor *this;
-        char *buf, *act_buf;
+	struct jffs2_compressor *this;
+	char *buf, *act_buf;
+
+	act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE, GFP_KERNEL);
+
+	act_buf += sprintf(act_buf, "JFFS2 compressor statistics:\n");
+	act_buf += sprintf(act_buf, "%10s   ", "none");
+	act_buf += sprintf(act_buf, "compr: %d blocks (%d)  decompr: %d blocks\n", none_stat_compr_blocks,
+			none_stat_compr_size, none_stat_decompr_blocks);
+	spin_lock(&jffs2_compressor_list_lock);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		act_buf += sprintf(act_buf, "%10s ", this->name);
+		if ((this->disabled)||(!this->compress))
+			act_buf += sprintf(act_buf, "- ");
+		else
+			act_buf += sprintf(act_buf, "+ ");
+		act_buf += sprintf(act_buf, "compr: %d blocks (%d/%d)  decompr: %d blocks ", this->stat_compr_blocks,
+				this->stat_compr_new_size, this->stat_compr_orig_size,
+				this->stat_decompr_blocks);
+		act_buf += sprintf(act_buf, "\n");
+	}
+	spin_unlock(&jffs2_compressor_list_lock);
+
+	return buf;
+}
 
-        act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE,GFP_KERNEL);
+char *jffs2_get_compression_mode_name(void)
+{
+	switch (jffs2_compression_mode) {
+	case JFFS2_COMPR_MODE_NONE:
+		return "none";
+	case JFFS2_COMPR_MODE_PRIORITY:
+		return "priority";
+	case JFFS2_COMPR_MODE_SIZE:
+		return "size";
+	}
+	return "unkown";
+}
 
-        act_buf += sprintf(act_buf,"JFFS2 compressor statistics:\n");
-        act_buf += sprintf(act_buf,"%10s   ","none");
-        act_buf += sprintf(act_buf,"compr: %d blocks (%d)  decompr: %d blocks\n", none_stat_compr_blocks, 
-                           none_stat_compr_size, none_stat_decompr_blocks);
-        spin_lock(&jffs2_compressor_list_lock);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                act_buf += sprintf(act_buf,"%10s ",this->name);
-                if ((this->disabled)||(!this->compress))
-                        act_buf += sprintf(act_buf,"- ");
-                else
-                        act_buf += sprintf(act_buf,"+ ");
-                act_buf += sprintf(act_buf,"compr: %d blocks (%d/%d)  decompr: %d blocks ", this->stat_compr_blocks, 
-                                   this->stat_compr_new_size, this->stat_compr_orig_size, 
-                                   this->stat_decompr_blocks);
-                act_buf += sprintf(act_buf,"\n");
-        }
-        spin_unlock(&jffs2_compressor_list_lock);
-
-        return buf;
-}
-
-char *jffs2_get_compression_mode_name(void) 
-{
-        switch (jffs2_compression_mode) {
-        case JFFS2_COMPR_MODE_NONE:
-                return "none";
-        case JFFS2_COMPR_MODE_PRIORITY:
-                return "priority";
-        case JFFS2_COMPR_MODE_SIZE:
-                return "size";
-        }
-        return "unkown";
-}
-
-int jffs2_set_compression_mode_name(const char *name) 
-{
-        if (!strcmp("none",name)) {
-                jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
-                return 0;
-        }
-        if (!strcmp("priority",name)) {
-                jffs2_compression_mode = JFFS2_COMPR_MODE_PRIORITY;
-                return 0;
-        }
-        if (!strcmp("size",name)) {
-                jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
-                return 0;
-        }
-        return 1;
+int jffs2_set_compression_mode_name(const char *name)
+{
+	if (!strcmp("none", name)) {
+		jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
+		return 0;
+	}
+	if (!strcmp("priority", name)) {
+		jffs2_compression_mode = JFFS2_COMPR_MODE_PRIORITY;
+		return 0;
+	}
+	if (!strcmp("size", name)) {
+		jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
+		return 0;
+	}
+	return 1;
 }
 
 static int jffs2_compressor_Xable(const char *name, int disabled)
 {
-        struct jffs2_compressor *this;
-        spin_lock(&jffs2_compressor_list_lock);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (!strcmp(this->name, name)) {
-                        this->disabled = disabled;
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        return 0;                        
-                }
-        }
-        spin_unlock(&jffs2_compressor_list_lock);
-        printk(KERN_WARNING "JFFS2: compressor %s not found.\n",name);
-        return 1;
+	struct jffs2_compressor *this;
+	spin_lock(&jffs2_compressor_list_lock);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (!strcmp(this->name, name)) {
+			this->disabled = disabled;
+			spin_unlock(&jffs2_compressor_list_lock);
+			return 0;
+		}
+	}
+	spin_unlock(&jffs2_compressor_list_lock);
+	printk(KERN_WARNING "JFFS2: compressor %s not found.\n", name);
+	return 1;
 }
 
 int jffs2_enable_compressor_name(const char *name)
 {
-        return jffs2_compressor_Xable(name, 0);
+	return jffs2_compressor_Xable(name, 0);
 }
 
 int jffs2_disable_compressor_name(const char *name)
 {
-        return jffs2_compressor_Xable(name, 1);
+	return jffs2_compressor_Xable(name, 1);
 }
 
 int jffs2_set_compressor_priority(const char *name, int priority)
 {
-        struct jffs2_compressor *this,*comp;
-        spin_lock(&jffs2_compressor_list_lock);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (!strcmp(this->name, name)) {
-                        this->priority = priority;
-                        comp = this;
-                        goto reinsert;
-                }
-        }
-        spin_unlock(&jffs2_compressor_list_lock);
-        printk(KERN_WARNING "JFFS2: compressor %s not found.\n",name);        
-        return 1;
+	struct jffs2_compressor *this, *comp;
+	spin_lock(&jffs2_compressor_list_lock);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (!strcmp(this->name, name)) {
+			this->priority = priority;
+			comp = this;
+			goto reinsert;
+		}
+	}
+	spin_unlock(&jffs2_compressor_list_lock);
+	printk(KERN_WARNING "JFFS2: compressor %s not found.\n", name);
+	return 1;
 reinsert:
-        /* list is sorted in the order of priority, so if
-           we change it we have to reinsert it into the
-           good place */
-        list_del(&comp->list);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (this->priority < comp->priority) {
-                        list_add(&comp->list, this->list.prev);
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        return 0;
-                }
-        }
-        list_add_tail(&comp->list, &jffs2_compressor_list);
-        spin_unlock(&jffs2_compressor_list_lock);
-        return 0;
+	/* list is sorted in the order of priority, so if
+	   we change it we have to reinsert it into the
+	   good place */
+	list_del(&comp->list);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (this->priority < comp->priority) {
+			list_add(&comp->list, this->list.prev);
+			spin_unlock(&jffs2_compressor_list_lock);
+			return 0;
+		}
+	}
+	list_add_tail(&comp->list, &jffs2_compressor_list);
+	spin_unlock(&jffs2_compressor_list_lock);
+	return 0;
 }
 
 #endif
 
 void jffs2_free_comprbuf(unsigned char *comprbuf, unsigned char *orig)
 {
-        if (orig != comprbuf)
-                kfree(comprbuf);
+	if (orig != comprbuf)
+		kfree(comprbuf);
 }
 
-int jffs2_compressors_init(void) 
+int jffs2_compressors_init(void)
 {
 /* Registering compressors */
 #ifdef CONFIG_JFFS2_ZLIB
-        jffs2_zlib_init();
+	jffs2_zlib_init();
 #endif
 #ifdef CONFIG_JFFS2_RTIME
-        jffs2_rtime_init();
+	jffs2_rtime_init();
 #endif
 #ifdef CONFIG_JFFS2_RUBIN
-        jffs2_rubinmips_init();
-        jffs2_dynrubin_init();
+	jffs2_rubinmips_init();
+	jffs2_dynrubin_init();
 #endif
 /* Setting default compression mode */
 #ifdef CONFIG_JFFS2_CMODE_NONE
-        jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
-        D1(printk(KERN_INFO "JFFS2: default compression mode: none\n");)
+	jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
+	D1(printk(KERN_INFO "JFFS2: default compression mode: none\n");)
 #else
 #ifdef CONFIG_JFFS2_CMODE_SIZE
-        jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
-        D1(printk(KERN_INFO "JFFS2: default compression mode: size\n");)
+	jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
+	D1(printk(KERN_INFO "JFFS2: default compression mode: size\n");)
 #else
-        D1(printk(KERN_INFO "JFFS2: default compression mode: priority\n");)
+	D1(printk(KERN_INFO "JFFS2: default compression mode: priority\n");)
 #endif
 #endif
-        return 0;
+	return 0;
 }
 
-int jffs2_compressors_exit(void) 
+int jffs2_compressors_exit(void)
 {
 /* Unregistering compressors */
 #ifdef CONFIG_JFFS2_RUBIN
-        jffs2_dynrubin_exit();
-        jffs2_rubinmips_exit();
+	jffs2_dynrubin_exit();
+	jffs2_rubinmips_exit();
 #endif
 #ifdef CONFIG_JFFS2_RTIME
-        jffs2_rtime_exit();
+	jffs2_rtime_exit();
 #endif
 #ifdef CONFIG_JFFS2_ZLIB
-        jffs2_zlib_exit();
+	jffs2_zlib_exit();
 #endif
-        return 0;
+	return 0;
 }
--- mtd/fs/jffs2/compr.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr.h	2005-09-26 10:31:27.000000000 -0600
@@ -4,7 +4,7 @@
  * Copyright (C) 2004 Ferenc Havasi <havasi@inf.u-szeged.hu>,
  *                    University of Szeged, Hungary
  *
- * For licensing information, see the file 'LICENCE' in the 
+ * For licensing information, see the file 'LICENCE' in the
  * jffs2 directory.
  *
  * $Id: compr.h,v 1.8 2005/07/26 13:24:40 havasi Exp $
@@ -42,22 +42,22 @@
 #define JFFS2_COMPR_MODE_SIZE       2
 
 struct jffs2_compressor {
-        struct list_head list;
-        int priority;              /* used by prirority comr. mode */
-        char *name;
-        char compr;                /* JFFS2_COMPR_XXX */
-        int (*compress)(unsigned char *data_in, unsigned char *cpage_out,
-                        uint32_t *srclen, uint32_t *destlen, void *model);
-        int (*decompress)(unsigned char *cdata_in, unsigned char *data_out,
-                        uint32_t cdatalen, uint32_t datalen, void *model);
-        int usecount;
-        int disabled;              /* if seted the compressor won't compress */
-        unsigned char *compr_buf;  /* used by size compr. mode */
-        uint32_t compr_buf_size;   /* used by size compr. mode */
-        uint32_t stat_compr_orig_size;
-        uint32_t stat_compr_new_size;
-        uint32_t stat_compr_blocks;
-        uint32_t stat_decompr_blocks;
+	struct list_head list;
+	int priority;              /* used by prirority comr. mode */
+	char *name;
+	char compr;                /* JFFS2_COMPR_XXX */
+	int (*compress)(unsigned char *data_in, unsigned char *cpage_out,
+			uint32_t *srclen, uint32_t *destlen, void *model);
+	int (*decompress)(unsigned char *cdata_in, unsigned char *data_out,
+			uint32_t cdatalen, uint32_t datalen, void *model);
+	int usecount;
+	int disabled;              /* if seted the compressor won't compress */
+	unsigned char *compr_buf;  /* used by size compr. mode */
+	uint32_t compr_buf_size;   /* used by size compr. mode */
+	uint32_t stat_compr_orig_size;
+	uint32_t stat_compr_new_size;
+	uint32_t stat_compr_blocks;
+	uint32_t stat_decompr_blocks;
 };
 
 int jffs2_register_compressor(struct jffs2_compressor *comp);
@@ -67,12 +67,12 @@
 int jffs2_compressors_exit(void);
 
 uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-                             unsigned char *data_in, unsigned char **cpage_out,
-                             uint32_t *datalen, uint32_t *cdatalen);
+			unsigned char *data_in, unsigned char **cpage_out,
+			uint32_t *datalen, uint32_t *cdatalen);
 
 int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-                     uint16_t comprtype, unsigned char *cdata_in,
-                     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen);
+		     uint16_t comprtype, unsigned char *cdata_in,
+		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen);
 
 void jffs2_free_comprbuf(unsigned char *comprbuf, unsigned char *orig);
 
--- mtd/fs/jffs2/compr_rtime.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_rtime.c	2005-09-26 10:31:27.000000000 -0600
@@ -24,8 +24,8 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/errno.h>
-#include <linux/string.h> 
-#include <linux/jffs2.h> 
+#include <linux/string.h>
+#include <linux/jffs2.h>
 #include "compr.h"
 
 /* _compress returns the compressed size, -1 if bigger */
@@ -36,23 +36,23 @@
 {
 	short positions[256];
 	int outpos = 0;
-	int pos=0;
+	int pos = 0;
+
+	memset(positions, 0, sizeof(positions));
 
-	memset(positions,0,sizeof(positions)); 
-	
 	while (pos < (*sourcelen) && outpos <= (*dstlen)-2) {
-		int backpos, runlen=0;
+		int backpos, runlen = 0;
 		unsigned char value;
-		
+
 		value = data_in[pos];
 
 		cpage_out[outpos++] = data_in[pos++];
-		
+
 		backpos = positions[value];
-		positions[value]=pos;
-		
+		positions[value] = pos;
+
 		while ((backpos < pos) && (pos < (*sourcelen)) &&
-		       (data_in[pos]==data_in[backpos++]) && (runlen<255)) {
+		       (data_in[pos] == data_in[backpos++]) && (runlen < 255)) {
 			pos++;
 			runlen++;
 		}
@@ -63,13 +63,12 @@
 		/* We failed */
 		return -1;
 	}
-	
+
 	/* Tell the caller how much we managed to compress, and how much space it took */
 	*sourcelen = pos;
 	*dstlen = outpos;
 	return 0;
-}		   
-
+}
 
 static int jffs2_rtime_decompress(unsigned char *data_in,
 				  unsigned char *cpage_out,
@@ -78,55 +77,55 @@
 {
 	short positions[256];
 	int outpos = 0;
-	int pos=0;
-	
-	memset(positions,0,sizeof(positions)); 
-	
-	while (outpos<destlen) {
+	int pos = 0;
+
+	memset(positions, 0, sizeof(positions));
+
+	while (outpos < destlen) {
 		unsigned char value;
 		int backoffs;
 		int repeat;
-		
+
 		value = data_in[pos++];
 		cpage_out[outpos++] = value; /* first the verbatim copied byte */
 		repeat = data_in[pos++];
 		backoffs = positions[value];
-		
-		positions[value]=outpos;
+
+		positions[value] = outpos;
 		if (repeat) {
 			if (backoffs + repeat >= outpos) {
-				while(repeat) {
+				while (repeat) {
 					cpage_out[outpos++] = cpage_out[backoffs++];
 					repeat--;
 				}
 			} else {
-				memcpy(&cpage_out[outpos],&cpage_out[backoffs],repeat);
-				outpos+=repeat;		
+				memcpy(&cpage_out[outpos], &cpage_out[backoffs], repeat);
+				outpos += repeat;
 			}
 		}
 	}
-        return 0;
-}		   
+	return 0;
+}
 
 static struct jffs2_compressor jffs2_rtime_comp = {
-    .priority = JFFS2_RTIME_PRIORITY,
-    .name = "rtime",
-    .compr = JFFS2_COMPR_RTIME,
-    .compress = &jffs2_rtime_compress,
-    .decompress = &jffs2_rtime_decompress,
+	.priority = JFFS2_RTIME_PRIORITY,
+	.name = "rtime",
+	.compr = JFFS2_COMPR_RTIME,
+	.compress = &jffs2_rtime_compress,
+	.decompress = &jffs2_rtime_decompress,
 #ifdef JFFS2_RTIME_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int jffs2_rtime_init(void)
 {
-    return jffs2_register_compressor(&jffs2_rtime_comp);
+	return jffs2_register_compressor(&jffs2_rtime_comp);
 }
 
 void jffs2_rtime_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_rtime_comp);
+	jffs2_unregister_compressor(&jffs2_rtime_comp);
 }
--- mtd/fs/jffs2/compr_rubin.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_rubin.c	2005-09-26 10:31:26.000000000 -0600
@@ -11,7 +11,7 @@
  *
  */
 
- 
+
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/jffs2.h>
@@ -20,27 +20,25 @@
 #include "compr.h"
 
 static void init_rubin(struct rubin_state *rs, int div, int *bits)
-{	
+{
 	int c;
 
 	rs->q = 0;
 	rs->p = (long) (2 * UPPER_BIT_RUBIN);
 	rs->bit_number = (long) 0;
 	rs->bit_divider = div;
-	for (c=0; c<8; c++)
+	for (c = 0; c < 8; c++)
 		rs->bits[c] = bits[c];
 }
 
-
 static int encode(struct rubin_state *rs, long A, long B, int symbol)
 {
-
 	long i0, i1;
 	int ret;
 
 	while ((rs->q >= UPPER_BIT_RUBIN) || ((rs->p + rs->q) <= UPPER_BIT_RUBIN)) {
 		rs->bit_number++;
-		
+
 		ret = pushbit(&rs->pp, (rs->q & UPPER_BIT_RUBIN) ? 1 : 0, 0);
 		if (ret)
 			return ret;
@@ -66,10 +64,8 @@
 	return 0;
 }
 
-
 static void end_rubin(struct rubin_state *rs)
-{				
-
+{
 	int i;
 
 	for (i = 0; i < RUBIN_REG_SIZE; i++) {
@@ -79,10 +75,9 @@
 	}
 }
 
-
 static void init_decode(struct rubin_state *rs, int div, int *bits)
 {
-	init_rubin(rs, div, bits);		
+	init_rubin(rs, div, bits);
 
 	/* behalve lower */
 	rs->rec_q = 0;
@@ -156,22 +151,20 @@
 	return symbol;
 }
 
-
-
 static int out_byte(struct rubin_state *rs, unsigned char byte)
 {
 	int i, ret;
 	struct rubin_state rs_copy;
 	rs_copy = *rs;
 
-	for (i=0;i<8;i++) {
-		ret = encode(rs, rs->bit_divider-rs->bits[i],rs->bits[i],byte&1);
+	for (i = 0; i < 8; i++) {
+		ret = encode(rs, rs->bit_divider-rs->bits[i], rs->bits[i], byte&1);
 		if (ret) {
 			/* Failed. Restore old state */
 			*rs = rs_copy;
 			return ret;
 		}
-		byte=byte>>1;
+		byte = byte >> 1;
 	}
 	return 0;
 }
@@ -186,48 +179,48 @@
 	return result;
 }
 
-
-
-static int rubin_do_compress(int bit_divider, int *bits, unsigned char *data_in, 
+static int rubin_do_compress(int bit_divider, int *bits, unsigned char *data_in,
 		      unsigned char *cpage_out, uint32_t *sourcelen, uint32_t *dstlen)
 	{
 	int outpos = 0;
-	int pos=0;
+	int pos = 0;
 	struct rubin_state rs;
 
 	init_pushpull(&rs.pp, cpage_out, *dstlen * 8, 0, 32);
 
 	init_rubin(&rs, bit_divider, bits);
-	
+
 	while (pos < (*sourcelen) && !out_byte(&rs, data_in[pos]))
 		pos++;
-	
+
 	end_rubin(&rs);
 
 	if (outpos > pos) {
 		/* We failed */
 		return -1;
 	}
-	
-	/* Tell the caller how much we managed to compress, 
+
+	/* Tell the caller how much we managed to compress,
 	 * and how much space it took */
-	
+
 	outpos = (pushedbits(&rs.pp)+7)/8;
-	
+
 	if (outpos >= pos)
 		return -1; /* We didn't actually compress */
 	*sourcelen = pos;
 	*dstlen = outpos;
 	return 0;
-}		   
+}
+
 #if 0
 /* _compress returns the compressed size, -1 if bigger */
-int jffs2_rubinmips_compress(unsigned char *data_in, unsigned char *cpage_out, 
+int jffs2_rubinmips_compress(unsigned char *data_in, unsigned char *cpage_out,
 		   uint32_t *sourcelen, uint32_t *dstlen, void *model)
 {
 	return rubin_do_compress(BIT_DIVIDER_MIPS, bits_mips, data_in, cpage_out, sourcelen, dstlen);
 }
 #endif
+
 static int jffs2_dynrubin_compress(unsigned char *data_in,
 				   unsigned char *cpage_out,
 				   uint32_t *sourcelen, uint32_t *dstlen,
@@ -246,11 +239,11 @@
 		return -1;
 
 	memset(histo, 0, 256);
-	for (i=0; i<mysrclen; i++) {
+	for (i = 0; i < mysrclen; i++) {
 		histo[data_in[i]]++;
 	}
 	memset(bits, 0, sizeof(int)*8);
-	for (i=0; i<256; i++) {
+	for (i = 0; i < 256; i++) {
 		if (i&128)
 			bits[7] += histo[i];
 		if (i&64)
@@ -269,15 +262,17 @@
 			bits[0] += histo[i];
 	}
 
-	for (i=0; i<8; i++) {
+	for (i = 0; i < 8; i++) {
 		bits[i] = (bits[i] * 256) / mysrclen;
-		if (!bits[i]) bits[i] = 1;
-		if (bits[i] > 255) bits[i] = 255;
+		if (!bits[i])
+			bits[i] = 1;
+		if (bits[i] > 255)
+			bits[i] = 255;
 		cpage_out[i] = bits[i];
 	}
 
 	ret = rubin_do_compress(256, bits, data_in, cpage_out+8, &mysrclen, &mydstlen);
-	if (ret) 
+	if (ret)
 		return ret;
 
 	/* Add back the 8 bytes we took for the probabilities */
@@ -293,19 +288,19 @@
 	return 0;
 }
 
-static void rubin_do_decompress(int bit_divider, int *bits, unsigned char *cdata_in, 
+static void rubin_do_decompress(int bit_divider, int *bits, unsigned char *cdata_in,
 			 unsigned char *page_out, uint32_t srclen, uint32_t destlen)
 {
 	int outpos = 0;
 	struct rubin_state rs;
-	
+
 	init_pushpull(&rs.pp, cdata_in, srclen, 0, 0);
 	init_decode(&rs, bit_divider, bits);
-	
+
 	while (outpos < destlen) {
 		page_out[outpos++] = in_byte(&rs);
 	}
-}		   
+}
 
 
 static int jffs2_rubinmips_decompress(unsigned char *data_in,
@@ -314,7 +309,7 @@
 				      void *model)
 {
 	rubin_do_decompress(BIT_DIVIDER_MIPS, bits_mips, data_in, cpage_out, sourcelen, dstlen);
-        return 0;
+	return 0;
 }
 
 static int jffs2_dynrubin_decompress(unsigned char *data_in,
@@ -325,55 +320,55 @@
 	int bits[8];
 	int c;
 
-	for (c=0; c<8; c++)
+	for (c = 0; c < 8; c++)
 		bits[c] = data_in[c];
 
 	rubin_do_decompress(256, bits, data_in+8, cpage_out, sourcelen-8, dstlen);
-        return 0;
+	return 0;
 }
 
 static struct jffs2_compressor jffs2_rubinmips_comp = {
-    .priority = JFFS2_RUBINMIPS_PRIORITY,
-    .name = "rubinmips",
-    .compr = JFFS2_COMPR_DYNRUBIN,
-    .compress = NULL, /*&jffs2_rubinmips_compress,*/
-    .decompress = &jffs2_rubinmips_decompress,
+	.priority = JFFS2_RUBINMIPS_PRIORITY,
+	.name = "rubinmips",
+	.compr = JFFS2_COMPR_DYNRUBIN,
+	.compress = NULL, /*&jffs2_rubinmips_compress,*/
+	.decompress = &jffs2_rubinmips_decompress,
 #ifdef JFFS2_RUBINMIPS_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int jffs2_rubinmips_init(void)
 {
-    return jffs2_register_compressor(&jffs2_rubinmips_comp);
+	return jffs2_register_compressor(&jffs2_rubinmips_comp);
 }
 
 void jffs2_rubinmips_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_rubinmips_comp);
+	jffs2_unregister_compressor(&jffs2_rubinmips_comp);
 }
 
 static struct jffs2_compressor jffs2_dynrubin_comp = {
-    .priority = JFFS2_DYNRUBIN_PRIORITY,
-    .name = "dynrubin",
-    .compr = JFFS2_COMPR_RUBINMIPS,
-    .compress = jffs2_dynrubin_compress,
-    .decompress = &jffs2_dynrubin_decompress,
+	.priority = JFFS2_DYNRUBIN_PRIORITY,
+	.name = "dynrubin",
+	.compr = JFFS2_COMPR_RUBINMIPS,
+	.compress = jffs2_dynrubin_compress,
+	.decompress = &jffs2_dynrubin_decompress,
 #ifdef JFFS2_DYNRUBIN_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int jffs2_dynrubin_init(void)
 {
-    return jffs2_register_compressor(&jffs2_dynrubin_comp);
+	return jffs2_register_compressor(&jffs2_dynrubin_comp);
 }
 
 void jffs2_dynrubin_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_dynrubin_comp);
+	jffs2_unregister_compressor(&jffs2_dynrubin_comp);
 }
--- mtd/fs/jffs2/compr_rubin.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_rubin.h	2005-09-26 10:31:27.000000000 -0600
@@ -6,13 +6,13 @@
 #include "pushpull.h"
 
 #define RUBIN_REG_SIZE   16
-#define UPPER_BIT_RUBIN    (((long) 1)<<(RUBIN_REG_SIZE-1))
-#define LOWER_BITS_RUBIN   ((((long) 1)<<(RUBIN_REG_SIZE-1))-1)
+#define UPPER_BIT_RUBIN    (((long) 1) << (RUBIN_REG_SIZE - 1))
+#define LOWER_BITS_RUBIN   ((((long) 1) << (RUBIN_REG_SIZE - 1)) - 1)
 
 
 struct rubin_state {
-	unsigned long p;		
-	unsigned long q;	
+	unsigned long p;
+	unsigned long q;
 	unsigned long rec_q;
 	long bit_number;
 	struct pushpull pp;
--- mtd/fs/jffs2/comprtest.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/comprtest.c	2005-09-26 10:31:27.038105800 -0600
@@ -265,21 +265,22 @@
 static unsigned char comprbuf[TESTDATA_LEN];
 static unsigned char decomprbuf[TESTDATA_LEN];
 
-int jffs2_decompress(unsigned char comprtype, unsigned char *cdata_in, 
+int jffs2_decompress(unsigned char comprtype, unsigned char *cdata_in,
 		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen);
-unsigned char jffs2_compress(unsigned char *data_in, unsigned char *cpage_out, 
+
+unsigned char jffs2_compress(unsigned char *data_in, unsigned char *cpage_out,
 			     uint32_t *datalen, uint32_t *cdatalen);
 
-int init_module(void ) {
+int init_module(void) {
 	unsigned char comprtype;
 	uint32_t c, d;
 	int ret;
 
 	printk("Original data: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-	       testdata[0],testdata[1],testdata[2],testdata[3], 
-	       testdata[4],testdata[5],testdata[6],testdata[7], 
-	       testdata[8],testdata[9],testdata[10],testdata[11], 
-	       testdata[12],testdata[13],testdata[14],testdata[15]); 
+	       testdata[0], testdata[1], testdata[2], testdata[3],
+	       testdata[4], testdata[5], testdata[6], testdata[7],
+	       testdata[8], testdata[9], testdata[10], testdata[11],
+	       testdata[12], testdata[13], testdata[14], testdata[15]);
 	d = TESTDATA_LEN;
 	c = TESTDATA_LEN;
 	comprtype = jffs2_compress(testdata, comprbuf, &d, &c);
@@ -287,18 +288,18 @@
 	printk("jffs2_compress used compression type %d. Compressed size %d, uncompressed size %d\n",
 	       comprtype, c, d);
 	printk("Compressed data: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-	       comprbuf[0],comprbuf[1],comprbuf[2],comprbuf[3], 
-	       comprbuf[4],comprbuf[5],comprbuf[6],comprbuf[7], 
-	       comprbuf[8],comprbuf[9],comprbuf[10],comprbuf[11], 
-	       comprbuf[12],comprbuf[13],comprbuf[14],comprbuf[15]); 
+	       comprbuf[0], comprbuf[1], comprbuf[2], comprbuf[3],
+	       comprbuf[4], comprbuf[5], comprbuf[6], comprbuf[7],
+	       comprbuf[8], comprbuf[9], comprbuf[10], comprbuf[11],
+	       comprbuf[12], comprbuf[13], comprbuf[14], comprbuf[15]);
 
 	ret = jffs2_decompress(comprtype, comprbuf, decomprbuf, c, d);
 	printk("jffs2_decompress returned %d\n", ret);
 	printk("Decompressed data:  %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-	       decomprbuf[0],decomprbuf[1],decomprbuf[2],decomprbuf[3], 
-	       decomprbuf[4],decomprbuf[5],decomprbuf[6],decomprbuf[7], 
-	       decomprbuf[8],decomprbuf[9],decomprbuf[10],decomprbuf[11], 
-	       decomprbuf[12],decomprbuf[13],decomprbuf[14],decomprbuf[15]); 
+	       decomprbuf[0], decomprbuf[1], decomprbuf[2], decomprbuf[3],
+	       decomprbuf[4], decomprbuf[5], decomprbuf[6], decomprbuf[7],
+	       decomprbuf[8], decomprbuf[9], decomprbuf[10], decomprbuf[11],
+	       decomprbuf[12], decomprbuf[13], decomprbuf[14], decomprbuf[15]);
 	if (memcmp(decomprbuf, testdata, d))
 		printk("Compression and decompression corrupted data\n");
 	else
--- mtd/fs/jffs2/compr_zlib.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_zlib.c	2005-09-26 10:31:26.000000000 -0600
@@ -24,11 +24,11 @@
 #include "nodelist.h"
 #include "compr.h"
 
-	/* Plan: call deflate() with avail_in == *sourcelen, 
-		avail_out = *dstlen - 12 and flush == Z_FINISH. 
-		If it doesn't manage to finish,	call it again with
+	/* Plan: call deflate() with avail_in == *sourcelen,
+		avail_out = *dstlen - 12 and flush == Z_FINISH.
+		If it doesn't manage to finish, call it again with
 		avail_in == 0 and avail_out set to the remaining 12
-		bytes for it to clean up. 
+		bytes for it to clean up.
 	   Q: Is 12 bytes sufficient?
 	*/
 #define STREAM_END_SPACE 12
@@ -66,7 +66,7 @@
 }
 #else
 #define alloc_workspaces() (0)
-#define free_workspaces() do { } while(0)
+#define free_workspaces() do { } while (0)
 #endif /* __KERNEL__ */
 
 static int jffs2_zlib_compress(unsigned char *data_in,
@@ -89,7 +89,7 @@
 
 	def_strm.next_in = data_in;
 	def_strm.total_in = 0;
-	
+
 	def_strm.next_out = cpage_out;
 	def_strm.total_out = 0;
 
@@ -99,7 +99,7 @@
 		D1(printk(KERN_DEBUG "calling deflate with avail_in %d, avail_out %d\n",
 			  def_strm.avail_in, def_strm.avail_out));
 		ret = zlib_deflate(&def_strm, Z_PARTIAL_FLUSH);
-		D1(printk(KERN_DEBUG "deflate returned with avail_in %d, avail_out %d, total_in %ld, total_out %ld\n", 
+		D1(printk(KERN_DEBUG "deflate returned with avail_in %d, avail_out %d, total_in %ld, total_out %ld\n",
 			  def_strm.avail_in, def_strm.avail_out, def_strm.total_in, def_strm.total_out));
 		if (ret != Z_OK) {
 			D1(printk(KERN_DEBUG "deflate in loop returned %d\n", ret));
@@ -150,7 +150,7 @@
 	inf_strm.next_in = data_in;
 	inf_strm.avail_in = srclen;
 	inf_strm.total_in = 0;
-	
+
 	inf_strm.next_out = cpage_out;
 	inf_strm.avail_out = destlen;
 	inf_strm.total_out = 0;
@@ -159,7 +159,7 @@
 	   we can tell zlib to skip the adler32 check. */
 	if (srclen > 2 && !(data_in[1] & PRESET_DICT) &&
 	    ((data_in[0] & 0x0f) == Z_DEFLATED) &&
-	    !(((data_in[0]<<8) + data_in[1]) % 31)) {
+	    !(((data_in[0] << 8) + data_in[1]) % 31)) {
 
 		D2(printk(KERN_DEBUG "inflate skipping adler32\n"));
 		wbits = -((data_in[0] >> 4) + 8);
@@ -177,46 +177,46 @@
 		return 1;
 	}
 
-	while((ret = zlib_inflate(&inf_strm, Z_FINISH)) == Z_OK)
+	while ((ret = zlib_inflate(&inf_strm, Z_FINISH)) == Z_OK)
 		;
 	if (ret != Z_STREAM_END) {
 		printk(KERN_NOTICE "inflate returned %d\n", ret);
 	}
 	zlib_inflateEnd(&inf_strm);
 	up(&inflate_sem);
-        return 0;
+	return 0;
 }
 
 static struct jffs2_compressor jffs2_zlib_comp = {
-    .priority = JFFS2_ZLIB_PRIORITY,
-    .name = "zlib",
-    .compr = JFFS2_COMPR_ZLIB,
-    .compress = &jffs2_zlib_compress,
-    .decompress = &jffs2_zlib_decompress,
+	.priority = JFFS2_ZLIB_PRIORITY,
+	.name = "zlib",
+	.compr = JFFS2_COMPR_ZLIB,
+	.compress = &jffs2_zlib_compress,
+	.decompress = &jffs2_zlib_decompress,
 #ifdef JFFS2_ZLIB_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int __init jffs2_zlib_init(void)
 {
-    int ret;
-
-    ret = alloc_workspaces();
-    if (ret)
-        return ret;
+	int ret;
 
-    ret = jffs2_register_compressor(&jffs2_zlib_comp);
-    if (ret)
-        free_workspaces();
+	ret = alloc_workspaces();
+	if (ret)
+		return ret;
+
+	ret = jffs2_register_compressor(&jffs2_zlib_comp);
+	if (ret)
+		free_workspaces();
 
-    return ret;
+	return ret;
 }
 
 void jffs2_zlib_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_zlib_comp);
-    free_workspaces();
+	jffs2_unregister_compressor(&jffs2_zlib_comp);
+	free_workspaces();
 }

--=-34lyUa/kZYqPavJPEvcW--
