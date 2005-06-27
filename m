Received: from mx1.sonologic.nl ([82.94.245.21])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DmpCO-0001Ex-68
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 04:42:37 -0400
Received: from [127.0.0.1] (mx1.sonologic.nl [82.94.245.21])
	(authenticated bits=0)
	by mx1.sonologic.nl (8.13.3/8.13.3) with ESMTP id j5R8gVcM091756
	for <linux-mtd@lists.infradead.org>; Mon, 27 Jun 2005 08:42:32 GMT
Message-ID: <42BFBBFA.5040005@sonologic.nl>
Date: Mon, 27 Jun 2005 10:42:34 +0200
From: Koen Martens <gmc@sonologic.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42BC1FCB.8050003@sonologic.nl>
In-Reply-To: <42BC1FCB.8050003@sonologic.nl>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: Re: JEDEC / CFI questions & remarks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Koen Martens wrote:
> Second point: the EON clones of the original AMD chipsets have small
> incompatibility in the method for reading out the manufacturer id. First
> of all, a small fragment of jedec_probe.c:
> 
> static inline u32 jedec_read_mfr(struct map_info *map, __u32 base,
>   struct cfi_private *cfi)
> {
>         map_word result;
>         unsigned long mask;
>         u32 ofs = cfi_build_cmd_addr(0, cfi_interleave(cfi),
> cfi->device_type);
>         mask = (1 << (cfi->device_type * 8)) -1;
>         result = map_read(map, base + ofs);
>         return result.x[0] & mask;
> }
> 
> 
> Basically, it reads some info from offset 0 relative to the start of the
> flash memory. This is fine for AMD chips, which specify x00 as the (hex)
> address to read out the manufacturer ID. The EON chips we use, however,
> specify 100 (hex) as the offset of the manufacturer id. So what we did
> here is change that first argument to cfi_build_cmd_addr from 0 to 0x100
> , which should thus work on both AMD and EON chips. But who knows what
> this breaks on other chip types.... So, I wonder if this should be
> submitted as a patch (along with the EON chip definitions),

Actually, wouldn't it be better to put this address in the struct that
defines the chip, just as the unlock addresses are..??

koen

-- 
K.F.J. Martens, Sonologic, http://www.sonologic.nl/
Networking, hosting, embedded systems, unix, artificial intelligence.
Public PGP key: http://www.metro.cx/pubkey-gmc.asc
Wondering about the funny attachment your mail program
can't read? Visit http://www.openpgp.org/
