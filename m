Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ4Pq-0004M8-6V
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 15:29:48 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-www: Add fastmap doc
Date: Tue,  2 Oct 2012 17:29:09 +0200
Message-Id: <1349191749-5247-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add documentation on fastmap to mtd-www.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 doc/ubi.xml | 86 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 6bea323..7fe01d0 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -46,6 +46,7 @@
 		</li>
 		</ol>
 	</li>
+	<li><a href="ubi.html#L_fastmap">Fastmap</a></li>
 	<li><a href="ubi.html#L_ubidoc">More documentation</a></li>
 </ol>
 
@@ -758,8 +759,12 @@ for detailed information.</p>
 <p>Unfortunately, UBI scales linearly in terms of flash size. UBI
 initialization time linearly depends on the number of physical eraseblocks on
 the flash. This means that the larger is the flash, the more time it takes for
-UBI to initialize (i.e., to attach the MTD device). The initialization time
-depends on the flash I/O speed and (slightly) on the CPU speed, because:</p>
+UBI to initialize (i.e., to attach the MTD device).
+Note: Starting with Linux v3.7 UBI offers an optional and experimental feature,
+called "fastmap", which allows attaching in nearly constant time,
+see <a href="ubi.html#L_fastmap">Fastmap</a>.
+The initialization time depends on the flash I/O speed and (slightly) on the
+CPU speed, because:</p>
 
 <ul>
 	<li>UBI scans the MTD device when attaching - it reads the erase EC and
@@ -1170,7 +1175,82 @@ means that all data has been written to the flash media), otherwise it selects
 the PEB with lower sequence number(<i>P<sub>1</sub></i>). Of course, UBI has to
 read the LEB contents in order to check the <code>CRC-32</code> checksum.</p>
 
-
+<h2><a name="L_fastmap">Fastmap</a></h2>
+<p>
+Fastmap is an experimental and optional UBI feature, which can be enabled
+by setting CONFIG_MTD_UBI_FASTMAP to 'y'.
+Once enabled UBI evaluates the module parameter
+"fm_autoconvert". If it is set to 1 (default is 0) UBI automatically enables
+fastmap for any attached image. This means UBI creates a new internal
+volume with the fastmap data such that next time the fast attach mode can be
+used.
+In the default configuration UBI will use the information stored in this
+fastmap volume to accelerate the attach procedure.
+If you want to test fastmap, set fm_autoconvert to 1 and attach a volume.</p>
+
+<h4><a name="L_fastmap_compat">Backwards compatibility</a></h4>
+<p>The fastmap on-disk data structure makes use of delete compatible volumes,
+therefore fastmap enabled images are fully backwards compatible with UBI
+implementaions which do not support fastmap. The kernel will remove the fastmap
+volumes and continue with scanning.
+This includes not only v3.6- but also v3.7+ with this option disabled.
+</p>
+
+<h4><a name="L_fastmap_tech">Technical design</a></h4>
+
+<p>A on-disk fastmap contains all information needed to attach the whole image,
+namely all erase counter values, a list of all PEBs and their state, a list of
+all volumes and their current EBA, ...
+To avoid too much writes of the fastmap it contains also a list of PEBs which
+may have changed and need a full scan while attaching.
+This list is called "fastmap pool" and has a fixed sized, 5% of the total
+amount of PEBs. Using this technique UBI needs to write the fastmap only if the
+pool contains no free PEBs. Otherwise it would have to write the fastmap each
+time when the EBA of a volume has changed.</p>
+
+<p>A fastmap consists of a super block (also known as anchor PEB) and payload
+data which can life on any PEB.
+The anchor PEB has to be located within the first 64 PEBs on the MTD device.
+It contains pointers to the remaining PEBs which carry the actual fastmap
+data. On modern NAND chips the whole fastmap fits into a single PEB.
+Hence, the anchor PEB points to itself.
+After loading the fastmap data, UBI attach information structure is created
+from it
+
+The attach process works as follows:
+<ol>
+	<li>UBI tries to find the fastmap anchor PEB,
+	if no anchor PEB was found UBI performs  traditional full scan</li>
+	<li>It follows the pointers stored in the anchor PEB and reads
+	the fastmap payload data</li>
+	<li>Then it performs a traditional scan only on PEBs in the pool
+	instead of all PEBs</li>
+</ol>
+If UBI detects that the used fastmap is invalid or corrupted it automatically
+falls back to scanning mode and performsa full scan.
+Using a CRC32 checksum and consistency checks of the internal UBI structures
+UBI is able to detect whether a fastmap is invalid or not.
+</p>
+
+<p>
+A fastmap is written to the devices each time the fastmap pool becomes full
+(no free PEBs are available), the volume layout changes or the image is
+detached. One may wonder why writing at detach time is needed.
+if UBI would not write a new fastmap at detach time all erase counter
+modifications since the last fastmap are lost.
+</p>
+
+<h4><a name="L_fastmap_overhead">Overhead</a></h4>
+<p>Is fastmap enabled UBI will reserve enough PEBs to carry two complete
+fastmaps. In practice on modern NAND chips two PEBs are reserved for fastmap.
+</p>
+<p>
+There is also some runtime overhead, to guarantee that the new fastmap is valid
+and conistent UBI has to take care that all IO which would cause EBA changes
+are blocked while attaching. Depending on flash Chip this can take up to one
+second. Therefore, fastmap makes only sense on fast and large flash devices
+where a full scan takes too long. E.g. On 4GiB NAND chips a full scan takes
+several seconds whereas a fast attach needs less than one second.</p>
 
 <h2><a name="L_ubidoc">More documentation</a></h2>
 
-- 
1.7.11.5
