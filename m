Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZewX6-0000F2-2E
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 02:45:17 +0000
Received: by padhy16 with SMTP id hy16so58319535pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 23 Sep 2015 19:44:54 -0700 (PDT)
Received: from [192.168.0.130] ([203.217.56.15])
 by smtp.gmail.com with ESMTPSA id tp6sm10415397pbc.81.2015.09.23.19.44.52
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Sep 2015 19:44:54 -0700 (PDT)
Message-ID: <1443062690.32223.70.camel@ubuntu.flightdata.com.au>
Subject: UBI on dual NAND chips
From: Nathan Williams <nathan.williams@flightdata.com.au>
To: linux-mtd <linux-mtd@lists.infradead.org>
Date: Thu, 24 Sep 2015 12:44:50 +1000
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are planning to use two 32GiB MLC NAND flash chips in a product using
a SoC FPGA with two NAND interfaces. The motivation for wanting to use
multiple NAND chips is to improve reliability, not capacity.

>From what I've read, it's possible to use UBI on a concatenated MTD.
If I have two identical chips, will these be concatenated automatically?

Is creating a single UBI volume over the two NAND chips (and using UBIFS
on it) the best way to make use of a redundant NAND chip? Would
mirroring data on a second UBI volume offer additional improvements to
data reliability?

Also, what's the current status of the "unstable bits issue"?

Thanks,
Nathan
