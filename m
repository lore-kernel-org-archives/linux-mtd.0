Received: from mail-qe0-x231.google.com ([2607:f8b0:400d:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYk7R-0006dG-TG
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 22:08:06 +0000
Received: by mail-qe0-f49.google.com with SMTP id a11so5167993qen.8
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 15:07:44 -0700 (PDT)
Date: Tue, 22 Oct 2013 15:07:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [RESEND][PATCH V2] mtd: bcm47xxpart: detect block aligned
 Squashfs partition
Message-ID: <20131022220741.GP23337@ld-irv-0074.broadcom.com>
References: <1382387677-22006-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1382387677-22006-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 21, 2013 at 10:34:37PM +0200, Rafał Miłecki wrote:
> Most of the bcm47xx devices use TRX format for storing kernel and some
> partition like Squashfs or JFFS2. This is pretty flexible solution, CFE
> (the bootloader) just writes (and later boots) TRX at some hardcoded
> place and paritions can vary in the size.
> 
> However some devices don't use TRX format. Very recently we have
> discovered ZTE H218N that has kernel and rootfs partitions at some
> "random" places.
> 
> This patch allows Linux find a rootfs partition after installing custom
> image with a CFE bootloader.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
