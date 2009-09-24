Received: from mx1.redhat.com ([209.132.183.28])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mqoy7-0002VH-OM
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 14:06:52 +0000
Date: Thu, 24 Sep 2009 16:06:39 +0200
From: Karel Zak <kzak@redhat.com>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 0/3] Add support for UBI and UBIFS
Message-ID: <20090924140639.GB27905@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
Cc: util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2009 at 01:11:53PM +0200, Corentin Chary wrote:
> Hi,
> Here is some patchs to add support for UBI and UBIFS in libblkid.
> 
> UBIFS works on top of UBI volumes, there are 3 subsystems involved:
>   * MTD subsystem, which provides uniform interface to access flash chips.
>     MTD provides an notion of MTD devices (e.g., /dev/mtd0) which basically represents raw flash;
>   * UBI subsystem, which is a wear-leveling and volume management system for flash devices;
>     UBI works on top of MTD devices and provides a notion of UBI volumes (e.g.m /dev/ubi0_0);
>   * UBIFS file system, which works on top of UBI volumes.

 Applied. 
 
 Please, "git pull" and test "mics-utils/blkid -p" against a real UBI
 device. I did some minor changes to the code (it was necessary to
 rebase your patches to the current HEAD).

 Thanks for your patience :-)

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
