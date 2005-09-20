Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHez9-0001OT-BB
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 06:04:34 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <432FD421.2090508@ru.mvista.com>
References: <432EBFC8.3090803@ru.mvista.com>
	<1127162439.24044.235.camel@tglx.tec.linutronix.de>
	<432FD421.2090508@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 20 Sep 2005 12:04:27 +0200
Message-Id: <1127210667.24044.343.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND/ HW ECC problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 13:19 +0400, Vitaly Wool wrote:

> So, the subject of change is exactly the areas in the spare area which 
> can be used for automatic placement (fsoobdata), i. e. oobfree. In my 
> case, oobfree is not at oob+buf + oobsel->eccbytes but spread across the 
> block in a way

> data - ecc - fsoobdata - data - ecc - fsoobdata - data - ecc - fsoobdata - data - ecc - fsoobdata
> 
> 
> Therefore the assumption that fsoobdata is at the end of the block 
> doesn't work, and that's what this part of the patch is about.
> Please correct me if I'm wrong,

ECC goes not into oobfree !

oobsel->eccpos is the array holding the byte positions of the ecc bytes

oobsel->oobfree is defining the places where filesystems can put data
in. i.e: all places which are not used by bad block markers and ECC
bytes.

The code for SW ECC does exactly the right thing.

The code for HW ECC makes the assumption that the ecc positions are
aligned only for the case that the chip options have NAND_HWECC_SYNDROME
set. If this option is not set, then the bytes are put to the correct
place as given by oobsel->eccpos.

Your patch makes another wrong assumption about MTD_ECC_RS_DiskOnChip.
Depending the non scattered placement of ECC bytes on this would break
other users e.g. rtc_from4.

These users rely on the NAND_HWECC_SYNDROM option, which enforces the
data-ecc layout. Your chip does not.

You need absolutely no change to the code except the new ECC mode
constant and the larger eccpos array. Anything else is supported
already. You must not set NAND_HWECC_SYNDROM option even if your chip
generates syndromes. The code in nand_base.c does know exactly nothing
about the contents of the ecc bytes. It just transfers the data from and
to the places defined by oobsel->eccpos.

The read code will do the following

for (i= 0; i < pagesize/512; i++)
	enable_hwecc()
	read512bytes()
	calculate_ecc() (Read the ecc data into ecc_calc)

read_oob(16 or 64 byte)

transfer ecc data bytes from oob_data to ecc_code (linear array)

for (i= 0; i < pagesize/512; i++)
	correct_data(&data[i*512], &ecc_code[i*ecclen], &ecc_calc[i*ecclen])


tglx
