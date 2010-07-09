Received: from mail.dbn.pfk.co.za ([196.212.6.202])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OX7e0-0000Ui-D9
	for linux-mtd@lists.infradead.org; Fri, 09 Jul 2010 07:05:09 +0000
From: "Sean Preston" <seanp@pfk.co.za>
To: "'Paulraj, Sandeep'" <s-paulraj@ti.com>,
	"'Eric Millbrandt'" <emillbrandt@dekaresearch.com>,
	"'Linux-MTD List'" <linux-mtd@lists.infradead.org>
References: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>	<0A40042D85E7C84DB443060EC44B3FD325405DE5AE@dekaexchange07.deka.local>	<0554BEF07D437848AF01B9C9B5F0BC5D9F13518B@dlee01.ent.ti.com>	<0A40042D85E7C84DB443060EC44B3FD325405DE5AF@dekaexchange07.deka.local>
	<0554BEF07D437848AF01B9C9B5F0BC5D9F1351CD@dlee01.ent.ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9F1351CD@dlee01.ent.ti.com>
Subject: RE: New NAND Help
Date: Fri, 9 Jul 2010 09:04:43 +0200
Message-ID: <002801cb1f35$08502930$18f07b90$@pfk.co.za>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

First, thanks for the info so far.

> > <snip>
> > That is correct.  Micron used to support both the ID byte and the
> > parameter page in their ONFO 1.0 compliant parts, but seems to have
> > dropped support in their newer ONFI 2.1 compliant parts.  I found out
> > the hard way when switching from an mlc part to an slc part.
> 
> So did i
> IIRC there were some discussions on the list to add support for these
devices
> and reading the relevant info from the param page.
> 
> The issue with the DM365 is that the RBL is not geared up for these
devices.

I am using silicon version 1.2 of the DM365 and the RBL thankfully does seem
to work with this device.  I have been able to successfully flash it with
the stock UBL in the TI DVSDK 3.10.00_12 & 16 and also get the uBoot written
to it and working correctly with only minor changes.

I will try the hard coding route and see if I can get the device working in
the kernel on the TI DM365 EVM board and will then feedback.

Regards
Sean

--
Sean Preston
Email: seanp@pfk.co.za
