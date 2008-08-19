Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVXU3-0004Dt-8V
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 20:07:15 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KVXTz-00047Y-U3
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 20:07:12 +0000
Received: from gw-c.sigma-chemnitz.de ([62.153.82.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2008 20:07:11 +0000
Received: from enrico.scholz by gw-c.sigma-chemnitz.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2008 20:07:11 +0000
To: linux-mtd@lists.infradead.org
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Reading unique flash ID from Samsung NAND
Date: Tue, 19 Aug 2008 21:47:20 +0200
Message-ID: <ly63pwhjnb.fsf@ensc-virt.intern.sigma-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Samsung NAND flash have a feature described as

| Unique ID for Copyright

in the datasheets[1].  Does somebody know how to read this ID?
Having such an unique id would allow e.g. things like setting
machine serial number (and ethernet mac in turn).



Enrico

Footnotes: 
[1]  e.g. http://www.samsung.com/global/system/business/semiconductor/product/2007/6/11/NANDFlash/SLC_LargeBlock/16Gbit/K9WAG08U1A/ds_k9xxg08uxa_rev11.pdf
