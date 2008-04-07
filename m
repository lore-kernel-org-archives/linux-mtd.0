Received: from duster.selinc.com ([12.156.93.38])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jixcw-0007QN-Ef
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 20:07:49 +0000
In-Reply-To: <1207553242.8040.48.camel@sauron>
To: dedekind@infradead.org
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
MIME-Version: 1.0
Message-ID: <OFC5391750.C1B34EBF-ON88257424.006DD52A-88257424.006E8EFD@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Mon, 7 Apr 2008 13:07:35 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Is it a secret what is your flash and what is its size? If it is NAND
> I'd recommend you to test it with Adrian's NAND tests:
> git://infradead.org/~ahunter/nand-tests.git
> 
Nope, no secret.  We're using Samsung K9WAG08U1A NAND parts in 2GiB, 4GiB, 
and 8GiB configurations.  At least we're hoping to get the 4 and 8GiB 
configurations working.  I've run into a problem in the MTD layer with the 
size field.  It's a 32-bit field which isn't big enough to store 
0x100000000 or 0x200000000 which we need for the two larger 
configurations.  Just changing it to a 64-bit field introduces problems 
with other code, so we're looking at using more than one NAND controller 
in our FPGA and concatenating the NAND chips at the MTD level.

Anyway, thanks for the tip on the NAND tests.

Bruce
