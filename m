Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNPiS-00052U-K4
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 18:16:34 +0000
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 linux-mtd@lists.infradead.org
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
 <55C2840B.5000709@nod.at> <1438811611.6328.32.camel@embedded.rocks>
 <55C287A9.8000006@nod.at> <1438813074.6328.35.camel@embedded.rocks>
 <55C30D24.1010504@nod.at> <1438848603.32524.6.camel@embedded.rocks>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C3A465.5070504@nod.at>
Date: Thu, 6 Aug 2015 20:16:05 +0200
MIME-Version: 1.0
In-Reply-To: <1438848603.32524.6.camel@embedded.rocks>
Content-Type: multipart/mixed; boundary="------------060902070600090502070104"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060902070600090502070104
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Am 06.08.2015 um 10:10 schrieb Jörg Krause:
> I will turn fastmap off for now, but feel free to send more patches to
> try.

Can you please give the attached patch a try?

Thanks,
//richard

--------------060902070600090502070104
Content-Type: text/x-patch;
 name="fastmap_produce_peb.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fastmap_produce_peb.diff"

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index b2a6653..bbd30dc 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -172,6 +172,30 @@ void ubi_refill_pools(struct ubi_device *ubi)
 }
 
 /**
+ * produce_free_peb - produce a free physical eraseblock.
+ * @ubi: UBI device description object
+ *
+ * This function tries to make a free PEB by means of synchronous execution of
+ * pending works. This may be needed if, for example the background thread is
+ * disabled. Returns zero in case of success and a negative error code in case
+ * of failure.
+ */
+static int produce_free_peb(struct ubi_device *ubi)
+{
+	int err;
+
+	while (!ubi->free.rb_node && ubi->works_count) {
+		dbg_wl("do one work synchronously");
+		err = do_work(ubi);
+
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
  * ubi_wl_get_peb - get a physical eraseblock.
  * @ubi: UBI device description object
  *
@@ -213,6 +237,7 @@ again:
 		}
 		retried = 1;
 		up_read(&ubi->fm_eba_sem);
+		produce_free_peb(ubi);
 		goto again;
 	}
 

--------------060902070600090502070104--
