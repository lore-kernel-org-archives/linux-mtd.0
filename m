Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyrCS-0001GE-Vf
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 01:06:17 +0000
Received: by pabfh17 with SMTP id fh17so26729498pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 17:05:56 -0800 (PST)
Date: Tue, 17 Nov 2015 17:05:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Wang YanQing <udknight@gmail.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, fransmeulenbroeks@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: mtd: improve nand_ecc.txt for readability
 and correctness
Message-ID: <20151118010553.GA140706@google.com>
References: <20151029163632.GA2175@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151029163632.GA2175@udknight>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 30, 2015 at 12:36:33AM +0800, Wang YanQing wrote:
> This patch correct some representation errors, add a little
> clarification in some places, and fix indentation problems
> for pseudo code.
> 
> It also delete one more white space for one place.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Applied to l2-mtd.git, with the following diff squashed in.

I don't believe these particular phrases have anything to do with
endianness, although the algorithm does swap a few things differently
depending on the host CPU endianness.

diff --git a/Documentation/mtd/nand_ecc.txt b/Documentation/mtd/nand_ecc.txt
index ccb1f260828c..f8c3284bf6a7 100644
--- a/Documentation/mtd/nand_ecc.txt
+++ b/Documentation/mtd/nand_ecc.txt
@@ -273,9 +273,9 @@ byte. A quick analysis:
 for the column parity we use the par variable. When extending to 32 bits
 we can in the end easily calculate rp0 and rp1 from it.
 (because par now consists of 4 bytes, contributing to rp1, rp0, rp1, rp0
-respectively, from MSB to LSB in little endian mode)
+respectively, from MSB to LSB)
 also rp2 and rp3 can be easily retrieved from par as rp3 covers the
-first two MSBs and rp2 covers the last two LSBs in little endian mode.
+first two MSBs and rp2 covers the last two LSBs.
 
 Note that of course now the loop is executed only 64 times (256/4).
 And note that care must taken wrt byte ordering. The way bytes are
@@ -387,7 +387,7 @@ Analysis 2
 
 The code (of course) works, and hurray: we are a little bit faster than
 the linux driver code (about 15%). But wait, don't cheer too quickly.
-THere is more to be gained.
+There is more to be gained.
 If we look at e.g. rp14 and rp15 we see that we either xor our data with
 rp14 or with rp15. However we also have par which goes over all data.
 This means there is no need to calculate rp14 as it can be calculated from
