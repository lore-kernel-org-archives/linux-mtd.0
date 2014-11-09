Date: Sun, 9 Nov 2014 07:18:53 -0500 (EST)
From: Rodrigo Freire <rfreire@redhat.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <2086372266.7454667.1415535533979.JavaMail.zimbra@redhat.com>
In-Reply-To: <20141105202303.GN23619@ld-irv-0074>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
Subject: [PATCH v3 0/3] mtd: block2mtd: wait for device enumeration, add
 name support
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Herton Krzesinski <hkrzesin@redhat.com>,
 =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 Felix Fietkau <nbd@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Felix Fietkau <nbd@openwrt.org>

mtd: block2mtd: wait for device enumeration, add name support

Currently, a block MTD device is not presented timely on boot time, in
order to start mounting the filesystems, causing the system to not boot
or panic because of lack of rootfs. This patch ensures that block2mtd
is presented at the right time, so the filesystems can be mounted on boot
time.
This issue was seen on BCM2835 (Raspberry Pi) systems when mounting JFFS2
block2mtd filesystems.
This patchset also adds a MTD device name and a timeout option to the driver
and deprecates PAGE_MASK when calculating the device size.
Original patchset:
https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/440-block2mtd_init.patch?rev=40444
https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/441-block2mtd_probe.patch?rev=40444

V3: Split the changes on 3 different patches, fixes a compile warning
V2: Uses kstrdup, removed PAGE_MASK.

 drivers/mtd/devices/block2mtd.c |   57 ++++++++++++++++++++++++++++----------
 1 files changed, 42 insertions(+), 15 deletions(-)
 drivers/mtd/devices/block2mtd.c |   32 +++++++++++++++++++++++---------
 1 files changed, 23 insertions(+), 9 deletions(-)
 drivers/mtd/devices/block2mtd.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)
---
1.7.1
