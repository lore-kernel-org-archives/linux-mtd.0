Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpbXy-0001DB-M1
 for linux-mtd@lists.infradead.org; Thu, 29 Sep 2016 13:38:47 +0000
Date: Thu, 29 Sep 2016 16:29:40 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Kraemer, Matthias (Ferchau; ADITG/SW1)" <mkraemer@de.adit-jv.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Peter Tyser <ptyser@xes-inc.com>,
 "key.seong.lim@intel.com" <key.seong.lim@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC
Message-ID: <20160929132940.GP1218@lahna.fi.intel.com>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <1471245044-12767-4-git-send-email-mika.westerberg@linux.intel.com>
 <B0A28CDC26EEC74CBBA518A6F0B2DE9E66ECD04F@HI2EXCH01.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B0A28CDC26EEC74CBBA518A6F0B2DE9E66ECD04F@HI2EXCH01.adit-jv.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 29, 2016 at 01:19:30PM +0000, Kraemer, Matthias (Ferchau; ADITG/SW1) wrote:
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

Good point. It is a typo, although works.

> Sure this is not a runtime issue, but it would be nice to keep the
> coding-style consistent.  We could just use dev->bus for BXT SOCs,
> like the remaining parts of this driver do. 

Or "bus". But yeah I agree it should be consistent.

Since it looks like this driver is not going to make it for v4.9, I'll
fix this up and resend the whole thing once v4.9-rc1 is released.
