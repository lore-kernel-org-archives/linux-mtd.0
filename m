Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtF3v-0002NN-3L
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 11:13:12 +0000
Received: from leonp.plris.com (leonp.plris.com [192.168.50.57])
 by plris.com (Postfix) with ESMTP id 68712A8344
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2013 13:12:44 +0200 (IST)
From: Leon Pollak <leonp@plris.com>
To: linux-mtd@lists.infradead.org
Subject: U-Boot <-> Kernel; NAND operation proposal
Date: Wed, 18 Dec 2013 13:12:44 +0200
Message-ID: <15767373.ASaqbyTd0J@leonp.plris.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, all.

I beg your pardon ahead for possible stupidity and inconsistency of what 
I am going to say - this may be simply because of the lack of 
experience. Below is my story and proposal as the result.

During the last 2 years, my product, which is based on DM368 (ARM7 based 
TI CPU) and Micron's NAND flashes (256MiB, 2K page) behaves unstably. 
This means that some units from time to time refuse to boot for 
different reasons.

Today, after so long time and so many corrections, I can say that most 
of the problems (not all!), which lead to the unit unable to start to 
the end (to the application) where because of the incompatible modes of 
NAND operating between u-boot and kernel.

For example, in the configuration I started from, which was supplied by 
some vendor as evaluation board, u-boot was configured to use 4-bit HW 
ECC, while kernel used 1-bit SW ECC.

The OOB layouts used in both systems were different.
Also BBT were configured differently.

There were several other "small things", which combination was 
inconsistent and produced the incorrect NAND functioning, which finally 
in some cases made the unit inoperative.

--

The major issue here is that such inconsistencies are not manifested in 
some way, until the unit suddenly refuse to boot up after 2 weeks or 2 
years.

All this lead me to the following thought (very draftly):

Each NAND has the "spare free" area in the first (zero) block, which is 
used for storing CIS information. This information does not occupy all 
the block, which usually is several hundreds of kilobytes.
So, this "spare" place may be used for storing some descriptive 
information of ALL possible NAND flash and its service parameters.
I am speaking about ECC bits, Sw/HW, OOB layout, BBT layout, patter 
places, bad block marks, and everything else you can imagine.

Further, this information must be used both by u-boot and kernel. Or 
even by other components, for example, RBL/UBL in DM36x from TI.

Thanks to all who read this.
Best Regards
-- 
Leon Pollak
