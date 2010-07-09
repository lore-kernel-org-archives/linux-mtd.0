Received: from mail.dbn.pfk.co.za ([196.212.6.202])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OX7UH-00088O-Lf
	for linux-mtd@lists.infradead.org; Fri, 09 Jul 2010 06:55:06 +0000
From: "Sean Preston" <seanp@pfk.co.za>
To: "'Paulraj, Sandeep'" <s-paulraj@ti.com>,
	"'Eric Millbrandt'" <emillbrandt@dekaresearch.com>,
	"'Linux-MTD List'" <linux-mtd@lists.infradead.org>
References: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>	<0A40042D85E7C84DB443060EC44B3FD325405DE5AE@dekaexchange07.deka.local>
	<0554BEF07D437848AF01B9C9B5F0BC5D9F13518B@dlee01.ent.ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9F13518B@dlee01.ent.ti.com>
Subject: RE: New NAND Help
Date: Fri, 9 Jul 2010 08:54:00 +0200
Message-ID: <002101cb1f33$a2dfcc00$e89f6400$@pfk.co.za>
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

> >
> > <snip>
> This device is probably a ONFI device. Thus the fourth ID byte might not
be
> properly interpreted.

Yes it is an ONFI 2.1 compliant device.
 
> The best would be to just hard code the values in the device ids table

I will take a look at this and feedback.

Regards
Sean

--
Sean Preston
Email: seanp@pfk.co.za
