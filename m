Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DdoFe-0005bp-G3
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 07:52:43 -0400
Date: Thu, 2 Jun 2005 13:52:39 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050602115239.GB442@synertronixx3>
References: <20050601134130.GA19482@synertronixx3>
	<429E87D5.5050906@thattiko.net> <20050602101959.GB11524@zappa>
	<1117709167.20785.86.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1117709167.20785.86.camel@tglx.tec.linutronix.de>
Subject: Re: Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-06-02 12:46 +0200 schrieb Thomas Gleixner:

> Maybe it helps if you read the code of the invoked function
> (cfi_varsize_frob).

Ok, I took a closer look into cfi_varsize_frob() trying to understand,
if ofs should be 0 (beginning of partition) or address (physical address
of beginning of partition).

What I found out is, that mtd->numeraseregions contains 0 which is the
problem and causes the Oops regardless with which ofs the funtion is
called.

Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
cfi_intelext_unlock: lock status before, ofs=0x00000000, len=0x00020000
KONSTI mtd->numeraseregions: 0x0                                       
KONSTI first: 0xffffffff        
KONSTI adr:  0x0

Is the output of

int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
                                     loff_t ofs, size_t len, void *thunk)
{

...
	i = 0;

        printk("KONSTI mtd->numeraseregions: 0x%x\n", mtd->numeraseregions);

        while (i < mtd->numeraseregions && ofs >= regions[i].offset)
               i++;
        i--;

//      if (ofs & (regions[i].erasesize-1))
//              return -EINVAL;

        /* Remember the erase region we start on */
        first = i;
        printk("KONSTI first: 0x%x\n", first);

The while loop is not entered because 0 is NOT < 0 and 0 is 
decremented by one.
Acessing regions[-1].erasesize gives the Oops, is that correct?

So why is mtd->numeraseregions 0 in my setup and what should be in it (I 
mean in speaking words).

regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
