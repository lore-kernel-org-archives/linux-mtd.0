Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15mjfa-0000Z5-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2001 23:30:14 +0100
Message-ID: <20010927153911.A3025@recycle.lbl.gov>
Date: Thu, 27 Sep 2001 15:39:11 -0700
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

I think I am slowly starting to grok at least part of the MTD chip
driver layer.  Tell me if I'm on the right track.

All the chips listed in
	static const struct amd_flash_info jedec_table[]
in drivers/mtd/chips/jedec_probe.c use the cfi_cmdset_0002.c driver.
This is implemented with the line
	p_cfi->cfiq->P_ID = P_ID_AMD_STD;
deep inside cfi_jedec_setup().

Now I come along trying to turn on an Intel TE28B320B3B, which
is a non-CFI chip, with a valid JEDEC code (manufacturer=0x0089,
product=0x8897), but which needs to use the cfi_cmdset_0001.c
driver.

Maybe I should modify jedec_probe.c to add another field to
the amd_flash_info structure, telling which command set to use.
All existing chips would set that to P_ID_AMD_STD, but my new
entry would have P_ID_INTEL_STD.  Such a change would obsolete
the name of the structure, which I wouldn't worry about for now.

If Intel is really a special case, an alternative would be to say:
	p_cfi->cfiq->P_ID =
 (p_cfi->mfr==MANUFACTURER_INTEL) ? P_ID_INTEL_STD : P_ID_AMD_STD;

The only chip feature that I found that is used in cfi_cmdset_0001.c
that is not shown in the data sheet for the 'B3 series chip data
sheet is block program (command code 0xe8).  I would have to find
some way to disable that section of the code in do_write_buffer(),
and fall back to single word programming.  Not hard to hack, but
in order for main branch code to claim 'B3 support, a flag would
need to be communicated from jedec_probe to cfi_cmdset_0001.

       - Larry Doolittle   <LRDoolittle@lbl.gov>
