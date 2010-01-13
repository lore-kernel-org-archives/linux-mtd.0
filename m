Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV5aR-0006us-OV
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 15:56:51 +0000
Received: by fg-out-1718.google.com with SMTP id e21so613057fga.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 07:56:46 -0800 (PST)
Message-ID: <4B4DED3D.9060609@gmail.com>
Date: Wed, 13 Jan 2010 16:56:45 +0100
From: Jiri Slaby <jirislaby@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: l440gx: weird PCI refcounting
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

stanse found two PCI device double puts in l440gx code.

init_l440gx looks like:
dev = pci_get_device(PCI_VENDOR_ID_INTEL,...);
pm_dev = pci_get_device(PCI_VENDOR_ID_INTEL,...);

pci_dev_put(dev); // first
...
if (!(pm_iobase->flags & IORESOURCE_IO)) {
  ...
  pci_dev_put(pm_dev); // first
  ...
  if (pci_assign_resource(pm_dev, PIIXE_IOBASE_RESOURCE) != 0) {
    pci_dev_put(dev); // second
    pci_dev_put(pm_dev); // second
    return -ENXIO;
  }
}

I would fix it, but I don't see from that, what the code should do.
pm_dev is used after it's put. And to add, cleanup_l440gx doesn't
contain any puts at all.

Any ideas?

References:
http://decibel.fi.muni.cz/~xslaby/stanse/error.cgi?db=33-rc&id=635#l84
http://decibel.fi.muni.cz/~xslaby/stanse/error.cgi?db=33-rc&id=636#l48

-- 
js
