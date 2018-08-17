Received: from callisto.digivation.com.au ([198.35.45.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqSkF-0006pH-Ov
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 00:36:06 +0000
Received: from 11.226.215.218.sta.wbroadband.net.au ([218.215.226.11]
 helo=digivation.com.au) by callisto.digivation.com.au with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.86_2)
 (envelope-from <mspieth@digivation.com.au>) id 1fqSim-0007gD-JU
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 00:34:32 +0000
Received: from [172.16.90.129] (netcommwireless.com [220.233.131.78] (may be
 forged)) (authenticated bits=0)
 by digivation.com.au (8.15.2/8.15.2/Debian-8) with ESMTPSA id w7H0YSjK022673
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2018 10:34:28 +1000
To: linux-mtd@lists.infradead.org
From: Mark Spieth <mspieth@digivation.com.au>
Subject: [RFC PATCH] UBI fixable bit-flip issue
Message-ID: <1bcbe82a-85e5-52f8-dc54-9d22e5b390fa@digivation.com.au>
Date: Fri, 17 Aug 2018 10:34:21 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Richard Weinberger suggested I post this here. It is also in the uboot 
mailing list

In the process of investigating a boot failure on one of our devices, the

UBI: fixable bit-flip detected at PEB

message was seen with the following behaviour during kernel load in u-boot.

Read [2285568] bytes
UBI: fixable bit-flip detected at PEB 415
UBI: schedule PEB 415 for scrubbing
UBI: fixable bit-flip detected at PEB 415
UBI: fixable bit-flip detected at PEB 419
UBI: schedule PEB 419 for scrubbing
UBI: fixable bit-flip detected at PEB 419
UBI: fixable bit-flip detected at PEB 420
UBI: schedule PEB 420 for scrubbing
UBI: fixable bit-flip detected at PEB 420
UBI: fixable bit-flip detected at PEB 419
UBI: fixable bit-flip detected at PEB 420
UBI: fixable bit-flip detected at PEB 419
UBI: fixable bit-flip detected at PEB 420
UBI: fixable bit-flip detected at PEB 419
UBI: fixable bit-flip detected at PEB 420
UBI: fixable bit-flip detected at PEB 419
UBI: fixable bit-flip detected at PEB 420
UBI: fixable bit-flip detected at PEB 419
UBI: fixable bit-flip detected at PEB 420
UBI: fixable bit-flip detected at PEB 419

his repeats until reset.

U boot is a patched version of 2010.06 supplied by the chip vendor. No 
newer version is available from the vendor to try.

The patches include the init eba/wl swap.

A more detailed log with debugging available follows:

UBI: fixable bit-flip detected at PEB 419
UBI DBG: schedule_erase: schedule erasure of PEB 419, EC 19, torture 0
UBI DBG: erase_worker: erase PEB 419 EC 19
UBI DBG: sync_erase: erase PEB 419, old EC 19
UBI DBG: do_sync_erase: erase PEB 419
UBI DBG: sync_erase: erased PEB 419, new EC 20
UBI DBG: ubi_io_write_ec_hdr: write EC header to PEB 419
UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:0
UBI DBG: ensure_wear_leveling: schedule scrubbing
UBI DBG: wear_leveling_worker: scrub PEB 420 to PEB 419
UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 420
UBI DBG: ubi_io_read: read 2048 bytes from PEB 420:2048
UBI DBG: ubi_eba_copy_leb: copy LEB 6:11, PEB 420 to PEB 419
UBI DBG: ubi_eba_copy_leb: read 126976 bytes of data
UBI DBG: ubi_io_read: read 126976 bytes from PEB 420:4096
UBI: fixable bit-flip detected at PEB 420
UBI DBG: ubi_io_write_vid_hdr: write VID header to PEB 419
UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:2048
UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 419
UBI DBG: ubi_io_read: read 2048 bytes from PEB 419:2048
UBI DBG: ubi_io_write: write 126976 bytes to PEB 419:4096
UBI DBG: ubi_io_read: read 126976 bytes from PEB 419:4096
UBI: fixable bit-flip detected at PEB 419
UBI DBG: schedule_erase: schedule erasure of PEB 419, EC 20, torture 0
UBI DBG: erase_worker: erase PEB 419 EC 20
UBI DBG: sync_erase: erase PEB 419, old EC 20
UBI DBG: do_sync_erase: erase PEB 419
UBI DBG: sync_erase: erased PEB 419, new EC 21
UBI DBG: ubi_io_write_ec_hdr: write EC header to PEB 419
UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:0
UBI DBG: ensure_wear_leveling: schedule scrubbing
UBI DBG: wear_leveling_worker: scrub PEB 420 to PEB 419
UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 420
UBI DBG: ubi_io_read: read 2048 bytes from PEB 420:2048
UBI DBG: ubi_eba_copy_leb: copy LEB 6:11, PEB 420 to PEB 419
UBI DBG: ubi_eba_copy_leb: read 126976 bytes of data
UBI DBG: ubi_io_read: read 126976 bytes from PEB 420:4096
UBI: fixable bit-flip detected at PEB 420
UBI DBG: ubi_io_write_vid_hdr: write VID header to PEB 419
UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:2048
UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 419
UBI DBG: ubi_io_read: read 2048 bytes from PEB 419:2048
UBI DBG: ubi_io_write: write 126976 bytes to PEB 419:4096
UBI DBG: ubi_io_read: read 126976 bytes from PEB 419:4096
UBI: fixable bit-flip detected at PEB 419

Investigation showed that a read with correctable bit errors was done 
returning -EUCLEAN to the ubi read function.

Having read 
https://lists.denx.de/pipermail/u-boot/2013-September/161961.html which 
details a workaround to not return EUCLEAN from the NAND reader unless 
the number of fixed bits returned was 75% of the total number of 
correctable bits was exceeded during the read. This was impleneted in 
this version of ubi in uboot 2010.06 and it does hide the bit-flip 
infinite issue since this is new NAND FLASH. The original 2010.06 
implementation returns EUCLEAN for any number of fixable bit flips and 
thus causes the PEB move to the best free one (scrub mode in 
wear_leveling_worker).

This fix is not a root cause fix though. Investigating further led to 
the following root cause solution. The following is AFAICT.

When the scrubber chooses a PEB to move the from the free balanced tree. 
This tree is sorted by EC (erase count) and then by PEB number.

The find_wl_entry call uses a max parameter of WL_FREE_MAX_DIFF which is 
8192 in this config. So the find_wl_entry function will find a PEB that 
is better in erase count that the current PEB EC. This can easily cause 
it to find the PEB that was just moved from if it is the lowest numbered 
PEB in the free tree. Waiting for EC to go above 8192 would take a long 
time and cause premature aging of the flash PEBs in question.

The easy solution is to change the max parameter for scrubbing to this 
call to 0 so it finds a PEB with a smaller EC than the one being 
replaced. This means it wont use the previously discarded PEB as its 
first choice.

This fix was implemented and fixable bit-flip errors no longer 
hang/freeze the boot process! UBI erase and reformat was used between 
re-tests to get consistent results.

Adding the above 75% correctable bitflip threshold is also a good thing 
as less movement will ensue when the FLASH is new, but as the flash 
ages, the root cause will once again be invoked causing un-recoverable 
boot failures.

Note this fault is also in the latest kernel drivers for UBI and may 
also exist in other wear leveling implementations. The kernel driver 
issue may be at fault for android devices locking up/freezing 
sporadically during FLASH read when scrubbing with a relatively full 
flash and marginally correctable errors causing ping pong PEB moves.

The following patch is a workaround and is almost certainly not an 
optimal solution.

What is required for CONFIG_MTD_UBI_FASTMAP is uncertain.

I am in the process of writing a unit test to highlight this ping ping 
move behaviour but have not completed that yet.

I hope this description is clear enough.

Regards

Mark

==== PATCH ====
Date:   Fri Jul 13 12:10:20 2018 +1000

     wear leveling scrubbing fixable bit flip fix

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f66b3b22f328..a1cfadd3b395 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -736,7 +736,7 @@ static int wear_leveling_worker(struct ubi_device 
*ubi, struct ubi_work *wrk,
          /* Perform scrubbing */
          scrubbing = 1;
          e1 = rb_entry(rb_first(&ubi->scrub), struct ubi_wl_entry, u.rb);
-        e2 = get_peb_for_wl(ubi);
+        e2 = get_peb_for_wl_scrubbing(ubi);
          if (!e2)
              goto out_cancel;

@@ -1878,6 +1878,19 @@ static struct ubi_wl_entry *get_peb_for_wl(struct 
ubi_device *ubi)
      return e;
  }

+static struct ubi_wl_entry *get_peb_for_wl_scrubbing(struct ubi_device 
*ubi)
+{
+    struct ubi_wl_entry *e;
+
+    e = find_wl_entry(ubi, &ubi->free, 0);
+    self_check_in_wl_tree(ubi, e, &ubi->free);
+    ubi->free_count--;
+    ubi_assert(ubi->free_count >= 0);
+    rb_erase(&e->u.rb, &ubi->free);
+
+    return e;
+}
+
  /**
   * produce_free_peb - produce a free physical eraseblock.
   * @ubi: UBI device description object
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index a9e2d669acd8..579f7c729b5d 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -6,6 +6,10 @@ static int anchor_pebs_available(struct rb_root *root);
  static void update_fastmap_work_fn(struct work_struct *wrk);
  static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root);
  static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
+static inline struct ubi_wl_entry *get_peb_for_wl_scrubbing(struct 
ubi_device *ubi)
+{
+    return get_peb_for_wl(ubi);
+}
  static void ubi_fastmap_close(struct ubi_device *ubi);
  static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count)
  {
@@ -18,6 +22,7 @@ static struct ubi_wl_entry *may_reserve_for_fm(struct 
ubi_device *ubi,
                             struct rb_root *root);
  #else /* !CONFIG_MTD_UBI_FASTMAP */
  static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
+static struct ubi_wl_entry *get_peb_for_wl_scrubbing(struct ubi_device 
*ubi);
  static inline void ubi_fastmap_close(struct ubi_device *ubi) { }
  static inline void ubi_fastmap_init(struct ubi_device *ubi, int 
*count) { }
  static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
