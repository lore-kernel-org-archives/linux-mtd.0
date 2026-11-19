Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AC60A2616
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqePyZ+8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O7gt4TPI7P9iTbSNFG/zocdnY3TAo4b8wIHWgr/V7rY=; b=cqePyZ+8xWQcPsvWeGKRU1ybtu
	eB3U0uSt9DbMWpZCZchRxBrUwXMWAv3yElnMqPt+L7aoGTBZm6m3wzJzeYigxTfgW38cvIK51dlm9
	DBBuZ7SmNKgd6WxXFIeTBrr/Fo8aQuIhZ0KgBBmwrOmJwquz2dypDxfgD+6td7/cknenxpc3x3wm+
	3+X5Pyxli1dD4ccIp/b/oL4avoIF+V4XlauRQyIlV0Awcrrq6SPqovIM5svpHG7H4xAFBHYzCPRnl
	UoPbI/jwnxqoW2LJAfd9vS7vuN0UE46kyBMdj5IatdBrPj0QoSq24juFfUqqeDIEOyHh54BOvZ11D
	qA4DiCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTunw-0000000AuiO-3e9O;
	Thu, 19 Nov 2026 05:35:28 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuns-0000000Aufu-3YX5;
	Thu, 19 Nov 2026 05:35:24 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	linux-mm@kvack.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev,
	Chas Williams <3chas3@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	MPT-FusionLinux.pdl@broadcom.com,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	Neill Kapron <nkapron@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	"Theodore Ts'o" <tytso@mit.edu>,
	linux-ext4@vger.kernel.org,
	Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org,
	Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	linux-cifs@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v2 02/12] docs: ioctl-number: update sound entries
Date: Wed, 18 Nov 2026 21:35:03 -0800
Message-ID: <20261119053514.255348-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119053514.255348-1-rdunlap@infradead.org>
References: <20261119053514.255348-1-rdunlap@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the list of files where sound ioctls are defined and update
the ranges of function numbers that are used.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
v2: add Rev-by: from Takashi Sakamoto;
    address several review comments from sashiko

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |   14 ++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -122,11 +122,14 @@ Code  Seq#    Include File
 'A'   00-0F  linux/agpgart.h,                                          conflict!
              drivers/char/agp/compat_ioctl.h
 'A'   00-7F  sound/asound.h                                            conflict!
+'A'   20-24  sound/pcm.h                                               conflict!
+'A'   10-53  sound/core/pcm_compat.c                                   conflict!
 'B'   00-1F  linux/cciss_ioctl.h                                       conflict!
 'B'   00-0F  include/linux/pmu.h                                       conflict!
 'B'   C0-FF  advanced bbus                                             <mailto:maassen@uni-freiburg.de>
 'B'   00-0F  xen/xenbus_dev.h                                          conflict!
 'C'   all    linux/soundcard.h                                         conflict!
+'C'   00-68  sound/compress_offload.h                                  conflict!
 'C'   01-2F  linux/capi.h                                              conflict!
 'C'   F0-FF  drivers/net/wan/cosa.h                                    conflict!
 'D'   all    arch/s390/include/asm/dasd.h
@@ -152,6 +155,7 @@ Code  Seq#    Include File
 'H'   01     linux/mei.h                                               conflict!
 'H'   02     linux/mei.h                                               conflict!
 'H'   03     linux/mei.h                                               conflict!
+'H'   03     sound/core/hwdep_compat.c                                 conflict!
 'H'   00-0F  sound/asound.h                                            conflict!
 'H'   20-40  sound/asound_fm.h                                         conflict!
 'H'   80-8F  sound/sfnt_info.h                                         conflict!
@@ -161,6 +165,7 @@ Code  Seq#    Include File
 'H'   40-4F  sound/hdspm.h                                             conflict!
 'H'   40-4F  sound/hdsp.h                                              conflict!
 'H'   90     sound/usb/usx2y/usb_stream.h
+'H'   FC     sound/pci/asihpi/hpios.h                                  conflict!
 'H'   00-0F  uapi/misc/habanalabs.h                                    conflict!
 'H'   A0     uapi/linux/usb/cdc-wdm.h
 'H'   C0-F0  net/bluetooth/hci.h                                       conflict!
@@ -168,7 +173,7 @@ Code  Seq#    Include File
 'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                                 conflict!
 'H'   C0-DF  net/bluetooth/bnep/bnep.h                                 conflict!
 'H'   F1     linux/hid-roccat.h                                        <mailto:erazor_de@users.sourceforge.net>
-'H'   F8-FA  sound/firewire.h
+'H'   F8-FE  sound/firewire.h                                          conflict!
 'I'   all    linux/isdn.h                                              conflict!
 'I'   00-0F  drivers/isdn/divert/isdn_divert.h                         conflict!
 'I'   40-4F  linux/mISDNif.h                                           conflict!
@@ -204,6 +209,9 @@ Code  Seq#    Include File
 'S'   80-81  scsi/scsi_ioctl.h                                         conflict!
 'S'   82-FF  scsi/scsi.h                                               conflict!
 'S'   00-7F  sound/asequencer.h                                        conflict!
+'S'   20-52  sound/core/seq/seq_compat.c                               conflict!
+'S'   60-63  sound/scarlett2.h                                         conflict!
+'S'   60-67  sound/fcp.h                                               conflict!
 'T'   all    linux/soundcard.h                                         conflict!
 'T'   00-AF  sound/asound.h                                            conflict!
 'T'   all    arch/x86/include/asm/ioctls.h                             conflict!
@@ -219,8 +227,8 @@ Code  Seq#    Include File
 'V'   C0     media/si4713.h                                            conflict!
 'W'   00-1F  linux/watchdog.h                                          conflict!
 'W'   00-1F  linux/wanrouter.h                                         conflict! (pre 3.9)
-'W'   00-3F  sound/asound.h                                            conflict!
-'W'   40-5F  drivers/pci/switch/switchtec.c
+'W'   00-41  sound/asound.h                                            conflict!
+'W'   40-5F  drivers/pci/switch/switchtec.c                            conflict!
 'W'   60-61  linux/watch_queue.h
 'X'   all    fs/xfs/xfs_fs.h,                                          conflict!
              fs/xfs/linux-2.6/xfs_ioctl32.h,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
