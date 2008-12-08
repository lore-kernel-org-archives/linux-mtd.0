Received: from ik-out-1112.google.com ([66.249.90.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9kOD-0006DP-ST
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 17:59:26 +0000
Received: by ik-out-1112.google.com with SMTP id b32so1051092ika.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Dec 2008 09:59:24 -0800 (PST)
Subject: [PATCH] [UBI] 0/4 notifications
From: dmitry pervushin <dpervushin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 08 Dec 2008 20:59:14 +0300
Message-Id: <1228759154.7622.26.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I am glad to present the serie of patches that implement volume
notifications in UBI and based on these notifications reworked MTD
emulation layer and a simple mtdblock-like FTL.

UBI volume notifications is intended to create the API to get clients
notified about volume creation/deletion, renaming and changing(actually,
resizing). A client can subscribe to these notifications using
ubi_volume_register and cancel the subsription using
ubi_volume_unregister. When UBI volume change occurs, the atomic
notifier will be called. Client also can request "added" event on all
volumes that existed before client subscribed to the notifications.

Using notifications instead of calling functions ubi_gluebi_xxx allows
MTD emulation layer to be more flexible; say, now is it possible to
build it as a module and load/unload it on demand.

The simple FTL uses the same notification mechanism and provides
mtdblock-like layer.
