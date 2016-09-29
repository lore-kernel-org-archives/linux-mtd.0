Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpebA-0004Mx-Qu
 for linux-mtd@lists.infradead.org; Thu, 29 Sep 2016 16:54:19 +0000
Received: by mail-pf0-x22c.google.com with SMTP id 21so30853613pfy.0
 for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2016 09:53:56 -0700 (PDT)
Date: Thu, 29 Sep 2016 17:56:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Kraemer, Matthias (Ferchau; ADITG/SW1)" <mkraemer@de.adit-jv.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Peter Tyser <ptyser@xes-inc.com>,
 "key.seong.lim@intel.com" <key.seong.lim@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC
Message-ID: <20160929165602.GA2844@dell>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <1471245044-12767-4-git-send-email-mika.westerberg@linux.intel.com>
 <B0A28CDC26EEC74CBBA518A6F0B2DE9E66ECD04F@HI2EXCH01.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B0A28CDC26EEC74CBBA518A6F0B2DE9E66ECD04F@HI2EXCH01.adit-jv.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 Sep 2016, Kraemer, Matthias (Ferchau; ADITG/SW1) wrote:

> Hello Mika,
> 
> In line 1239 you specify "struct pci_bus *bus = dev->bus;"
> }, @@ -1122,6 +1131,36 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
>  		}
>  		break;
>  
> +	case INTEL_SPI_BXT: {
> +		unsigned int p2sb = PCI_DEVFN(13, 0);
> +		unsigned int spi = PCI_DEVFN(13, 2);
> +		struct pci_bus *bus = dev->bus;
> 
> but in line 1262 you are using dev->bus again. 
> +
> +		pci_bus_write_config_byte(dev->bus, p2sb, 0xe1, 0x1);
> 
> Sure this is not a runtime issue, but it would be nice to keep the coding-style consistent. 
> We could just use dev->bus for BXT SOCs, like the remaining parts of this driver do. 
> 
> Kind regards
> Matthias Kraemer

Please reply in-line.  It is considered bad etiquette to top-post like this.

> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of Mika Westerberg
> Sent: Montag, 15. August 2016 09:11
> To: linux-mtd@lists.infradead.org
> Cc: Brian Norris; David Woodhouse; Lee Jones; Peter Tyser; key.seong.lim@intel.com; Mika Westerberg; linux-kernel@vger.kernel.org
> Subject: [PATCH v3 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC

Please fix your mailer.  This is crud and should not be quoted.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
