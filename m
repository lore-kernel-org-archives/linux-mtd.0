Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpJrP-0007il-59
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 16:04:19 +0000
Message-ID: <5384B772.4030506@makrotopia.org>
Date: Tue, 27 May 2014 18:04:02 +0200
From: Daniel <daniel@makrotopia.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
In-Reply-To: <1401202595.1304.165.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/27/2014 04:56 PM, Artem Bityutskiy wrote:
> On Tue, 2014-05-27 at 16:11 +0200, Daniel Golle wrote:
>> When attempting to mount a non-ubifs formatted volume, lots of error
>> messages (including a stack dump) are thrown to the kernel log even if
>> the MS_SILENT mount flag is set.
>> Fix this by introducing an additional parameter in ubifs_read_node and
>> use it to pass down the MS_SILENT flag in ubifs_read_sb_node.
>>
>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Thanks. How did you test this patch?

You can test this by trying to mount a non-empty volume which does not contain a
UBIFS superblock (but e.g. squashfs or a U-Boot environment) with
mount -t ubifs -o silent /dev/ubiX_Y /mnt
This should fail without creating any klog lines.

The reason that I want this is that I'm working on integration of UBI support in
OpenWrt, including auto-mounting the "rootfs" volume by default (if it exists)
in case the rootfs and/or rootfstype parameters are not passed-down by the
bootloader, see
https://gitorious.org/openwrt-oxnas/openwrt-oxnas/commit/e1306d7b9bee8a39a33147d93cb399a4621bf3aa

The idea is to have the same level of features and comfort also on devices where
UBI is being used, for MTD devices OpenWrt does something similar
https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.14/480-mtd-set-rootfs-to-be-root-dev.patch

However, this is probably distribution-specific hackery, but independently of
that, UBIFS should still respect the MS_SILENT flag just like all other
filesystems do.
