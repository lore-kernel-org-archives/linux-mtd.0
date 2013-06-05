Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uk6jq-0005pw-80
 for linux-mtd@lists.infradead.org; Wed, 05 Jun 2013 05:58:26 +0000
Received: by mail-bk0-f49.google.com with SMTP id 6so597631bkj.8
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2013 22:57:59 -0700 (PDT)
MIME-Version: 1.0
Sender: peter.crosthwaite@petalogix.com
Date: Wed, 5 Jun 2013 15:57:59 +1000
Message-ID: <CAEgOgz6jjh9-G6PmzrjJcG7LKCnh4cAooSnCiZ9cmz_qUs8AXg@mail.gmail.com>
Subject: [RFC] Micron M25P80 Part name variants
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Liming Wang <walimisdev@gmail.com>, linux-kernel@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>, linux-mtd@lists.infradead.org,
 Ed Maste <emaste@freebsd.org>, suneelg@xilinx.com
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

For micron M25P80 parts there is a mix of naming conventions in the
device table:

        /* Micron */
        { "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
        { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
        { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
        { "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },

n25q128 has a11 and a13 variants, while 256 does not. Should this be
consistent across parts? If so should we adopt Liming Wangs "axx"
precedent universally? Here is a hunk from Ed Maste that applies the
relevant change to QEMU (currently on list) that would be nice to
merge. Can we fix this Linux side in similar fashion?

     /* Micron */
-    { INFO("n25q032a",    0x20bb16,      0,  64 << 10,  64, ER_4K) },
-    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
-    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },
-    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
+    { INFO("n25q032a11",  0x20bb16,      0,  64 << 10,  64, ER_4K) },
+    { INFO("n25q032a13",  0x20ba16,      0,  64 << 10,  64, ER_4K) },
+    { INFO("n25q064a11",  0x20bb17,      0,  64 << 10, 128, ER_4K) },
+    { INFO("n25q064a13",  0x20ba17,      0,  64 << 10, 128, ER_4K) },
+    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, ER_4K) },
+    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, ER_4K) },
+    { INFO("n25q256a11",  0x20bb19,      0,  64 << 10, 512, ER_4K) },
+    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K) },

Regards,
Peter
