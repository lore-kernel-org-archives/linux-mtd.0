Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15lzZU-0005Nb-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2001 22:16:52 +0100
Message-ID: <20010925142549.A22356@recycle.lbl.gov>
Date: Tue, 25 Sep 2001 14:25:49 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems with 28F320B still
References: <20010925134029.A22314@recycle.lbl.gov> <24339.1001451631@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <24339.1001451631@redhat.com>; from David Woodhouse on Tue, Sep 25, 2001 at 10:00:31PM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David -

> [the 28F320B3] is not a CFI chip. Why is cfi_probe claiming to
> recognise it? The CFI structure you quoted is obviously wrong. 

I can't tell you why it was recognized, but the probe was
triggered by the line in drivers/mtd/maps/physmap.c :

	mymtd = do_map_probe("cfi_probe", &physmap_map);

I added a coupla printk's, and find it entered cfi_probe_chip with
cfi->device_type==2.  The line in the logfile
   Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit mode
came from the first of two cfi_probe_chip_1() calls within cfi_probe_chip(),
which returned index == 0.

I'll happily apply patches and help debug, but I'm not terribly
familiar with this corner of the Linux kernel, so suggestions
and comments will be greatly appreciated.

    - Larry
