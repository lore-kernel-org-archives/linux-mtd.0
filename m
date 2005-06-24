Received: from mx1.sonologic.nl ([82.94.245.21])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlpeQ-00036y-CX
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 10:59:27 -0400
Received: from [127.0.0.1] (mx1.sonologic.nl [82.94.245.21])
	(authenticated bits=0)
	by mx1.sonologic.nl (8.13.3/8.13.3) with ESMTP id j5OExLnK099485
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2005 14:59:21 GMT
Message-ID: <42BC1FCB.8050003@sonologic.nl>
Date: Fri, 24 Jun 2005 16:59:23 +0200
From: Koen Martens <kmartens@sonologic.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: JEDEC / CFI questions & remarks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

We had some troubles with the MTD driver lately, when our taiwanese
hardware factory decided to use another flash chip in our devices. We
had a EN29LV400BB, now it has become the EN29LV400A. It should be
functionally compatible, but with the new chip we suddenly detect an
extra CFI device.

Now, I want to do some more debugging on this, but the new hardware is
in Taiwan and being shipped to us atm, perhaps this sounds familiar to some.

Second point: the EON clones of the original AMD chipsets have small
incompatibility in the method for reading out the manufacturer id. First
of all, a small fragment of jedec_probe.c:

static inline u32 jedec_read_mfr(struct map_info *map, __u32 base,
  struct cfi_private *cfi)
{
        map_word result;
        unsigned long mask;
        u32 ofs = cfi_build_cmd_addr(0, cfi_interleave(cfi),
cfi->device_type);
        mask = (1 << (cfi->device_type * 8)) -1;
        result = map_read(map, base + ofs);
        return result.x[0] & mask;
}


Basically, it reads some info from offset 0 relative to the start of the
flash memory. This is fine for AMD chips, which specify x00 as the (hex)
address to read out the manufacturer ID. The EON chips we use, however,
specify 100 (hex) as the offset of the manufacturer id. So what we did
here is change that first argument to cfi_build_cmd_addr from 0 to 0x100
, which should thus work on both AMD and EON chips. But who knows what
this breaks on other chip types.... So, I wonder if this should be
submitted as a patch (along with the EON chip definitions),

More general questions that come up when spending more than casual time
in the mtd driver source, is how well mantained is the jedec bit of the
mtd driver? Is anyone using this?? I do get the impression we are alone
in using this bit of the MTD driver, but i can't really believe that..

We now have several quick hacks to make it all work for our specific
case (eg. return 0; as body for cfi_probe, forcing the chip type in
jedec_probe effectivelly skipping detection), but i am one of those
idealist types that wants to fix it the right way and submit back to the
community, but a bit unsure about what course to follow.

Koen
