Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9817F53D96
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNn0tjLOc0h6KikROnT/hm17bTSyd+o2RkrU0ubRcP0=; b=ZL6KpPsLy8nern
	xN1BAZ0pyyJa9cWOYIwHc7GJUCYPQzsfcZNSZ+mLey0B8YMKAIwAA9UwyWbyGn1VGm31lCxRvlS4B
	dIOuIcmeBxM9ZqPu4Bww1t3pUJU4pJZNW0u3Gp2aixvHfmy+786gShUyhIk514A8AAstgQ9wC5C05
	BJYt6J0tHkeVLag4P0WGDa/zGbIw98vjSiU8u5KaRsRFpo+LQMjIi51V7IzgxBrCyDRVArNj83DoW
	/JHIjynKVjGUJgGbUJyn1plvnEMk1oitn8kF4zgj5mjEjUQHz8+l9uW4hNF3gApRwmu+yz/AGjGZx
	uZjknGQkuS6Ram1uNKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FHH-00000004uB2-1rcC;
	Mon, 16 Mar 2026 21:15:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FGf-00000004tFI-3wpH;
	Mon, 16 Mar 2026 21:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IwV6zs9+k3empwzyfCoLglaQ1RygvjDO/a1Nzu2pYl0=; b=GTDmVtTvrpFpIA7Dm+nRgwkS5N
	PGXwRK34v/LgywcfWNqxUVkYg0yOD/i8EVcSy5oVLEHFlgENmgN0FuznqsYdgx93qKyHA4d/cmgju
	U6Am8EzMVWKv6PUAWCCuArDEG/60WIcv3EXRjcACvSn4uspDS4aIylWSEza95oNTV72fLFrYR96dz
	pelQk+bnBciTpYOOEouD6uMpK9Wjs/TDLAPLiwpgwefMaANVk8Ax660RpdLzHD0/FrgvilZK0dbAX
	fTbx/sGHekuS84cs23zzfobGBAD+wNNIOADHt8wQWXiHKyAcO/44IaBWo0DqJanMgU1QL9sqGilb/
	fiwXwdVg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FGV-00000007g6k-2neB;
	Mon, 16 Mar 2026 21:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18593432B8;
	Mon, 16 Mar 2026 21:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE46C2BC9E;
	Mon, 16 Mar 2026 21:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773695654;
	bh=BqZ3dGXi/uNWrhmwwDUsKyVr3VEa4KB4Sn9UhtSbJGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ddRg00F2T/2uy5ssm0Qrl1iCxh7BiYFPZ+3xDhRUzcquIPd3ir2brMNsn2DeZO9Ik
	 4Or6QCwnUlB7hCUX2R5ljuls0LdC39uPeGcT47HKe4eC66YadayJAeNQ72y1Bm/Am/
	 XISyzTGiUG4jtxWzTXO2EztA9dIxx9DZvTNz+uiTyo4tS3dDguhT8W630F98FNBp5i
	 bH3GB47keYIYSY8EnfMKeMEfk5mFomJJoUqJ94b43jw2fjBsRpqgkusxxIki4YERaA
	 goihMbGCBxAFXIjI6pK/Vb7S1B++J5F97P25GT6KOflLAWtvBO1Ju6TrdWN03FJaWR
	 I1g0WcCHY9ajg==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v2 13/16] drivers: hv: vmbus: replace deprecated mmap hook with mmap_prepare
Date: Mon, 16 Mar 2026 21:12:09 +0000
Message-ID: <816d3c06ca3ec201ac8439a83383b9cb5e407ee9.1773695307.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773695307.git.ljs@kernel.org>
References: <cover.1773695307.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_211422_272041_F7E99051 
X-CRM114-Status: GOOD (  25.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The f_op->mmap interface is deprecated, so update the vmbus driver to use
its successor, mmap_prepare.

This updates all callbacks which referenced the function pointer
hv_mmap_ring_buffer to instead reference hv_mmap_prepare_ring_buffer,
utilising the newly introduced compat_set_desc_from_vma() and
__compat_vma_mmap() to be able to implement this change.

The UIO HV generic driver is the only user of hv_create_ring_sysfs(),
which is the only function which references
vmbus_channel->mmap_prepare_ring_buffer which, in turn, is the only
external interface to hv_mmap_prepare_ring_buffer.

This patch therefore updates this caller to use mmap_prepare instead,
which also previously used vm_iomap_memory(), so this change replaces it
with its mmap_prepare equivalent, mmap_action_simple_ioremap().

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 drivers/hv/hyperv_vmbus.h    |  4 ++--
 drivers/hv/vmbus_drv.c       | 27 +++++++++++++++++----------
 drivers/uio/uio_hv_generic.c | 11 ++++++-----
 include/linux/hyperv.h       |  4 ++--
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 7bd8f8486e85..31f576464f18 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -545,8 +545,8 @@ static inline int hv_debug_add_dev_dir(struct hv_device *dev)
 
 /* Create and remove sysfs entry for memory mapped ring buffers for a channel */
 int hv_create_ring_sysfs(struct vmbus_channel *channel,
-			 int (*hv_mmap_ring_buffer)(struct vmbus_channel *channel,
-						    struct vm_area_struct *vma));
+			 int (*hv_mmap_prepare_ring_buffer)(struct vmbus_channel *channel,
+							    struct vm_area_desc *desc));
 int hv_remove_ring_sysfs(struct vmbus_channel *channel);
 
 #endif /* _HYPERV_VMBUS_H */
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index bc4fc1951ae1..a76fa3f0588c 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1951,12 +1951,19 @@ static int hv_mmap_ring_buffer_wrapper(struct file *filp, struct kobject *kobj,
 				       struct vm_area_struct *vma)
 {
 	struct vmbus_channel *channel = container_of(kobj, struct vmbus_channel, kobj);
+	struct vm_area_desc desc;
+	int err;
 
 	/*
 	 * hv_(create|remove)_ring_sysfs implementation ensures that mmap_ring_buffer
 	 * is not NULL.
 	 */
-	return channel->mmap_ring_buffer(channel, vma);
+	compat_set_desc_from_vma(&desc, filp, vma);
+	err = channel->mmap_prepare_ring_buffer(channel, &desc);
+	if (err)
+		return err;
+
+	return __compat_vma_mmap(&desc, vma);
 }
 
 static struct bin_attribute chan_attr_ring_buffer = {
@@ -2048,13 +2055,13 @@ static const struct kobj_type vmbus_chan_ktype = {
 /**
  * hv_create_ring_sysfs() - create "ring" sysfs entry corresponding to ring buffers for a channel.
  * @channel: Pointer to vmbus_channel structure
- * @hv_mmap_ring_buffer: function pointer for initializing the function to be called on mmap of
+ * @hv_mmap_ring_buffer: function pointer for initializing the function to be called on mmap
  *                       channel's "ring" sysfs node, which is for the ring buffer of that channel.
  *                       Function pointer is of below type:
- *                       int (*hv_mmap_ring_buffer)(struct vmbus_channel *channel,
- *                                                  struct vm_area_struct *vma))
- *                       This has a pointer to the channel and a pointer to vm_area_struct,
- *                       used for mmap, as arguments.
+ *                       int (*hv_mmap_prepare_ring_buffer)(struct vmbus_channel *channel,
+ *                                                          struct vm_area_desc *desc))
+ *                       This has a pointer to the channel and a pointer to vm_area_desc,
+ *                       used for mmap_prepare, as arguments.
  *
  * Sysfs node for ring buffer of a channel is created along with other fields, however its
  * visibility is disabled by default. Sysfs creation needs to be controlled when the use-case
@@ -2071,12 +2078,12 @@ static const struct kobj_type vmbus_chan_ktype = {
  * Returns 0 on success or error code on failure.
  */
 int hv_create_ring_sysfs(struct vmbus_channel *channel,
-			 int (*hv_mmap_ring_buffer)(struct vmbus_channel *channel,
-						    struct vm_area_struct *vma))
+			 int (*hv_mmap_prepare_ring_buffer)(struct vmbus_channel *channel,
+							    struct vm_area_desc *desc))
 {
 	struct kobject *kobj = &channel->kobj;
 
-	channel->mmap_ring_buffer = hv_mmap_ring_buffer;
+	channel->mmap_prepare_ring_buffer = hv_mmap_prepare_ring_buffer;
 	channel->ring_sysfs_visible = true;
 
 	return sysfs_update_group(kobj, &vmbus_chan_group);
@@ -2098,7 +2105,7 @@ int hv_remove_ring_sysfs(struct vmbus_channel *channel)
 
 	channel->ring_sysfs_visible = false;
 	ret = sysfs_update_group(kobj, &vmbus_chan_group);
-	channel->mmap_ring_buffer = NULL;
+	channel->mmap_prepare_ring_buffer = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hv_remove_ring_sysfs);
diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index 3f8e2e27697f..29ec2d15ada8 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -154,15 +154,16 @@ static void hv_uio_rescind(struct vmbus_channel *channel)
  * The ring buffer is allocated as contiguous memory by vmbus_open
  */
 static int
-hv_uio_ring_mmap(struct vmbus_channel *channel, struct vm_area_struct *vma)
+hv_uio_ring_mmap_prepare(struct vmbus_channel *channel, struct vm_area_desc *desc)
 {
 	void *ring_buffer = page_address(channel->ringbuffer_page);
 
 	if (channel->state != CHANNEL_OPENED_STATE)
 		return -ENODEV;
 
-	return vm_iomap_memory(vma, virt_to_phys(ring_buffer),
-			       channel->ringbuffer_pagecount << PAGE_SHIFT);
+	mmap_action_simple_ioremap(desc, virt_to_phys(ring_buffer),
+			channel->ringbuffer_pagecount << PAGE_SHIFT);
+	return 0;
 }
 
 /* Callback from VMBUS subsystem when new channel created. */
@@ -183,7 +184,7 @@ hv_uio_new_channel(struct vmbus_channel *new_sc)
 	}
 
 	set_channel_read_mode(new_sc, HV_CALL_ISR);
-	ret = hv_create_ring_sysfs(new_sc, hv_uio_ring_mmap);
+	ret = hv_create_ring_sysfs(new_sc, hv_uio_ring_mmap_prepare);
 	if (ret) {
 		dev_err(device, "sysfs create ring bin file failed; %d\n", ret);
 		vmbus_close(new_sc);
@@ -366,7 +367,7 @@ hv_uio_probe(struct hv_device *dev,
 	 * or decoupled from uio_hv_generic probe. Userspace programs can make use of inotify
 	 * APIs to make sure that ring is created.
 	 */
-	hv_create_ring_sysfs(channel, hv_uio_ring_mmap);
+	hv_create_ring_sysfs(channel, hv_uio_ring_mmap_prepare);
 
 	hv_set_drvdata(dev, pdata);
 
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index dfc516c1c719..3a721b1853a4 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1015,8 +1015,8 @@ struct vmbus_channel {
 	/* The max size of a packet on this channel */
 	u32 max_pkt_size;
 
-	/* function to mmap ring buffer memory to the channel's sysfs ring attribute */
-	int (*mmap_ring_buffer)(struct vmbus_channel *channel, struct vm_area_struct *vma);
+	/* function to mmap_prepare ring buffer memory to the channel's sysfs ring attribute */
+	int (*mmap_prepare_ring_buffer)(struct vmbus_channel *channel, struct vm_area_desc *desc);
 
 	/* boolean to control visibility of sysfs for ring buffer */
 	bool ring_sysfs_visible;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
