Received: from dns.chez-thomas.org ([63.225.98.241]
	helo=hermes.chez-thomas.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6Yu8-0001UC-Pw
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 18:12:16 +0100
From: Gary Thomas <gary@mlbassoc.com>
To: j.murali@gdatech.co.in
In-Reply-To: <200310060645.BAA09508@lists.linuxppc.org>
References: <200310060645.BAA09508@lists.linuxppc.org>
Message-Id: <1065460247.1884.188.camel@hermes>
Mime-Version: 1.0
Date: 06 Oct 2003 11:10:47 -0600
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: linuxppc embedded <linuxppc-embedded@lists.linuxppc.org>
Subject: Re: cfi probe for two different flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-10-06 at 00:20, J.Murali wrote:
> hi all,
> 
> i am working on a custom board(Redwood6) using IBM ppc 405. I am using
> the Montavista's kernel 2.4.17. We have one AMD flash of 4 MB and one
> Intel flash of 16 MB on our board. There are 4 mtd partitions are in AMD
> and Intel flash is used as storage space of 5 mtd partition.
> 
> AMD partitions
> -----------------
> 1. Bootparams
> 2. Bootldr
> 3. kernel
> 4. Filesystem1
> 
> Intel partition
> --------------
> 5. Filesystem2
> 
> In the CFI probe, the kernel detects only one flash either AMD or INTEL
> (Which address we specify as window address). What i have to to do for
> cfi to detect both flash devices.
> 
> Any suggestions are appreciated
> 

This question would be best asked of the MTD folks (cc'd), but I think
you'll need a customized "map" function that recognizes these two FLASH
device types and creates the appropriate MTD sub-devices appropriately.

-- 
Gary Thomas <gary@mlbassoc.com>
MLB Associates
