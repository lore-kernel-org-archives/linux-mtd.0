From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pouillon <nipo@ssji.net>
In-Reply-To: <20041001154617.163cc484.nipo@ssji.net>
References: <20041001154617.163cc484.nipo@ssji.net>
Content-Type: text/plain
Message-Id: <1096639064.30942.477.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 01 Oct 2004 14:57:45 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Issues with a Doc Milplus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-01 at 15:46 +0200, Nicolas Pouillon wrote:
> 1/ Doc is mapped to mem address 0x0, in docprobe.c there is an
> expression like: 
> if (doc_config_location) {
> 	[probe at specified address]
> } else {
> 	[probe hardlisted addresses]
> }
> 
> So it never probes for my chip at 0. I noticed the same construct is
> present in newer probing routines.
> Is there a special way of declaring a chip at 0x0 ?

Hmmm. We should probably use -1 for 'unconfigured' instead of zero. Want
to provide a patch accordingly?

> 2/ It was not known by nan_ids, I had to add the following line:
> {"NAND 64MiB 3,3V", 0xa5, 26, 0x4000, 0},

Are you sure that's a 64MiB chip?

> 3/ It seems to be detected twice, it should be 64MiB total, and there is
> physically one chip on the board.
> Could one chip be virtually two 32MiB chips ?

I think that might actually be the case for the 64MiB DiskOnChip M+,
yes.

> 4/ Using arm part in doc2000.h which is:
> #define ReadDOC_(adr, reg)      ((unsigned char)(*(volatile __u32
> *)(((unsigned long)adr)+((reg)<<2)))) 
> #define WriteDOC_(d, adr, reg) do{ *(volatile __u32 *)(((unsigned
> #long)adr)+((reg)<<2)) = (__u32)d; wmb();} while(0)
> 
> makes the machine crash, I have to use readb/writeb in order to make the
> device work.

If provide that in 'diff -u' form we can change that too.

-- 
dwmw2
