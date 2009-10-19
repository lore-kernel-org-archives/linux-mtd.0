Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MzlXC-0001Yv-HW
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 06:16:03 +0000
Received: by yxe40 with SMTP id 40so3737101yxe.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Oct 2009 23:15:57 -0700 (PDT)
Date: Mon, 19 Oct 2009 15:15:50 +0900
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] MTD: Add nand_ecc test module
Message-ID: <20091019061550.GA23854@localhost.localdomain>
References: <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
	<1255932706-23824-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1255932706-23824-2-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 19, 2009 at 03:11:46PM +0900, Akinobu Mita wrote:
> This module tests NAND ECC functions.
> 
> The test is simple.
> 
> 1. Create a 256 or 512 bytes block of data filled with random bytes (data)
> 2. Duplicate the data block and inject single bit error (error_data)
> 3. Try to correct error_data
> 4. Compare data and error_data
> 
> This test is added into new MTD test group called MTD NAND test
> which requires MTD NAND device support.
> 

...

> +
> +#if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
> +

Oops. I forgot to remove this ifdefs.
