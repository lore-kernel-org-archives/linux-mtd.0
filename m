From: David Woodhouse <dwmw2@infradead.org>
To: manningc2@actrix.gen.nz
In-Reply-To: <20031027202807.DA4481A0A7@desire.actrix.co.nz>
References: <3F9D3D98.6453.14E703@localhost>
	 <20031027202807.DA4481A0A7@desire.actrix.co.nz>
Content-Type: text/plain
Message-Id: <1067339503.15551.429.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Oct 2003 11:11:43 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: simon@baydel.com
Subject: Re: SmartMedia FAT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some SM adapters do the translation in firmware and present themselves
to the host as a real block device. You don't have any _choice_ but to
use the SMTL on those.

You don't actually have to use _FAT_ on that though, any more than you
_have_ to use FAT on floppies or DiskOnChip just because that's how they
are shipped. You could use ext3 or something else powerfail-safe. You
still have the inefficient journalling-on-journalling effect that you
get with all such fake-block-device arrangements, but it shouldn't
actually break before you wear the flash out.

Implementing SMTL really shouldn't be that hard. The mtd_blkdevs code in
CVS handles all the horridness of the Linux block layer for you and you
only need to write readsector() and writesector() routines. There's code
in drivers/usb/storage/sddr09.c which may help, since those devices make
the host do the translation.

-- 
dwmw2
