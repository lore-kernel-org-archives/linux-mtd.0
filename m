Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Iq54z-0007H3-C9
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 05:57:52 -0500
Date: Thu, 8 Nov 2007 11:12:53 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 6/8] MTD: add physical address to point() api -- PCI RAM
	card pmc551
Message-ID: <20071108101253.GA18903@lazybastard.org>
References: <6934efce0711071923q7fecf4a4pac2fed1e8e7db0ee@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0711071923q7fecf4a4pac2fed1e8e7db0ee@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 November 2007 19:23:41 -0800, Jared Hulbert wrote:
> @@ -803,7 +810,7 @@ static int __init init_pmc551(void)
>  		}
> 
>  		/* Keep a reference as the add_mtd_device worked */
> -		pci_dev_get(PCI_Device);
> +		//pci_dev_get(PCI_Device);
> 
>  		printk(KERN_NOTICE "Registered pmc551 memory device.\n");
>  		printk(KERN_NOTICE "Mapped %dMiB of memory from 0x%p to 0x%p\n",

What is this hunk doing?

Jörn

-- 
Joern's library part 14:
http://www.sandpile.org/
