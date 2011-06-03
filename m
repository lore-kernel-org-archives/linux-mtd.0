Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRfY-0002Xh-M0
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:31:57 +0000
Received: by wyb28 with SMTP id 28so1813293wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:31:53 -0700 (PDT)
Date: Fri, 3 Jun 2011 11:31:49 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/6] Further Denali NAND enhancements
Message-ID: <20110603103149.GI2637@pulham.picochip.com>
References: <1307096238-25751-1-git-send-email-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307096238-25751-1-git-send-email-jamie@jamieiles.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 03, 2011 at 11:17:12AM +0100, Jamie Iles wrote:
> This series performs a couple of minor cleanups to the Denali NAND
> controller driver and then introduces support for newer versions of the
> IP where ECC fixup is supported in hardware.
> 
> Finally add support for partitioning through platform data and cmdline
> partitioning.
> 
> Jamie Iles (6):
>   nand/denali: convert to dev_() printk helpers
>   nand/denali: annotate pci init/exit functions with correct section
>   nand/denali: allow the number of ECC bits to be set by pdata
>   nand/denali: support hardware with internal ECC fixup
>   nand/denali: support MTD partitioning
>   mtd/denali: support for cmdline partitioning

Please disregard this series; I was too trigger happy with git 
send-email after a rebase.  A respin follows with apologies.

Jamie
