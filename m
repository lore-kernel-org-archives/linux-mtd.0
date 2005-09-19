Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHSRJ-0006Dq-PB
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 16:41:32 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <432EBFC8.3090803@ru.mvista.com>
References: <432EBFC8.3090803@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 19 Sep 2005 22:40:38 +0200
Message-Id: <1127162439.24044.235.camel@tglx.tec.linutronix.de>
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

On Mon, 2005-09-19 at 17:40 +0400, Vitaly Wool wrote:
> First, it turned to be necessary to add one more ECC type 
> (NAND_ECC_HW10_512): this controller stores 10 ECC data bytes after each 
> 512-byte block. Also the need to change size of eccpos array off of 
> nand_oobinfo structure arose: for flashes with 2K-sector, this turned to 
> be 40 bytes for each sector.

Hmm, we really should think about making the ECC size per chunksize run
time configurable.

> The serious problem we came across also was that nand_write_page doesn't 
> follow the free bytes reference for OOB to write ECC data what was 
> obviously wrong. As far as I understand, the DoC flashes have specific 
> mechanism for handling that, so he legacy variant was left for the DoC, 
> dunno whether it's right.

Err, the oobfree reference is the place where file systems can put their
data in. The ECC is put into the byte positions given by eccpos.

http://www.linux-mtd.infradead.org/tech/mtdnand/x215.html

eccpos

The eccpos array holds the byte offsets in the spare area where the ecc
codes are placed. 

  * oobfree

The oobfree array defines the areas in the spare area which can be used
for automatic placement. The information is given in the format {offset,
size}. offset defines the start of the usable area, size the length in
bytes. More than one area can be defined. The list is terminated by an
{0, 0} entry. 


I never bothered to implement the support for HW_ECC with a scattered
byte layout as I never seen a controller doing such nonsense. All I have
seen do

data - ecc - fsoobdata (512byte/page)
data - ecc -data - ecc -data - ecc -data - ecc - fsoobdata (2k/page)

as this is the most efficient way to handle it.

If your chip does it different, please use the correct parts of the data
structure to implement it. 

tglx
