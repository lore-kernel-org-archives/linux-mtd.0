Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DS2p-0008AT-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 15:36:23 +0100
Message-ID: <3B3359F7.64241206@daniel.com>
Date: Fri, 22 Jun 2001 09:45:11 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: ashwinp@aftek.com
CC: linux-mtd@lists.infradead.org
Subject: Re: Is my flash being detected?
References: <993219781.58250@email.aftek.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Ok, I hit send too quickly. If you flash is not CFI, then make sure that the JDEC module is included.

Vipin





ashwinp@aftek.com wrote:

> Hi freinds,
>         I am trying to use mtd on L7205sdb.The flash chip used is AM29LV160DB.
> The flash size is 16 MB in byte mode and processor data bus being 32 bits wide.
> The .config for MTD is as below
> CONFIG_MTD=y
> CONFIG_MTD_DEBUG=y
> CONFIG_MTD_DEBUG_VERBOSE=3
> CONFIG_MTD_CFI=y
> CONFIG_MTD_CFI_AMDEXT=y
> CONFIG_MTD_ROM=y
> CONFIG_MTD_PHYSMAP=y
> CONFIG_MTD_PHYSMAP_START=000000
> CONFIG_MTD_PHYSMAP_LEN=10000
> CONFIG_MTD_PHYSMAP_BUSWIDTH=4
>
> It does say that AMd flash found but at the end it complains that
> "cfi_probe: No supported Vendor Command Set found"
>
> Given below are my bootup messages
>
> Linux version 2.2.1-rmk2 (root@localhost.localdomain) (libraries: /usr/local/arm/lib/gcc-lib/arm-linux/egcs-2.91.66/:/usr/lib/gcc/arm-linux/egcs-2.91.66/:/usr/local/arm/arm-linux/lib/arm-linux/egcs-2.91.66/:/usr/local/arm/arm-linux/lib/) #916 Fri Jun 22 17:51:46 IST 2001
> start_kernl: Before setup_arch, 00000000-00000000
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
