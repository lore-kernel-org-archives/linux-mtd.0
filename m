Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwxGc-000852-5W
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 15:24:50 +0000
Received: by ghbf11 with SMTP id f11so9134418ghb.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Aug 2012 08:24:47 -0700 (PDT)
MIME-Version: 1.0
From: peterlingoal <peterlingoal@gmail.com>
Date: Thu, 2 Aug 2012 23:24:26 +0800
Message-ID: <CAFV5biAp8__BZQmBHd8EpHD2amrycy59CR2kweEtsu2xtQ4ucA@mail.gmail.com>
Subject: expect bit flip within endurance if ECC is required?
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have some questions about minimum ECC and NAND endurance, please help me here:

My understanding of endurance is that a NAND and survive the number of
cycles of erase/write/read before any error occurs. But I am not clear
about the definition of error, is it correctable error (bit flip less
than minimum ECC) or uncorrectable error (more than minimum ECC)? For
e.g. if a NAND with endurance of 100,000 cycles and requires minimum
4bit ECC, shall I expect bit flipping (but less than 4 bits) within
the 100,000 cycles?

If my understand is correct, does it mean that the chip with same
endurance but higher minimum ECC requirement is more likely to have
bit flipping faster than the chip with same endurance but less minimum
ECC?

thanks,
Peter
