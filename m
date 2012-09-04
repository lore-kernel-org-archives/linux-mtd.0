Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8tc7-0007rU-97
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 13:56:24 +0000
Received: by wgbdt14 with SMTP id dt14so3557122wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2012 06:56:19 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [MTD website] UBI: now we reserve 20/1024 PEB for bad block handling
Date: Tue,  4 Sep 2012 15:56:09 +0200
Message-Id: <1346766969-13490-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 doc/ubi.xml |   84 +++++++++++++++++++++++++++++++++--------------------------
 faq/ubi.xml |    9 ++++--
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index dea14e6..90a9508 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -516,9 +516,10 @@ amount of flash space available for UBI users. Namely:</p>
 	<li>1 PEB is reserved for wear-leveling purposes;</li>
 	<li>1 PEB is reserved for the
 	<a href="ubi.html#L_lebchange">atomic LEB change</a> operation;</li>
-	<li>some amount of PEBs is reserved for bad PEB handling; this is
-	applicable for NAND flash, but not for NOR flash; the percentage of
-	reserved PEBs is configurable and is 2% by default;</li>
+	<li>some <a href="ubi.html#L_max_beb">amount of PEBs</a> is reserved
+	for bad PEB handling; this is applicable for NAND flash, but not for
+	NOR flash; the amount of reserved PEBs is configurable and is equal
+	to 20 blocks per 1024 blocks by default;</li>
 	<li>UBI stores the EC and VID
 	<a href="ubi.html#L_ubi_headers">headers</a> at the beginning of each
 	PEB; the amount of bytes used for these purposes depends on the flash
@@ -528,13 +529,17 @@ amount of flash space available for UBI users. Namely:</p>
 <p>Lets introduce symbols:</p>
 
 <ul>
+	<li><i>W</i> - total number of physical eraseblocks on the flash
+	device (NB: the whole device, not the MTD partition);</li>
 	<li><i>P</i> - total number of physical eraseblocks on the MTD
-	device;</li>
+	partition);</li>
 	<li><i>S<sub>P</sub></i> - physical eraseblock size;</li>
 	<li><i>S<sub>L</sub></i> - logical eraseblock size;</li>
-	<li><i>B</i> - number of PEBs reserved for bad PEB handling; it is
-	2% of <i>P</i> for NAND by default, and 0 for NOR and other flash types
-	which do not have bad PEBs;</li>
+	<li><i>B<sub>B</sub></i> - number of bad blocks on the MTD partition;</li>
+	<li><i>B<sub>R</sub></i> - number of PEBs reserved for bad PEB
+	handling. it is 20 * <i>W</i>/1024 for NAND by default, and 0 for NOR
+	and other flash types which do not have bad PEBs;</li>
+	<li><i>B</i> - MAX(<i>B<sub>R</sub></i>,<i>B<sub>B</sub></i>);</li>
 	<li><i>O</i> - the overhead related to storing EC and VID headers in
 	bytes, i.e. <i>O</i> = <i>S<sub>P</sub></i> - <i>S<sub>L</sub></i>.</li>
 </ul>
@@ -564,6 +569,9 @@ different for different flashes:</p>
 	64 bytes aligned to the min. I/O unit size if the min. I/O unit size
 	is less than 64 bytes.</li>
 </ul>
+<p>N.B.: the formula above counts bad blocks as a UBI overhead. The <i>real</i>
+UBI overhead is: (<i>B</i> - <i>B<sub>B</sub></i> + 4) * <i>S<sub>P</sub></i> +
+<i>O</i> * (<i>P</i> - <i>B</i> - 4)</p>
 
 
 
@@ -833,44 +841,46 @@ UBI.</p>
 
 
 
-<h2><a name="L_autoresize">Volume auto-resize</a></h2>
+<h2><a name="L_max_beb">Reserved blocks for bad block handling (only for NAND chips)</a></h2>
 
 <p>It is well-known that NAND chips have some amount of physical eraseblocks
-marked as bad by the manufacturer. The bad PEBs are distributed randomly
-and their number is different, although manufacturers usually guarantee that
+marked as bad by the manufacturer. During the lifetime of the NAND device,
+other bad blocks may appear. Although, manufacturers usually guarantee that
 the first few physical eraseblocks are not bad and the total amount of bad PEBs
-does not exceed certain number. For example, a new 256MiB Samsung OneNAND chip
-is guaranteed to have not more than 40 128KiB PEBs (but of course, more
-physical eraseblock will become bad over time). This is about 2% of flash
-size.</p>
+will not exceed certain number. For example, a 256MiB (2048 128KiB PEBs)
+Samsung OneNAND chip is guaranteed to have not more than 40 128KiB PEBs during
+its endurance lifetime. This is a very common value for NAND devices:
+20/1024 PEB, which is about 2% of flash size.</p>
+
+<p>This ratio of 20/1024 is the default number of blocks that UBI reserves for
+a UBI device. It means that if there's 2 UBI devices on a 4096 PEB NAND, 80 PEB
+for <b>each</b> UBI device will be reserved. This may appear as a waste of
+space, but as far as bad blocks can appear everywhere on the NAND flash, and
+are not equally disposed on the whole device, it's the safer way. So instead of
+using several UBI devices on a NAND flash, it's more space efficient to use only
+one UBI device and several UBI volumes.</p>
+<p>The default value of 20 PEB reserved per 1024 PEB is a kernel config option.
+For each UBI device, this value can be adjusted via a kernel parameter or an
+ubiattach parameter (since kernel 3.7).</p>
+
+
+
+
+<h2><a name="L_autoresize">Volume auto-resize</a></h2>
 
 <p>When it is needed to create an UBI image which will be flashed to the end
 user devices in production line, you should define exact sizes of all volumes
-(the sizes are stored in the UBI volume table). But it is difficult to do
-because the total flash chip size may vary depending on the amount of the
-initially bad PEBs.</p>
-
-<p>One obvious way to solve the problem is to assume the worst case, when all
-chips would have maximum amount of bad PEBs. But in practice, most of the chips
-will have only few bad PEBs which is far less than the maximum. In general, it
-is fine - this will increase reliability, because UBI anyway uses all PEBs of
-the device. On the other hand UBI anyway reserves some amount of physical
-eraseblocks for bad PEB handling which is 2% of PEBs by default. So in case of
-the above mentioned OneNAND chip the result would be that 2% of PEBs would be
-reserved by UBI, and 0-2% of PEBs would not be used (they would be seen as
-available LEBs to the UBI users).</p>
-
-<p>But there is an alternative approach - one of the volume may have the
-<b>auto-resize</b> mark, which means that its size has to be enlarged when UBI
+(the sizes are stored in the UBI volume table). But usually, in the embedded
+world, we like to have one (read only) volume for the root file system and
+one read write volume for the rest (logs, user data, etc.). If the size of the
+root file system is fixed, the size of the second one can vary from one product
+to another (different flash sizes) and we just want all space left.</p>
+
+<p>That what the auto-resize is about. If the volume has the <b>auto-resize</b>
+mark, its size will be enlarged when UBI
 is run for the first time. After the volume size is adjusted, UBI removes the
 auto-resize mark and the volume is not re-sized anymore. The auto-resize flag is
-stored in the volume table and only one volume may be marked as auto-resize.
-For example, if there is a volume which is intended to have the root
-file-system, it may be reasonable to mark it with the auto-resize flag.</p>
-
-<p>In the example with OneNAND chip, if one of the UBI volumes is be marked
-as auto-re-sized, it will be enlarged by 0-2% on the first UBI boot, but 2% of
-PEBs will anyway be reserved for bad PEB handling.</p>
+stored in the volume table and only one volume may be marked as auto-resize.</p>
 
 <p>Note, the auto-resize feature exists in the Linux kernel starting from
 version <code>2.6.25</code>.</p>
diff --git a/faq/ubi.xml b/faq/ubi.xml
index 02f8146..68aeaa4 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -459,10 +459,13 @@ must be an issue for UBI as well.</p>
 
 <h2><a name="L_bad_blocks_exceeded">What happens when the PEBs reserved for bad block handling run out?</a></h2>
 
-By default, 2% of the available PEBs are reserved for handling bad blocks.
-
+<p>By default, about 2% of the whole flash size (20/1024 PEB) are reserved for
+<a href="ubi.html#L_max_beb">handling bad blocks.</a>
 If the number of blocks that turn bad exceeds that allocation, an error
-message will be printed and UBI will switch to read-only mode.
+message will be printed and UBI will switch to read-only mode.</p>
+<p>Note: If at attach time, there's already more bad blocks than reserved PEBs,
+UBI will stay in read-write mode. The switching to read-only mode only occurs
+when a new bad block appears.</p>
 
 
 
-- 
1.7.2.5
