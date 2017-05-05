Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6d4P-0005Aw-MD
 for linux-mtd@lists.infradead.org; Fri, 05 May 2017 13:15:00 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 3wKC6D6HLgz1r6N8
 for <linux-mtd@lists.infradead.org>; Fri,  5 May 2017 15:14:28 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 3wKC6D60VQz3j37m
 for <linux-mtd@lists.infradead.org>; Fri,  5 May 2017 15:14:28 +0200 (CEST)
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id XHQT9lIOzQOV for <linux-mtd@lists.infradead.org>;
 Fri,  5 May 2017 15:14:27 +0200 (CEST)
Received: from jawa (89-77-92-62.dynamic.chello.pl [89.77.92.62])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <linux-mtd@lists.infradead.org>; Fri,  5 May 2017 15:14:27 +0200 (CEST)
Date: Fri, 5 May 2017 15:14:25 +0200
From: Lukasz Majewski <lukma@denx.de>
To: linux-mtd@lists.infradead.org
Subject: SW ECC - double bit flip detection on old NAND devices
Message-ID: <20170505151425.4350ea69@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

I've a problem with pretty old Flash NAND memory (Samsung 128Mx8) [1]

It doesn't support On-Chip ECC - one needs to calculate ECC manually.

The Yaffs2 FS (for this version) uses "1bit correction
ECC" (yaffs_ecc.c). It calculates ECC for 256 bytes -> we have got 22
bits for ECC (rounded up to 3 bytes).

For 2048 bytes page we do have 8 such ECC blocks -> 24 ECC bytes in
total in OOB.

This code (as noted in yaffs_ecc.* header) is able to correct one
single bit flip.

I've also looked into Linux kernel code for SW ECC calculation:

http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/nand_ecc.c#L523

And here it is also explicitly said that we can correct one bit in such
chunk.

Please correct me if I'm wrong but when we have two bit-flips in such
256 bytes chunk, the ECC will be still correct and such obviously
broken page will not be "retired".

What one can do to prevent such situation? 

My idea, if the above holds, would be to implement better ECC scheme as
proposed in "Error Correction Code (ECC) in Micron" doc [2].

Maybe somebody knows better/simpler solution?


Side note: newer NANDs support On-Chip ECC with algorithms allowing
correction of up to 4 bits in 512B chunks of data.


[1] -
http://www.sst-ic.com/File/Seriea/PDF/100923163334f47b2ce6-13b7-43d0-9b8c-ec1c75ca2c6f.pdf
[2] -
https://www.micron.com/~/media/documents/products/technical-note/nand-flash/tn2963_ecc_in_slc_nand.pdf

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
