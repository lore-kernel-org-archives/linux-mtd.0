Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKCT3-00016U-Fm
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 12:55:11 +0000
Date: Wed, 30 Jan 2008 13:53:50 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
Message-ID: <20080130135350.67e95e20@dhcp-252-066.norway.atmel.com>
In-Reply-To: <6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
References: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
	<6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo.Santos@devoteam.com,
	Nicolas Pitre <nico@cam.org>, Justin Treon <justin_treon@yahoo.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 Jan 2008 18:13:43 -0800
"Jared Hulbert" <jaredeh@gmail.com> wrote:

> drivers/mtd/chips/cfi_cmdset_0001.c |   20 +++++++++++++-------
> drivers/mtd/cmdlinepart.c           |    9 ++++++++-
> drivers/mtd/mtdcore.c               |    2 +-
> include/mtd/mtd-abi.h               |    2 +-
> 4 files changed, 23 insertions(+), 10 deletions(-)

Hang on a second though...

> diff -r c105f44cf785 include/mtd/mtd-abi.h
> --- a/include/mtd/mtd-abi.h	Thu Nov 08 15:36:57 2007 -0800
> +++ b/include/mtd/mtd-abi.h	Fri Nov 09 10:43:28 2007 -0800
> @@ -29,7 +29,7 @@ struct mtd_oob_buf {
>  #define MTD_WRITEABLE		0x400	/* Device is writeable */
>  #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
>  #define MTD_NO_ERASE		0x1000	/* No erase necessary */
> -#define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
> +#define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
> 
>  // Some common devices / combinations of capabilities
>  #define MTD_CAP_ROM		0

This will break cfi_cmdset_0002.c, which also uses MTD_STUPID_LOCK.

Haavard
