Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MzerD-0002GY-9t
	for linux-mtd@lists.infradead.org; Sun, 18 Oct 2009 23:08:20 +0000
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: <linux-pcmcia@lists.infradead.org>
Subject: [PATCH 8/9] pcmcia: convert pcmciamtd driver to use new CIS helpers
Date: Mon, 19 Oct 2009 01:07:34 +0200
Message-Id: <1255907255-28297-8-git-send-email-linux@dominikbrodowski.net>
In-Reply-To: <1255907255-28297-7-git-send-email-linux@dominikbrodowski.net>
References: <1255907255-28297-1-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-2-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-3-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-4-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-5-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-6-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-7-git-send-email-linux@dominikbrodowski.net>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert the (broken) pcmciamtd driver to use the new CIS helpers.

CC: David.Woodhouse@intel.com
CC: linux-mtd@lists.infradead.org
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/mtd/maps/pcmciamtd.c |  175 ++++++++++++++++++++++--------------------
 1 files changed, 91 insertions(+), 84 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index d600c2d..52c07f2 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -354,101 +354,108 @@ static void pcmciamtd_release(struct pcmcia_device *link)
 }
 
 
-static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *link, int *new_name)
+#ifdef CONFIG_MTD_DEBUG
+static int pcmciamtd_cistpl_format(struct pcmcia_device *p_dev,
+				tuple_t *tuple,
+				void *priv_data)
 {
-	int rc;
-	tuple_t tuple;
 	cisparse_t parse;
-	u_char buf[64];
-
-	tuple.Attributes = 0;
-	tuple.TupleData = (cisdata_t *)buf;
-	tuple.TupleDataMax = sizeof(buf);
-	tuple.TupleOffset = 0;
-	tuple.DesiredTuple = RETURN_FIRST_TUPLE;
-
-	rc = pcmcia_get_first_tuple(link, &tuple);
-	while (rc == 0) {
-		rc = pcmcia_get_tuple_data(link, &tuple);
-		if (rc != 0) {
-			cs_error(link, GetTupleData, rc);
-			break;
-		}
-		rc = pcmcia_parse_tuple(&tuple, &parse);
-		if (rc != 0) {
-			cs_error(link, ParseTuple, rc);
-			break;
-		}
 
-		switch(tuple.TupleCode) {
-		case  CISTPL_FORMAT: {
-			cistpl_format_t *t = &parse.format;
-			(void)t; /* Shut up, gcc */
-			DEBUG(2, "Format type: %u, Error Detection: %u, offset = %u, length =%u",
-			      t->type, t->edc, t->offset, t->length);
-			break;
+	if (!pcmcia_parse_tuple(tuple, &parse)) {
+		cistpl_format_t *t = &parse.format;
+		(void)t; /* Shut up, gcc */
+		DEBUG(2, "Format type: %u, Error Detection: %u, offset = %u, length =%u",
+			t->type, t->edc, t->offset, t->length);
+	}
+	return -ENOSPC;
+}
 
-		}
+static int pcmciamtd_cistpl_jedec(struct pcmcia_device *p_dev,
+				tuple_t *tuple,
+				void *priv_data)
+{
+	cisparse_t parse;
+	int i;
 
-		case CISTPL_DEVICE: {
-			cistpl_device_t *t = &parse.device;
-			int i;
-			DEBUG(2, "Common memory:");
-			dev->pcmcia_map.size = t->dev[0].size;
-			for(i = 0; i < t->ndev; i++) {
-				DEBUG(2, "Region %d, type = %u", i, t->dev[i].type);
-				DEBUG(2, "Region %d, wp = %u", i, t->dev[i].wp);
-				DEBUG(2, "Region %d, speed = %u ns", i, t->dev[i].speed);
-				DEBUG(2, "Region %d, size = %u bytes", i, t->dev[i].size);
-			}
-			break;
-		}
+	if (!pcmcia_parse_tuple(tuple, &parse)) {
+		cistpl_jedec_t *t = &parse.jedec;
+		for (i = 0; i < t->nid; i++)
+			DEBUG(2, "JEDEC: 0x%02x 0x%02x", t->id[i].mfr, t->id[i].info);
+	}
+	return -ENOSPC;
+}
+#endif
 
-		case CISTPL_VERS_1: {
-			cistpl_vers_1_t *t = &parse.version_1;
-			int i;
-			if(t->ns) {
-				dev->mtd_name[0] = '\0';
-				for(i = 0; i < t->ns; i++) {
-					if(i)
-						strcat(dev->mtd_name, " ");
-					strcat(dev->mtd_name, t->str+t->ofs[i]);
-				}
-			}
-			DEBUG(2, "Found name: %s", dev->mtd_name);
-			break;
-		}
+static int pcmciamtd_cistpl_device(struct pcmcia_device *p_dev,
+				tuple_t *tuple,
+				void *priv_data)
+{
+	struct pcmciamtd_dev *dev = priv_data;
+	cisparse_t parse;
+	cistpl_device_t *t = &parse.device;
+
+	if (pcmcia_parse_tuple(tuple, &parse))
+		return -EINVAL;
+
+	DEBUG(2, "Common memory:");
+	dev->pcmcia_map.size = t->dev[0].size;
+	/* from here on: DEBUG only */
+	for (i = 0; i < t->ndev; i++) {
+		DEBUG(2, "Region %d, type = %u", i, t->dev[i].type);
+		DEBUG(2, "Region %d, wp = %u", i, t->dev[i].wp);
+		DEBUG(2, "Region %d, speed = %u ns", i, t->dev[i].speed);
+		DEBUG(2, "Region %d, size = %u bytes", i, t->dev[i].size);
+	}
+	return 0;
+}
 
-		case CISTPL_JEDEC_C: {
-			cistpl_jedec_t *t = &parse.jedec;
-			int i;
-			for(i = 0; i < t->nid; i++) {
-				DEBUG(2, "JEDEC: 0x%02x 0x%02x", t->id[i].mfr, t->id[i].info);
-			}
-			break;
-		}
+static int pcmciamtd_cistpl_geo(struct pcmcia_device *p_dev,
+				tuple_t *tuple,
+				void *priv_data)
+{
+	struct pcmciamtd_dev *dev = priv_data;
+	cisparse_t parse;
+	cistpl_device_geo_t *t = &parse.device_geo;
+
+	if (pcmcia_parse_tuple(tuple, &parse))
+		return -EINVAL;
+
+	dev->pcmcia_map.bankwidth = t->geo[0].buswidth;
+	/* from here on: DEBUG only */
+	for (i = 0; i < t->ngeo; i++) {
+		DEBUG(2, "region: %d bankwidth = %u", i, t->geo[i].buswidth);
+		DEBUG(2, "region: %d erase_block = %u", i, t->geo[i].erase_block);
+		DEBUG(2, "region: %d read_block = %u", i, t->geo[i].read_block);
+		DEBUG(2, "region: %d write_block = %u", i, t->geo[i].write_block);
+		DEBUG(2, "region: %d partition = %u", i, t->geo[i].partition);
+		DEBUG(2, "region: %d interleave = %u", i, t->geo[i].interleave);
+	}
+	return 0;
+}
 
-		case CISTPL_DEVICE_GEO: {
-			cistpl_device_geo_t *t = &parse.device_geo;
-			int i;
-			dev->pcmcia_map.bankwidth = t->geo[0].buswidth;
-			for(i = 0; i < t->ngeo; i++) {
-				DEBUG(2, "region: %d bankwidth = %u", i, t->geo[i].buswidth);
-				DEBUG(2, "region: %d erase_block = %u", i, t->geo[i].erase_block);
-				DEBUG(2, "region: %d read_block = %u", i, t->geo[i].read_block);
-				DEBUG(2, "region: %d write_block = %u", i, t->geo[i].write_block);
-				DEBUG(2, "region: %d partition = %u", i, t->geo[i].partition);
-				DEBUG(2, "region: %d interleave = %u", i, t->geo[i].interleave);
-			}
-			break;
-		}
 
-		default:
-			DEBUG(2, "Unknown tuple code %d", tuple.TupleCode);
-		}
+static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *link, int *new_name)
+{
+	int i;
 
-		rc = pcmcia_get_next_tuple(link, &tuple);
+	if (p_dev->prod_id[0]) {
+		dev->mtd_name[0] = '\0';
+		for (i = 0; i < 4; i++) {
+			if (i)
+				strcat(dev->mtd_name, " ");
+			if (p_dev->prod_id[i])
+				strcat(dev->mtd_name, p_dev->prod_id[i]);
+		}
+		DEBUG(2, "Found name: %s", dev->mtd_name);
 	}
+
+#ifdef CONFIG_MTD_DEBUG
+	pcmcia_loop_tuple(p_dev, CISTPL_FORMAT, pcmciamtd_cistpl_format, NULL);
+	pcmcia_loop_tuple(p_dev, CISTPL_JEDEC_C, pcmciamtd_cistpl_jedec, NULL);
+#endif
+	pcmcia_loop_tuple(p_dev, CISTPL_DEVICE, pcmciamtd_cistpl_device, dev);
+	pcmcia_loop_tuple(p_dev, CISTPL_DEVICE_GEO, pcmciamtd_cistpl_geo, dev);
+
 	if(!dev->pcmcia_map.size)
 		dev->pcmcia_map.size = MAX_PCMCIA_ADDR;
 
-- 
1.6.0.4
