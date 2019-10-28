Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD705CA9EAF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 03:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6878E20679
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 03:23:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XaCgYxRg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9YonYme"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6878E20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EAVwYaB5zaeXWKaCY7alDZIBHzlMLoHwdv+hGNMayeA=; b=XaCgYxRgPNaezZ
	ffh03449TpSwiWvsWT7J6ONR2nCIzF/EXSgHp9faZaVEnqcBt6GoJE7OPE17YK+0WP7U5s9ab5uez
	3xf+NCvXKoXLiZhvAfU7roT/5Cg3RVjYT6jRMxdqChyY6W7nAumD1Tr9t0k2UwVsJtmnvqCHGJnaa
	5r+dtIpfDUCS3IsUVF8bZjXX8SNGy95vMfCZ5msKUglPsggOkQ83v2P0KUvil2aWsYGoCRbjXaPLk
	lJpGz1hgnVSLfdgQfgvljMrSIYSyXbB1fmlJCr0VTrJ6gFqgWjbaggQY/5/1shBNsyefgJ106IRvG
	i0RSNKrfmW+7ouZAV2SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOvcc-00022s-9M; Mon, 28 Oct 2019 03:23:10 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOvcT-00021u-C7
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 03:23:08 +0000
Received: by mail-qk1-x732.google.com with SMTP id g21so7211654qkm.11
 for <linux-mtd@lists.infradead.org>; Sun, 27 Oct 2019 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sar/VxEJKZUIxoWxmiJVx6So1g/T7noFLR4J5UhBjbY=;
 b=d9YonYmez2wCxM/YfeF0dMSsxP/RBJLalSnUzco5/sxjHWviIWe5rBkIsoeehH49M2
 acUm0QAGqq4fyAAq8WojQMZmj/r/CCJXKBkINXJOkn3TbgGj0gJvT2iMVSZFIa49XElU
 BATDQgX+SoKLr45QCno0QdQWxER731xBe7D8UO0VWPq7vvTB7yHxNeuOsc0HUcqYIsX5
 rbI+5EqD+yxsK9X6BY3/66itdoz5+pqmeqcDu8jEdQELLUPx+qLnW2zd+P1yP8+FCjze
 bDy0XE+R3myI602cr01NgNmytWFbU13q+zvl4JiBwzK0z2y5CL8B5YXkzMsDogbB3sAw
 VgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sar/VxEJKZUIxoWxmiJVx6So1g/T7noFLR4J5UhBjbY=;
 b=KlrUJ1QrtJ8REAQ5TijjMDJwRAr8Zf71WkhBQEVwwOQ3hMIqmkyzxpEIrNd3MJHtQD
 AFd6Hi3yS9+di892khnnGWJkoQc/k0VeU3CTMZH/AVOFzf4JJdCH81vyaa8iYkCujn0e
 ZBFc/n5V/Q0ikreFY7Lk5lhL6QcPqAcjYRjy300YZiKp9YyDK5nSTgxEkoD88aUybEo+
 6PIr+Lv6R6ceiLjSHUGM3BprkEjUWteHA4bB9NIi0W0AGaPdX53BGFuvBlVeviIFWL+r
 bv4R7kWC0577jjpTGrAd/a9AN7yT6Rf2LLVDVxT5d1+9FLpwf44w9tvQh6QS9sQqwOJz
 lDbg==
X-Gm-Message-State: APjAAAVQHJRvC2Z018vysuBVlXhPNBj5R5pGVLKRezx+wy3kM+027GFX
 zXOKKFJx0l2X31OKBJe5DZDE8vW7
X-Google-Smtp-Source: APXvYqxHivdf0/qbFcSodcvhWVgneDeRdeUlZZ03MfXqc0PsrCjjHsZ6MWEilvh7+7H5v3X65URlaA==
X-Received: by 2002:a37:a283:: with SMTP id
 l125mr14300599qke.298.1572232974520; 
 Sun, 27 Oct 2019 20:22:54 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
 by smtp.gmail.com with ESMTPSA id t58sm5963812qta.78.2019.10.27.20.22.50
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Oct 2019 20:22:52 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][mtd-www] ubi.xml: many wording and spelling cleanups
Date: Sun, 27 Oct 2019 23:22:08 -0400
Message-Id: <20191028032208.19298-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.23.0.37.g745f681289
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_202301_520861_A7139821 
X-CRM114-Status: GOOD (  23.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 doc/ubi.xml | 913 ++++++++++++++++++++++++++--------------------------
 1 file changed, 450 insertions(+), 463 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index f20e1aa..568a66e 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -1,6 +1,5 @@
 <PAGE>
 <VAR match="VAR_ORIGIN" replace="../" />
-<VAR match="VAR_CVSID" replace="Last updated: 13 Jan 2009, dedekind"/>
 <INCLUDE file="../inc/header.tmpl" />
 
 <VAR match="VAR_SEL_DOC" replace="selected" />
@@ -16,7 +15,7 @@
 	<li><a href="ubi.html#L_rednote">Big red note</a></li>
 	<li><a href="ubi.html#L_overview">Overview</a></li>
 	<li><a href="ubi.html#L_powercut">Power-cuts tolerance</a></li>
-	<li><a href="ubi.html#L_source">Source code</a></li>
+	<li><a href="ubi.html#L_source">Kernel source code</a></li>
 	<li><a href="ubi.html#L_ml">Mailing list</a></li>
 	<li><a href="ubi.html#L_usptools">User-space tools</a></li>
 	<li><a href="ubi.html#L_ubi_headers">UBI headers</a></li>
@@ -57,8 +56,8 @@
 
 <h2><a name="L_rednote"><font color="red">Big red note</font></a></h2>
 
-<p>People are often confused about what UBI is, which was the reason for
-creating this section. Please, realize that:</p>
+<p>People are often confused about UBI, which is why this section was created.
+Please, realize that:</p>
 
 <ul>
 	<li>UBI is <b>not</b> a Flash Translation Layer (FTL), and it has
@@ -74,7 +73,7 @@ creating this section. Please, realize that:</p>
 
 <p>Please, do not be confused. Read <a
 href="ubifs.html#L_raw_vs_ftl">here</a> for more information about how
-raw flash devices are different to FTL devices.</p>
+raw flash devices are different from FTL devices.</p>
 
 
 
@@ -89,68 +88,70 @@ wear-leveling) across whole flash chip.</p>
 (<a href="http://sources.redhat.com/lvm2/">LVM</a>).
 Whereas LVM maps logical sectors to physical sectors, UBI maps logical
 eraseblocks to physical eraseblocks. But besides the mapping, UBI implements
-global wear-leveling and transparent I/O errors handling.</p>
+global wear-leveling and transparent error handling.</p>
 
 <p>An UBI volume is a set of consecutive <i>logical eraseblocks</i>
-(<i>LEBs</i>). Each logical eraseblock may be mapped to any physical eraseblock
-(<i>PEB</i>). This mapping is managed by UBI, it is hidden from users and it is
-the base mechanism to provide global wear-leveling (along with per-physical
-eraseblock erase counters and the ability to transparently move data from more
-worn-out physical eraseblocks to less worn-out ones).</p>
-
-<p>UBI volume size is specified when the volume is created and may later be
+(<i>LEBs</i>). Each logical eraseblock is dynamically mapped to a physical
+eraseblock (<i>PEB</i>). This mapping is managed by UBI and is hidden from
+users and higher-level software. UBI is the base mechanism which provides
+global wear-leveling, per-physical eraseblock erase counters, and the
+ability to transparently move data from more worn-out physical eraseblocks
+to less worn-out ones.</p>
+
+<p>The UBI volume size is specified when a volume is created, but may later be
 changed (volumes are dynamically re-sizable). There are
 <a href="ubi.html#L_usptools">user-space tools</a> which may be used to
 manipulate UBI volumes.</p>
 
-<p>There are 2 types of UBI volumes - <i>dynamic</i> volumes and <i>static</i>
+<p>There are 2 types of UBI volumes: <i>dynamic</i> volumes and <i>static</i>
 volumes. Static volumes are read-only and their contents are protected by
 <code>CRC-32</code> checksums, while dynamic volumes are read-write and the
 upper layers (e.g., a file-system) are responsible for ensuring data
 integrity.</p>
 
-<p>UBI is aware of bad eraseblocks (e.g., NAND flash may have them) and frees
-the upper layers from any bad block handling. UBI has a pool of reserved physical
-eraseblocks, and when a physical eraseblock becomes bad, it transparently
-substitutes it with a good physical eraseblock. UBI moves good data from the
-newly appeared bad physical eraseblocks to good ones. The result is that users
-of UBI volumes do not notice I/O errors as UBI takes care of them.</p>
-
-<p>NAND flashes may have bit-flips which occur on read and write operations.
-Bit-flips are corrected by ECC checksums, but they may accumulate over
-time and cause data loss. UBI handles this by moving data from physical
-eraseblocks which have bit-flips to other physical eraseblocks. This process is
-called <b>scrubbing</b>. Scrubbing is done transparently in background and is
-hidden from upper layers.</p>
-
-<p>Here is a short list of the main UBI features:</p>
+<p>UBI is aware of bad eraseblocks (i.e. portions of flash which wear
+out over time) and frees upper-level software from having to handle bad
+eraseblocks itself. UBI has a pool of reserved physical eraseblocks, and
+when a physical eraseblock becomes bad, it transparently substitutes
+it with a good physical eraseblock. UBI moves the data from newly
+discovered bad physical eraseblocks to good ones. The result is that users
+of UBI volumes do not notice I/O errors since UBI takes care of them
+transparently.</p>
+
+<p>NAND flashes are also susceptible to bit-flip errors which occur on read
+and write operations. Bit-flips are corrected by ECC checksums, but they
+may accumulate over time and cause data loss. UBI handles this by moving
+data from physical eraseblocks which have bit-flips to other physical
+eraseblocks. This process is called <b>scrubbing</b>. Scrubbing is done
+transparently in the background and is hidden from upper layers.</p>
+
+<p>Here is a short list of UBI's main features:</p>
 <ul>
 	<li>UBI provides volumes which may be dynamically created, removed, or
 	re-sized;</li>
-	<li>UBI implements wear-leveling across whole flash device (i.e., you
-	may continuously write/erase only one logical eraseblock
-	of an UBI volume, but UBI will spread this to all physical
+	<li>UBI implements wear-leveling across the entire flash device (i.e.,
+	you might think you're continuously writing/erasing the same logical
+	eraseblock of an UBI volume, but UBI will spread this to all physical
 	eraseblocks of the flash chip);</li>
 	<li>UBI transparently handles bad physical eraseblocks;</li>
-	<li>UBI minimizes chances to lose data by means of scrubbing.</li>
+	<li>UBI minimizes the chances of losing data by means of scrubbing.</li>
 </ul>
 
 <p>Here is a comparison of MTD partitions and UBI volumes. They are somewhat
-because:</p>
+similar because:</p>
 <ul>
-	<li>both consist of eraseblocks - logical eraseblocks in case of UBI
-	volumes, and physical eraseblocks in case of MTD partitions;</li>
-	<li>both support three basic operations - read, write, and erase.</li>
+	<li>both consist of eraseblocks - logical eraseblocks in the case of UBI
+	volumes, and physical eraseblocks in the case of MTD partitions;</li>
+	<li>both support three basic operations: read, write, and erase.</li>
 </ul>
 
 <p>But UBI volumes have the following advantages over MTD partitions:</p>
 <ul>
-	<li>UBI volumes have no eraseblock wear-leveling constraints, so users
-	do not have to care about this at all, which means the upper level
-	software may be simpler;</li>
+	<li>UBI implements wear-leveling, so users do not have to care about
+	this at all, which means the upper level software may be simpler;</li>
 
-	<li>UBI volumes have no bad eraseblocks, which also leads to simpler
-	upper level software;</li>
+	<li>UBI handles bad eraseblocks, which also leads to simpler
+	upper-level software;</li>
 
 	<li>UBI volumes are dynamic in a sense that they may be created, removed
 	or re-sized dynamically, while MTD partitions are static;</li>
@@ -163,16 +164,16 @@ because:</p>
 	and recover;</li>
 
 	<li>UBI provides an <a href="ubi.html#L_lebchange">atomic logical
-	eraseblock change</a> operation which allows to change the contents of
+	eraseblock change</a> operation which allows changing the contents of
 	a logical eraseblock without loosing the data if an unclean reboot
-	happens during the operation; this is might be very useful for the
+	happens during the operation; this might be very useful for the
 	upper-level software (e.g., for a file-system);</li>
 
 	<li>UBI has an <a href="ubi.html#L_unmap">un-map</a> operation, which
 	just un-maps a logical eraseblock from the physical eraseblock,
-	schedules the physical eraseblock for erasure and returns; this is very
+	schedules the physical eraseblock for erasure, and returns; this is very
 	quick and frees upper level software from implementing their own
-	mechanisms to defer erasures (e.g., JFFS2 has to implements such
+	mechanisms to defer erasures (e.g., JFFS2 has to implement such
 	mechanisms).</li>
 </ul>
 
@@ -197,30 +198,15 @@ technology imposes.</p>
 <p>UBI has an internal debugging infrastructure that can emulate power
 failures for testing. The advantage of the emulation is that it emulates
 power failures at the critical points where control data structures are
-written to the device whereas the probability of interrupting the system at
-those precise moments with physical power cut testing is rather low.</p>
-
-<h2><a name="L_source">Source code</a></h2>
-
-<p>UBI is in the main-line Linux kernel starting from version
-<code>2.6.22</code>. But it is recommended to use the latest UBI, because we
-have fixed many bugs since that time, made many improvements and added new
-features. The UBI git tree may be found at:</p>
+written to the device, whereas the probability of interrupting the system at
+those precise moments with physical power-cut testing is rather low.</p>
 
-<code>git://git.infradead.org/ubi-2.6.git</code>
+<h2><a name="L_source">Kernel source code</a></h2>
 
-<p><a href="http://git.infradead.org/ubi-2.6.git">Here</a> is the
-corresponding Git-web view.</p>
-
-<p>The git tree has 2 branches - the <code>master</code> branch and
-<code>linux-next</code> branches. The <code>master</code> branch contains the
-most recent stuff which is often incomplete, buggy, or has not been tested very
-well. This branch is re-based from time to time. Please, do not use it unless
-you are an UBI developer. The <code>linux-next</code> branch contains stable
-UBI changes which are going to be merged upstream soon. This branch is included
-to the <a href="http://linux.f-seidel.de/linux-next/">linux-next</a>
-git tree. Please, use this branch unless you are an UBI developer.</p>
+<p>UBI has been added to the main-line Linux kernel since version
+<code>2.6.22</code>. The UBI git tree may be found at:</p>
 
+<code>https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git/</code>
 
 
 <h2><a name="L_ml">Mailing list</a></h2>
@@ -233,12 +219,11 @@ git tree. Please, use this branch unless you are an UBI developer.</p>
 <h2><a name="L_usptools">User-space tools</a></h2>
 
 <p>UBI user-space tools, as well as other MTD user-space tools, are available
-from the the following git repository:</p>
+from the following git repository:</p>
 
-<code>git://git.infradead.org/mtd-utils.git</code>
+<code>http://git.infradead.org/mtd-utils.git</code>
 
-<p>Please, clone it and compile using <code>make</code> from the root mtd-utils
-directory.  <a href="../faq/general.html#L_compile_mtd">This section</a>
+<p><a href="../faq/general.html#L_compile_mtd">This section</a>
 provides information about how to compile the whole <code>mtd-utils</code>
 repository tree. You should find the UBI tools under the <code>ubi-utils</code>
 sub-directory.</p>
@@ -248,7 +233,7 @@ sub-directory.</p>
 	<li><code>ubinfo</code> - provides information about UBI devices and
 	volumes found in the system;</li>
 	<li><code>ubiattach</code> - attaches MTD devices (which describe raw
-	flash) to UBI and creates corresponding UBI devices;</li>
+	flash) with UBI which creates corresponding UBI devices;</li>
 	<li><code>ubidetach</code> - detaches MTD devices from UBI
 	devices (the opposite to what <code>ubiattach</code> does);</li>
 	<li><code>ubimkvol</code> - creates UBI volumes on UBI devices;</li>
@@ -268,12 +253,12 @@ sub-directory.</p>
 	found in the system.</li>
 </ul>
 
-<p>All UBI tools support "-h" option and print sufficient usage
+<p>All UBI tools support an "-h" option which prints basic usage
 information.</p>
 
 <p>Note, the <code>ubiattach</code> and <code>ubidetach</code> tools won't work
 if the kernel version is less than <code>2.6.25</code>, because corresponding
-UBI features did not exist in the older kernels.</p>
+UBI features did not exist in these older kernels.</p>
 
 
 
@@ -284,71 +269,71 @@ eraseblock:</p>
 
 <ul>
 	<li><b>erase counter header</b> (or <b>EC header</b>) which contains
-	the erase counter of the physical eraseblock (PEB) plus some other not
-	so important information;</li>
+	the erase counter of the physical eraseblock (PEB) plus other
+	information;</li>
 
 	<li><b>volume identifier header</b> (or <b>VID header</b>) which stores
-	volume ID and logical eraseblock (LEB) number this PEB belongs to (plus
-	some other not so important information).</li>
+	the volume ID and the logical eraseblock (LEB) number to which this PEB
+	belongs.</li>
 </ul>
 
 <p>This is why logical eraseblocks are smaller than physical eraseblock - the
 headers take some flash space.</p>
 
-<p>All UBI headers are protected by the <code>CRC-32</code> checksum. Please,
-refer the <code>drivers/mtd/ubi/ubi-media.h</code> file in the linux kernel for
+<p>All UBI headers are protected by a <code>CRC-32</code> checksum. Please,
+refer to the <code>drivers/mtd/ubi/ubi-media.h</code> file in the linux kernel for
 more information about the header's contents.</p>
 
 <p>When UBI attaches an MTD device, it has to scan it, read all headers,
 check the <code>CRC-32</code> checksums, and store erase counters and the
-logical-to-physical eraseblock mapping information in RAM. Please, refer
+logical-to-physical eraseblock mapping information in RAM. Please, refer to
 <a href="ubi.html#L_scalability">this</a> section for information about
 scalability issues related to this.</p>
 
-<p>After UBI has erased a PEB, it writes the EC header with increased erase
-counter value. This means that PEBs always have the EC header, except for the
-short period of time after the erasure and before the EC header is written.
-Should an unclean reboot happen during this short period of time, the EC header
-is lost or becomes corrupted. In this case UBI writes new EC header with an
+<p>After UBI has erased a PEB, it increments the erase counter value and writes it
+to the EC header. This means that PEBs always have a valid EC header, except for
+the short period of time after the erasure and before the EC header is written.
+Should an unexpected reboot happen during this short period of time, the EC header
+is lost or becomes corrupted. In this case UBI writes a new EC header with an
 average erase counter just after the MTD device scanning is done.</p>
 
 <p>The VID header is written to the PEB when UBI associates it with an LEB.
-Let's consider what happens to the headers in case of some UBI operations.</p>
+Let's consider what happens to the headers during some UBI operations.</p>
 
 <ul>
-	<li>The <a href="ubi.html#L_unmap">LEB un-map</a> operation just un-maps
+	<li>The <a href="ubi.html#L_unmap">LEB un-map</a> operation simply un-maps
 	the LEB from the PEB and schedules the PEB for erasure. When the PEB is
-	erased, the EC header is written straight away. The VID header is not
+	erased, the EC header is written immediately. The VID header is not
 	written.</li>
 
 	<li>The <a href="ubi.html#L_map">LEB map</a> operation or a write
 	operation to an un-mapped LEB makes UBI find an appropriate PEB and
-	write the VID header to it (the EC header must already be there). Note,
-	the write operation to an already mapped LEB just writes the data
-	straight to PEB and does not change the UBI headers.</li>
+	writes the VID header to it (the EC header must already be there). Note,
+	the write operation to an already-mapped LEB just writes the data
+	straight to the PEB and does not change the UBI headers.</li>
 </ul>
 
 <p>UBI maintains two per-PEB headers because it needs to write different
-information on flash at different moments of time:</p>
+information to flash at different moments of time:</p>
 
 <ul>
-	<li>after a PEB is erased, the EC header is written straight away,
+	<li>after a PEB is erased, the EC header is written immediately,
 	which minimizes the probability of losing the erase counter due to
-	unclean reboots;</li>
+	unexpected reboots;</li>
 
 	<li>when UBI associates a PEB with an LEB, the VID header is written
 	to the PEB.</li>
 </ul>
 
 <p>When the EC header is written to a PEB, UBI does not yet know the volume ID
-and LEB number this PEB will be associated with. This is why UBI needs to do
+nor the LEB number to which this PEB will be associated. This is why UBI needs to do
 two separate write operations and to have two separate headers.</p>
 
 
 
 <h2><a name="L_vol_table">UBI volume table</a></h2>
 
-<p><b>Volume table</b> is an on-flash data structure which contains information
+<p>The <b>volume table</b> is an on-flash data structure which contains information
 about each volume on this UBI device. The volume table is an array of <b>volume
 table records</b>. Each record contains the following information:</p>
 
@@ -357,36 +342,36 @@ table records</b>. Each record contains the following information:</p>
 	<li>volume name;</li>
 	<li>volume type (dynamic or static);</li>
 	<li>volume alignment;</li>
-	<li><a href="ubi.html#L_volupdate">update marker</a> (set for volumes
-	which had interrupted updates;</li>
+	<li><a href="ubi.html#L_volupdate">update marker</a> (set on a volume
+	when an update is initiated and cleared when successfully completed);</li>
 	<li><a href="ubi.html#L_autoresize">auto-resize</a> flag;</li>
 	<li><code>CRC-32</code> checksum for this record.</li>
 </ul>
 
-<p>Each record describes one UBI volume and record index in the volume table
-array corresponds to the volume ID. I.e, UBI volume 0 is described by record 0
-in the volume table, and so on. Count of records in the volume table is limited
-by the LEB size, but cannot be greater than 128. This means that UBI devices
-cannot have more than 128 volumes.</p>
+<p>Each record describes one UBI volume. The record index in the volume table
+array corresponds to the volume ID it describes. I.e, UBI volume 0 is described
+by record 0 in the volume table, and so on. The total number of records in the
+volume table is limited by the LEB size, and cannot be greater than 128. This
+means that UBI devices cannot have more than 128 volumes.</p>
 
 <p>Every time an UBI volume is created, removed, re-sized, re-named or updated,
 the corresponding volume table record is changed. UBI maintains two copies of
-the volume for reliability and power-cut tolerance reasons.</p>
+the volume table for reasons of reliability and power-cut tolerance.</p>
 
 
 <h4><a name="L_vol_table_det">Implementation details</a></h4>
 
 <p>Internally, the volume table resides in a special-purpose UBI volume which
-is called <b>layout volume</b>. This volume consists of 2 LEBs - one for each
+is called the <b>layout volume</b>. This volume consists of 2 LEBs - one for each
 copy of the volume table. The layout volume is an "internal" UBI volume, and
-the users do not see it and cannot access it. When reading or writing the
+users do not see it nor access it. When reading or writing the
 layout volume, UBI uses the same mechanisms which are used for normal user
 volumes.</p>
 
-<p>UBI uses the following algorithm when updating a volume table record.</p>
+<p>UBI uses the following algorithm when updating a volume table record:</p>
 
 <ul>
-	<li>Prepare in-memory buffer with the new volume table contents.</li>
+	<li>Prepare an in-memory buffer with the new volume table contents.</li>
 	<li><a href="ubi.html#L_unmap">Un-map</a> LEB0 of the layout
 	volume.</li>
 	<li>Write the new volume table to LEB0.</li>
@@ -399,8 +384,10 @@ volumes.</p>
 <p>When attaching the MTD device, UBI makes sure that the 2 volume table copies
 are equivalent. If they are not equivalent, which may be caused by an unclean
 reboot, UBI picks the one from LEB0 and copies it to LEB1 of the layout volume
-(because it is newer). If one of the volume table copies is corrupted, UBI
-restores it from the other volume table copy.</p>
+(because, according to the algorithm specified above, LEB0 is the one that is
+updated first and therefore considered to have the most up-to-date information).
+If one of the volume table copies is corrupted, UBI restores it from the other
+volume table copy.</p>
 
 
 
@@ -411,37 +398,38 @@ flash (or MTD device) consists of eraseblocks, which may be good or bad. Each
 good eraseblock may be read from, written to, or erased. Good eraseblocks may
 also be marked as bad.</p>
 
-<p>Flash reads and writes may only be done in portions of <b>minimum
-input/output unit</b> size, which depends on flash type.</p>
+<p>Flash reads and writes may only be done in multiples of the <b>minimum
+input/output unit</b> size, which depends on the flash type.</p>
 
 <ul>
-	<li>NOR flashes usually have min. I/O unit size of 1 byte, because NOR
+	<li>NOR flashes usually have a minimum I/O unit size of 1 byte, because NOR
 	flashes usually allow reading and writing single bytes (in fact, it is
 	even be possible to change individual bits).</li>
 
-	<li>Some NOR flashes may have other min. I/O unit sizes, e.g. 16 or 32
-	bytes in case of ECC'd NOR flashes.</li>
+	<li>Some NOR flashes may have other minimum I/O unit sizes, e.g. 16 or 32
+	bytes in the case of ECC'd NOR flashes.</li>
 
-	<li>NAND flashes usually have 512, 2048 or 4096 byte min. I/O. unit
-	size, which corresponds to NAND page size. NAND flashes store per-NAND
-	page ECC codes in the OOB area, which means that whole NAND page has to
-	be written at once to calculate the ECC code, and whole NAND page has to
-	be read at once to check the ECC code.</li>
+	<li>NAND flashes usually have minimum I/O sizes of 512, 2048 or 4096 bytes,
+	which corresponds to their page size. NAND flashes store per-page
+	ECC codes in the OOB area, which means that whole NAND pages have to
+	be written at once to calculate the ECC, and whole NAND pages have to
+	be read at once to check the ECC.</li>
 </ul>
 
-<p>The min. I/O unit size is a very important characteristic of the MTD device.
+<p>The minimum I/O unit size is a very important characteristic of the MTD device.
 It affects many things, e.g.:</p>
 
 <ul>
-	<li>physical position of the <a href="ubi.html#L_ubi_headers">VID
-	header</a> depends on the min. I/O unit size, which means that LEB size
-	also depends on it; generally, the larger is the min. I/O unit size,
-	the less is LEB size, and the greater is UBI flash space overhead;</li>
-
-	<li>all writes to LEBs should be aligned to min. I/O unit size, and
-	should be multiple of the min. I/O unit size; this does not apply to
+	<li>the physical position of the <a href="ubi.html#L_ubi_headers">VID
+	header</a> depends on the minimum I/O unit size, which means that the
+	LEB size also depends on it; generally, the larger the minimum I/O unit
+	size, the smaller the LEB size, and therefore the greater the UBI flash
+	space overhead;</li>
+
+	<li>all writes to LEBs should be aligned to the minimum I/O unit size,
+	and should be multiples of the minimum I/O unit size; this does not apply to
 	reads, but bear in mind that on the MTD level all reads are done in
-	fractions of min. I/O unit size anyway; this is just hidden from users
+	multiples of the minimum I/O unit size anyway; this is just hidden from users
 	by buffering the read data and copying only the requested amount of
 	bytes to the user buffer.</li>
 </ul>
@@ -450,58 +438,57 @@ It affects many things, e.g.:</p>
 
 <h2><a name="L_subpage">NAND flash sub-pages</a></h2>
 
-<p>As it is said <a href="ubi.html#L_min_io_unit">here</a>, all UBI I/O
-should be done in fractions of min. I/O unit size, which is equivalent to NAND
-page size in case of NAND flash. However, some SLC NAND flashes allow for
-smaller I/O units, which are called <b>sub-pages</b> in MTD terminology. Not
-all NANDs have sub-pages.</p>
+<p>As <a href="ubi.html#L_min_io_unit">mentioned earlier</a>, all UBI I/O
+is be performed in multiples of the minimum I/O unit size, which is equivalent
+to the NAND device's page size (in the case of NAND flash). However, some SLC NAND
+flashes allow for smaller I/O units, which are called <b>sub-pages</b> in MTD
+terminology. Not all NAND devices have sub-pages.</p>
 
 <ul>
-	<li>MLC NANDs do not have sub-pages, at least to the date of writing
-	of this piece of documentation (April 2009).</li>
+	<li>MLC NANDs do not have sub-pages (at least as of April 2009).</li>
 	<li>SLC NANDs usually do have sub-pages. E.g., 512-byte NAND pages
 	usually consist of 2x256-byte sub-pages, and 2048-byte NAND pages
-	consist of 4x512-byte sub-pages.</li>
-	<li>SLC OneNAND chips with 2048 bytes NAND page size have 4x512-byte
+	usually consist of 4x512-byte sub-pages.</li>
+	<li>SLC OneNAND chips with 2048-byte NAND pages have 4x512-byte
 	sub-pages.</li>
 </ul>
 
-<p>If the NAND flash supports sub-pages, then what can be done is ECC codes
-can be calculated on per-sub-page basis, instead of per-NAND page basis.
-In this case it becomes possible to read and write sub-pages independently.</p>
+<p>If the NAND flash supports sub-pages, then ECC codes can be calculated on a
+per-sub-page basis, instead of a per-page basis. In this case it becomes
+possible to read and write sub-pages independently.</p>
 
-<p>But obviously, even though the NAND chip may support sub-pages, the NAND
-controller may disallow them. Indeed, if the flash is managed by a controller
-which calculates ECC codes on per-NAND page basis, then it is impossible to
-do I/O in sub-page fractions. E.g. this is the case for the
+<p>However, even though the NAND chip may support sub-pages, the NAND controller
+of your SoC might not. If the flash is managed by a controller
+which calculates ECC codes only on a per-page basis, then it is impossible to
+do I/O in sub-page chunks. E.g. this is the case for the
 <a href="http://en.wikipedia.org/wiki/OLPC_XO-1">OLPC XO-1</a> laptop) - its
 NAND chip supports sub-pages, but the NAND controller does not.</p>
 
-<p>Note, sub-page is an MTD term, but this is also referred to as "NOP" which
-stands for "number of partial programs". NOP1 NAND flashes have no sub-pages -
-UBI treats them as NANDS with sub-page size equivalent to NAND page size. NOP2
-NAND flashes have 2 sub-pages (half a NAND page each), NOP4 flashes have 4
-sub-pages (quarter of a NAND page each).</p>
-
-<p>UBI utilizes sub-pages to lessen flash space overhead. The overhead is less
-if NAND flash supports sub-pages (see <a href="ubi.html#L_overhead">here</a>).
-Indeed, let's consider a NAND flash with 128KiB eraseblocks and 2048-byte pages.
-If it does not have sub-pages, UBI puts the the VID header at physical
-offset 2048, so LEB size becomes 124KiB (128KiB minus one NAND page which stores
-the EC header and minus another NAND page which stores the VID header. In
-opposite, if the NAND flash does have sub-pages, UBI puts the VID header at
-physical offset 512 (the second sub-page), so LEB size becomes 126KiB
+<p>Note, the phrase "sub-page" is an MTD term, but this is also referred to as
+"NOP" which stands for "number of partial programs". NOP1 NAND flashes have no
+sub-pages - UBI treats them as NANDS with sub-page size equivalent to the NAND page
+size. NOP2 NAND flashes have 2 sub-pages (half a NAND page each), and NOP4
+flashes have 4 sub-pages (a quarter of a NAND page each).</p>
+
+<p>UBI utilizes sub-pages to reduce flash space overhead. This overhead is
+reduced if sub-pages can be used (see <a href="ubi.html#L_overhead">here</a>).
+Consider a NAND flash with 128KiB eraseblocks and 2048-byte pages.
+If it does not have sub-pages, UBI puts the VID header at physical
+offset 2048, so the LEB size becomes 124KiB (128KiB minus one NAND page which stores
+the EC header and minus another NAND page which stores the VID header).
+Conversely, if the NAND flash does have sub-pages, UBI puts the VID header at
+physical offset 512 (the second sub-page), so the LEB size becomes 126KiB
 (128KiB minus one NAND page which is used for storing both UBI headers). See
 <a href="ubi.html#L_header_position">this</a> section for more information
 about where the UBI headers are stored.</p>
 
-<p>Sub-pages are used by UBI only internally, and only for storing the headers.
-UBI API does not allow users doing I/O in sub-page units. One of the reasons for
+<p>Sub-pages are only used by UBI internally, and only for storing the headers.
+The UBI API does not allow users to perform I/O to sub-page units. One of the reasons for
 this is that sub-page writes may be slow. To write a sub-page, the driver may
-actually write whole NAND page, but put <code>0xFF</code> bytes to the sub-pages
-which are not relevant to this operation. E.g., this means that writing 4
-sub-pages may be 4 times slower than writing whole NAND page at once. Thus,
-UBI does use sub-pages for the headers, but this notion does not exist in the
+actually write the whole NAND page, but put <code>0xFF</code> bytes in the sub-pages
+which are not relevant to this operation. If this is the case, writing 4
+sub-pages will be 4 times slower than writing the whole NAND page at once. Thus,
+UBI does use sub-pages for the headers, but this trick does not extend to the
 UBI API.</p>
 
 
@@ -509,18 +496,18 @@ UBI API.</p>
 <h2><a name="L_hdr_pos"></a>UBI headers position</h2>
 
 <p>The EC header always resides at offset 0 and takes 64 bytes, the VID header
-resides at the next available <a href="ubi.html#L_min_io_unit">min. I/O unit</a>
+resides at the next available <a href="ubi.html#L_min_io_unit">minimum I/O unit</a>
 or <a href="ubi.html#L_subpage">sub-page</a>, and also takes 64 bytes. For
 example:</p>
 
 <ul>
-	<li>in case of NOR flash which has 1 byte min. I/O unit, the VID header
+	<li>in the case of NOR flash, which has a 1-byte minimum I/O unit, the VID header
 	resides at offset 64;</li>
 
-	<li>in case of NAND flash which does not have sub-pages, the VID header
+	<li>in the case of a NAND flash which does not have sub-pages, the VID header
 	resides at the second NAND page;</li>
 
-	<li>in case of NAND flash which has sub-pages, the VID header resides at
+	<li>in the case of a NAND flash which has sub-pages, the VID header resides at
 	the second sub-page.</li>
 </ul>
 
@@ -537,13 +524,13 @@ amount of flash space available for UBI users. Namely:</p>
 	<li>1 PEB is reserved for wear-leveling purposes;</li>
 	<li>1 PEB is reserved for the
 	<a href="ubi.html#L_lebchange">atomic LEB change</a> operation;</li>
-	<li>some <a href="ubi.html#L_max_beb">amount of PEBs</a> is reserved
-	for bad PEB handling; this is applicable for NAND flash, but not for
+	<li>some <a href="ubi.html#L_max_beb">amount of PEBs</a> are reserved
+	for bad PEB handling; this is applicable for NAND flash but not for
 	NOR flash; the amount of reserved PEBs is configurable and is equal
 	to 20 blocks per 1024 blocks by default;</li>
 	<li>UBI stores the EC and VID
 	<a href="ubi.html#L_ubi_headers">headers</a> at the beginning of each
-	PEB; the amount of bytes used for these purposes depends on the flash
+	PEB; the number of bytes used for these purposes depends on the flash
 	type and is explained below.</li>
 </ul>
 
@@ -553,13 +540,13 @@ amount of flash space available for UBI users. Namely:</p>
 	<li><i>W</i> - total number of physical eraseblocks on the flash
 	chip (NB: the entire chip, not the MTD partition);</li>
 	<li><i>P</i> - total number of physical eraseblocks on the MTD
-	partition);</li>
+	partition;</li>
 	<li><i>S<sub>P</sub></i> - physical eraseblock size;</li>
 	<li><i>S<sub>L</sub></i> - logical eraseblock size;</li>
 	<li><i>B<sub>B</sub></i> - number of bad blocks on the MTD partition;</li>
 	<li><i>B<sub>R</sub></i> - number of PEBs reserved for bad PEB
-	handling. it is 20 * <i>W</i>/1024 for NAND by default, and 0 for NOR
-	and other flash types which do not have bad PEBs;</li>
+	handling (it is 20 * <i>W</i>/1024 for NAND by default, and 0 for NOR
+	and other flash types which do not have bad PEBs);</li>
 	<li><i>B</i> - MAX(<i>B<sub>R</sub></i>,<i>B<sub>B</sub></i>);</li>
 	<li><i>O</i> - the overhead related to storing EC and VID headers in
 	bytes, i.e. <i>O</i> = <i>S<sub>P</sub></i> - <i>S<sub>L</sub></i>.</li>
@@ -571,23 +558,23 @@ i.e., this amount of bytes will not be accessible for users. <i>O</i> is
 different for different flashes:</p>
 
 <ul>
-	<li>in case of NOR flash which has 1 byte
-	<a href="ubi.html#L_min_io_unit">minimum input/output unit</a>,
+	<li>in the case of NOR flash, which has a 1-byte
+	<a href="ubi.html#L_min_io_unit">minimum I/O unit</a>,
 	<i>O</i> is 128 bytes;</li>
 
-	<li>in case of NAND flash which does not have
+	<li>in the case of a NAND flash which does not have
 	<a href="ubi.html#L_subpage">sub-pages</a> (e.g., MLC NAND), <i>O</i>
-	is 2 NAND pages, i.e. 4KiB in case of 2KiB NAND page and 1KiB in case
-	of 512 bytes NAND page;</li>
+	is 2 NAND pages, i.e. 4KiB in the case of 2KiB NAND pages and 1KiB in the case
+	of 512-byte NAND pages;</li>
 
-	<li>in case of NAND flash which has sub-pages, UBI optimizes its
+	<li>in the case of a NAND flash which has sub-pages, UBI optimizes its
 	on-flash layout and puts the EC and VID headers at the same NAND page,
 	but different sub-pages; in this case <i>O</i> is only one NAND
 	page;</li>
 
-	<li>for other flashes the overhead should be 2 min. I/O units if the
-	min. I/O unit size is greater or equivalent to 64 bytes, and 2 times
-	64 bytes aligned to the min. I/O unit size if the min. I/O unit size
+	<li>for other flashes the overhead should be 2 minimum I/O units if the
+	minimum I/O unit size is greater or equivalent to 64 bytes, and 2 times
+	64 bytes aligned to the minimum I/O unit size if the minimum I/O unit size
 	is less than 64 bytes.</li>
 </ul>
 
@@ -600,35 +587,35 @@ UBI overhead is: (<i>B</i> - <i>B<sub>B</sub></i> + 4) * <i>S<sub>P</sub></i> +
 <h2><a name="L_format">Saving erase counters</a></h2>
 
 <p>When working with UBI, it is important to realize that UBI stores erase
-counters on the flash media. Namely, each physical eraseblock has so-called
-erase counter header which stores the amount of times this physical eraseblock
-has been erased (see <a href="ubi.html#L_ubi_headers">here</a>). And of course,
-it is important not to lose the erase counters, which means that the tools
-you use to erase the flash and to write UBI images have to be UBI-aware. The
+counters on the flash media. Namely, each physical eraseblock has an EC
+(erase counter) header which stores the amount of times this physical eraseblock
+has been erased (see <a href="ubi.html#L_ubi_headers">here</a>).
+It is important not to lose the erase counters, which means the tools
+you use to erase the flash and to write the UBI images have to be UBI-aware. The
 <a href="ubi.html#L_usptools">mtd-utils</a> repository contains the
-<code>ubiformat</code> utility which takes things right.</p>
+<code>ubiformat</code> utility which does things properly.</p>
 
-<h2><a name="L_flasher_algo">How UBI flasher should work</a></h2>
+<h2><a name="L_flasher_algo">How a UBI flasher should work</a></h2>
 
-<p>The following is a list of what the UBI flasher program has to do when
-erasing the flash or when flashing UBI images.</p>
+<p>The following is a list of what a UBI flasher program has to do when
+erasing the flash or when writing UBI images.</p>
 
 <ul>
-	<li>First of all, scan the flash and collect the erase counters. Namely,
-	it read the EC header from each PEB, check the <code>CRC-32</code>
-	checksum of the	header, and save the erase counter in a RAM. It is not
-	necessary to read VID headers. Bad PEBs should be skipped.</li>
+	<li>First, scan the flash and collect the erase counters. Namely,
+	it reads the EC header from each PEB, checks the <code>CRC-32</code>
+	checksum of the	header, and saves the erase counter in RAM. It is not
+	necessary to read the VID headers. Bad PEBs should be skipped.</li>
 
-	<li>Calculate average erase counter. It should be used for PEBs with
-	corrupted or missing EC headers. Such PEBs may be there because of
-	unclean reboots, but there shouldn't be too many of them.</li>
+	<li>Next, calculate the average erase counter. This will be used for PEBs with
+	corrupted or missing EC headers. Such PEBs may occur due to
+	unexpected reboots, but there shouldn't be too many of them.</li>
 
 	<li>If the intention is to just erase the flash, then each PEB has to
-	be erased and proper EC header has to be written at the beginning of
-	the PEB. The EC header should contain incremented erase counter. Bad
-	PEBs should be just skipped. For NAND flashes, in case of I/O errors
+	be erased and a proper EC header has to be written at the beginning of
+	the PEB. The EC header should contain the updated erase counter. Bad
+	PEBs should be skipped. For NAND flashes, in the case of I/O errors
 	while erasing or writing, the PEB should be marked as bad (see
-	<a href="ubi.html#L_torturing">here</a> for more information how UBI
+	<a href="ubi.html#L_torturing">here</a> for more information on how UBI
 	marks PEBs as bad).</li>
 
 	<li>If the intention is to flash an UBI image, then the flasher should
@@ -637,9 +624,8 @@ erasing the flash or when flashing UBI images.</p>
 	<ul>
 		<li>Read the contents of this PEB from the UBI image (PEB size
 		bytes) into a buffer.</li>
-		<li>Stripe min. I/O units full of <code>0xFF</code> bytes from
-		the end of the buffer (the details are given below in this
-		section).</li>
+		<li>Strip minimum I/O units full of <code>0xFF</code> bytes from
+		the end of the buffer (the details are given below).</li>
 		<li>Erase the PEB.</li>
 		<li>Change the EC header in the buffer - put the new erase
 		counter value there and re-calculate the <code>CRC-32</code>
@@ -647,8 +633,8 @@ erasing the flash or when flashing UBI images.</p>
 		<li>Write the buffer to the physical eraseblock.</li>
 	</ul>
 
-	As usually, bad PEBs should be just skipped. And for NAND flashes, in
-	case I/O errors while erasing or writing, the PEB should be marked as
+	As always, bad PEBs should be skipped, and for NAND flashes, in the
+	case of I/O errors while erasing or writing, the PEB should be marked as
 	bad.</li>
 </ul>
 
@@ -657,20 +643,20 @@ flasher has to flash the used PEBs properly, and erase the unused PEBs
 properly.</p>
 
 <p>Note, when writing an UBI image, it does not matter where eraseblocks from
-the input UBI image will be written. For example, the first input eraseblock may
+the input UBI image are written. For example, the first input eraseblock may
 be written to the first PEB, or to the second one, or to the last one.</p>
 
-<p>Also note, if you implement a flasher which writes UBI images at the
-production line, i.e., only once, then the flasher does not have to change EC
-headers of the input UBI image, because this is new flash and each PEB has
-zero erase counter anyway. This means the production line flasher may be
-simpler.</p>
+<p>Also note, if you create a flasher to write UBI images at the time of
+production, (i.e., new flash, only once) then the flasher does not have to
+change the EC headers of the input UBI image, because this is new flash and
+each PEB has zero erase counter anyway. This means the production-line flasher
+may be simpler.</p>
 
-<p>If your UBI image contains <a href="ubifs.html#">UBIFS</a> file system, and
-your flash is NAND, you may have to drop <code>0xFF</code> bytes the end of
-input PEB data. This is very important, although not required for all NAND
+<p>If your UBI image contains a <a href="ubifs.html#">UBIFS</a> file system, and
+your flash is NAND, you may have to insert <code>0xFF</code> bytes at the end of
+your input PEB data. This is very important, although not required for all NAND
 flashes. Sometimes a failure to do this may result in very unpleasant problems
-which might be difficult to debug later. So we recommend to always do this.</p>
+which might be difficult to debug later on. So we recommend to always do this.</p>
 
 <p>The reason for this is that UBIFS treats NAND pages which contain only
 <code>0xFF</code> bytes (let's refer them to as empty NAND pages) as free.
@@ -685,10 +671,10 @@ written only once, even if the data contains only <code>0xFF</code> bytes.</p>
 <p>To put it differently, writing <code>0xFF</code> bytes may have side-effects.
 What the flasher has to do is to drop all empty NAND pages from the end of the
 PEB buffer before writing it. It is not necessary to drop all empty NAND pages,
-just the last ones. This means that the flasher does not have to scan whole
-buffer for <code>0xFF</code>'s. It is enough to scan the buffer from the end
+just the last ones. This means that the flasher does not have to scan the whole
+buffer for <code>0xFF</code>'s. It is enough to scan the buffer from the end,
 and stop on the first non-<code>0xFF</code> byte. This is much faster. Here
-is the code from UBI which does the right thing.</p>
+is the code from UBI which does the right thing:</p>
 
 <pre>
 /**
@@ -719,12 +705,12 @@ int ubi_calc_data_len(const struct ubi_device *ubi, const void *buf,
 <p>This function is called before writing the <code>buf</code> buffer to the
 PEB. The purpose of this function is to drop <code>0xFF</code>'s from the end
 and prevent the situation described above. The <code>ubi->min_io_size</code>
-is the minimal input/output unit size which is equivalent to NAND page size.</p>
+is the minimal I/O unit size, which is equivalent to the NAND page size.</p>
 
-<p>By the way, we experienced the similar problems with JFFS2. The JFFS2 images
+<p>By the way, we experienced similar problems with JFFS2. The JFFS2 images
 generated by the <code>mkfs.jffs2</code> program were padded to the physical
-eraseblock size and were later flashed to our NAND. The flasher did not bother
-skipping empty NAND pages. When JFFS2 was mounted, it wrote to those NAND pages,
+eraseblock size and were later flashed to our NAND. The flasher did not bother to
+skip empty NAND pages. When JFFS2 was mounted, it wrote to those NAND pages,
 and the writes did not fail. But later we observed weird ECC errors. It took a
 while to find out the problem. In other words, this is also relevant to JFFS2
 images.</p>
@@ -740,19 +726,19 @@ programmer to write a UBI image.  More information is available
 
 <h2><a name="L_torturing">Marking eraseblocks as bad</a></h2>
 
-<p>This section is relevant for NAND flashes and other flashes which admit of
-bad eraseblocks. UBI marks physical eraseblocks as bad on 2 occasions:</p>
+<p>This section is relevant for NAND flashes as well as other flashes which exhibit
+bad eraseblocks. UBI marks physical eraseblocks as bad in the following 2 scenarios:</p>
 
 <ol>
-	<li>eraseblock write operation failed, in which case UBI moves the
+	<li>an eraseblock write operation failed, in which case UBI moves the
 	data from this PEB to some other PEB (data recovery) and schedules this
 	PEB for torturing;</li>
-	<li>erase operation failed with <code>EIO</code> error, in which case
-	the eraseblock s marked as bad straight away.</li>
+	<li>the erase operation failed with <code>EIO</code> error, in which case
+	the eraseblock s marked as bad immediately.</li>
 </ol>
 
-<p>The torturing is done in background with the purpose of detecting whether the
-physical eraseblock is really bad. The write failure might have happened because
+<p>The torturing is done in the background for the purpose of detecting whether the
+physical eraseblock is actually bad. The write failure could have occurred for one
 of many reasons, including bugs in the driver or in the upper level stuff like
 the file system (e.g., the FS mistakenly writes many times to the same NAND
 page). During the torturing UBI does the following:</p>
@@ -766,20 +752,20 @@ page). During the torturing UBI does the following:</p>
 	<code>0x5A</code>, <code>0x00</code>).</li>
 </ul>
 
-<p>The eraseblock is not marked as bad if it survives the torture test. Note, a
-bit-flip during the torture test is treated as a good reason to mark the
-eraseblock bad as well. Please, refer the <code>torture_peb()</code> function
+<p>The eraseblock is not marked as bad if it survives the torture test. However,
+a bit-flip during the torture test is a good reason to mark the
+eraseblock as bad. Please, refer to the <code>torture_peb()</code> function
 for detailed information.</p>
 
 
 
 <h2><a name="L_scalability">Scalability issues</a></h2>
 
-<p>Unfortunately, UBI scales linearly in terms of flash size. UBI
-initialization time linearly depends on the number of physical eraseblocks on
-the flash. This means that the larger is the flash, the more time it takes for
-UBI to initialize (i.e., to attach the MTD device).
-Note: Starting with Linux v3.7 UBI offers an optional and experimental feature,
+<p>Unfortunately, UBI performance scales linearly with flash size. UBI
+initialization time is directly proportional to the number of physical
+eraseblocks on the flash. This means that the larger the flash, the more time
+it takes for UBI to initialize (i.e., to attach the MTD device).
+Note: Starting with Linux v3.7 UBI offers an optional and experimental feature
 called "fastmap", which allows attaching in nearly constant time,
 see <a href="ubi.html#L_fastmap">Fastmap</a>.
 The initialization time depends on the flash I/O speed and (slightly) on the
@@ -789,24 +775,24 @@ CPU speed, because:</p>
 	<li>UBI scans the MTD device when attaching - it reads the erase EC and
 	VID <a href="ubi.html#L_ubi_headers">headers</a> from every single PEB;
 	the headers are small (64 bytes each), so this means reading 128 bytes
-	from each PEB in case of NOR flash or one or two NAND pages in case of
-	NAND flash (this depends on whether the NAND flash supports
-	<a href="ubi.html#L_subpage">sub-pages</a> or not); this is anyway much
-	less than JFFS2 needs to read when it mounts MTD devices, so UBI
+	from each PEB in the case of NOR flash or one or two NAND pages in the
+	case of NAND flash (this depends on whether the NAND flash supports
+	<a href="ubi.html#L_subpage">sub-pages</a> or not); in any case this is
+	much less time than JFFS2 needs to read when it mounts MTD devices, so UBI
 	attaches MTD devices many times faster than JFFS2 would mount a file
 	system on the same MTD device;</li>
 
-	<li>UBI calculates <code>CRC-32</code> checksum of each EC and VID
-	header, which consumes CPU, although this is usually minor comparing to
+	<li>UBI calculates the <code>CRC-32</code> checksum of each EC and VID
+	header, which consumes CPU, although this is usually minor compared to
 	the flash I/O overhead.</li>
 </ul>
 
 <p>Here are some figures:</p>
 <ul>
-	<li>a 256MiB OneNAND flash found in Nokia N800 devices is attached for
-	less than 1 sec; the flash does support sub-pages so UBI has to read
-	the first 2KiB NAND page of each PEB while scanning;</li>
-	<li>a 1GiB NAND flash found in OLPC XO-1 devices is attached for about 2
+	<li>a 256MiB OneNAND flash found in Nokia N800 devices attaches in
+	less than 1 sec; the flash does support sub-pages so UBI only has
+	to read the first 2KiB NAND page of each PEB while scanning;</li>
+	<li>a 1GiB NAND flash found in OLPC XO-1 devices attaches in about 2
 	seconds; the flash is an SLC NAND and supports sub-pages, but the Cafe
 	controller which is used in the laptop does not allow sub-page writes,
 	so UBI has to read two 2KiB NAND pages from each PEB.</li>
@@ -826,40 +812,40 @@ to us via the <a href="../mail.html">MTD mailing list</a>.</p>
 	reading an LEB, UBI first looks up the table to find the corresponding
 	PEB number, then reads from this PEB;</li>
 	<li><b>erase counters (EC) table</b> which contains the erase counter
-	value for each physical eraseblock; UBI wear-leveling sub-system uses
+	value for each physical eraseblock; the UBI wear-leveling sub-system uses
 	this table when it needs to find, for example, a highly worn-out
 	LEB;</li>
 </ul>
 
-<p>The volume table is maintained on flash. It changes only when UBI volumes are
-created, deleted and re-sized, which are rare and not time-critical operations,
-and UBI can afford a slow and simple method of the volume table management.</p>
+<p>The volume table is maintained on-flash. It changes only when UBI volumes are
+created, deleted, or re-sized, which are rare and not time-critical operations,
+when UBI can afford slow and simple volume table management.</p>
 
 <p>The EBA and EC tables are changed every time an LEB is mapped to a PEB or a
 PEB is erased, which happens quite often and means that the table management
 methods should be fast and efficient.</p>
 
-<p>UBI could maintain on the EBA and EC tables on the flash media, but this
+<p>UBI could maintain the EBA and EC tables on the flash media, but this
 would inevitably involve journaling, journal replay, journal commit, etc. In
 other words, this would introduce a lot of complexity. But UBI would be
 logarithmically scalable in this case.</p>
 
 <p>One of the UBI requirements was simplicity of the on-flash format, because
 UBI authors had to read UBI volumes from the boot-loader and they had very
-tough constraints on the boot-loader code size. It was basically impossible
+tight constraints on the boot-loader code size. It was basically impossible
 to add complex journal scanning and replay code to the boot-loader.</p>
 
-<p>So UBI does not maintain the EBA and EC tables on the flash media. Instead,
+<p>Therefore UBI does not maintain the EBA and EC tables on the flash media. Instead,
 it builds them in RAM each time it attaches the MTD device. This means that UBI
-has to scan whole flash and read the EC and VID headers from each PEB in
-order to build in-RAM EC and EBA tables.</p>
+has to scan the entire flash and read the EC and VID headers from each PEB in
+order to build the in-RAM EC and EBA tables.</p>
 
 <p>The drawbacks of this design are poor scalability and relatively high
 overhead on NAND flashes (e.g., the overhead is 1.5%-3% of flash space in case
-of a NAND flash with 2KiB NAND page and 128KiB eraseblock). The advantages are
-simple binary format and robustness, as the result of simplicity.</p>
+of a NAND flash with 2KiB NAND page and a 128KiB eraseblock). The advantages
+of this simplicity are a simple binary format as well as robustness.</p>
 
-<p>Nonetheless, it is always possible to create UBI2 which would maintain the
+<p>Nonetheless, someday we might see a "UBI2" which would maintain the
 tables in separate flash areas. UBI2 would not be compatible with UBI because
 of completely different on-flash formats, but the user interfaces would stay the
 same, which would guarantee compatibility of all the software built on top of
@@ -871,20 +857,20 @@ UBI.</p>
 
 <p>It is well-known that NAND chips have some amount of physical eraseblocks
 marked as bad by the manufacturer. During the lifetime of the NAND device,
-other bad blocks may appear. Although, manufacturers usually guarantee that
-the first few physical eraseblocks are not bad and the total amount of bad PEBs
+other bad blocks may appear. Nonetheless, manufacturers usually guarantee that
+the first few physical eraseblocks are not bad and that the total number of bad PEBs
 will not exceed certain number. For example, a 256MiB (2048 128KiB PEBs)
 Samsung OneNAND chip is guaranteed to have not more than 40 128KiB PEBs during
 its endurance lifetime. This is a very common value for NAND devices:
 20/1024 PEB, which is about 2% of flash size.</p>
 
 <p>This ratio of 20/1024 is the default number of blocks that UBI reserves for
-a UBI device. It means that if there's 2 UBI devices on a 4096 PEB NAND, 80 PEB
-for <b>each</b> UBI device will be reserved. This may appear as a waste of
-space, but as far as bad blocks can appear everywhere on the NAND flash, and
-are not equally disposed on the whole device, it's the safer way. So instead of
-using several UBI devices on a NAND flash, it's more space efficient to use only
-one UBI device and several UBI volumes.</p>
+a UBI device. This means that if there are 2 UBI devices on a 4096 PEB NAND, 80 PEB
+for <b>each</b> UBI device will be reserved. This may appear to be a waste of
+space, but, given that bad blocks can appear anywhere on the NAND flash, and
+are not equally distributed on the whole device, it's the safer way. So instead of
+using several UBI devices on a NAND flash, it's more space-efficient to use only
+one UBI device which contains several UBI volumes.</p>
 <p>The default value of 20 PEB reserved per 1024 PEB is a kernel config option.
 For each UBI device, this value can be adjusted via a kernel parameter or an
 ubiattach parameter (since kernel 3.7).</p>
@@ -894,19 +880,20 @@ ubiattach parameter (since kernel 3.7).</p>
 
 <h2><a name="L_autoresize">Volume auto-resize</a></h2>
 
-<p>When it is needed to create an UBI image which will be flashed to the end
-user devices in production line, you should define exact sizes of all volumes
-(the sizes are stored in the UBI volume table). But usually, in the embedded
-world, we like to have one (read only) volume for the root file system and
-one read write volume for the rest (logs, user data, etc.). If the size of the
-root file system is fixed, the size of the second one can vary from one product
-to another (different flash sizes) and we just want all space left.</p>
+<p>When a UBI image is to be flashed during production, one should specify
+exact sizes for all volumes (the sizes are stored in the UBI volume table).
+However, in practice, in the embedded world, we like to have one read only
+volume for the root file system and one read/write volume for however much
+space is left (logs, user data, etc.). If the size of the root file system is
+fixed, the size of the second one can vary from one product to another (given
+different flash sizes).</p>
 
-<p>That what the auto-resize is about. If the volume has the <b>auto-resize</b>
-mark, its size will be enlarged when UBI is run for the first time. After the
-volume size is adjusted, UBI removes the auto-resize mark and the volume is
-not re-sized anymore. The auto-resize flag is stored in the volume table and
-only one volume may be marked as auto-resize.</p>
+<p>This is the purpose of the auto-resize flag. If the volume has the
+<b>auto-resize</b> flag enabled, its size will expand to fill the remaining
+unused space when UBI is run for the first time. After the volume size is
+adjusted, UBI removes the auto-resize flag and the volume is not re-sized
+anymore. The auto-resize flag is stored in the volume table and only one
+volume may be marked as auto-resize.</p>
 
 
 
@@ -916,7 +903,7 @@ only one volume may be marked as auto-resize.</p>
 
 <p>The <b>LEB un-map</b> operation is implemented by the
 <code>ubi_leb_unmap()</code> UBI kernel API function. And starting from kernel
-version <code>2.6.29</code> the un-map operation is available to the user-space
+version <code>2.6.29</code> the un-map operation is available to user-space
 programs via the <code>UBI_IOCEBUNMAP</code> ioctl command. The ioctl should be
 called for UBI volume character devices.</p>
 
@@ -925,31 +912,31 @@ called for UBI volume character devices.</p>
 	<li>first un-maps the LEB from the corresponding PEB;</li>
 	<li>then schedules the PEB for erasure and returns; it does not wait
 	for the erasure of the PEB to be finished; the PEB is instead erased
-	in context of the UBI background thread;</li>
+	by the UBI background thread;</li>
 </ul>
 
 <p>UBI returns all <code>0xFF</code> bytes when an un-mapped LEB is read, so
 the un-map operation may be considered as a very fast erase operation. But there
-is one aspect UBI programmers have to be well aware of.</p>
+is one aspect to which UBI programmers have to be aware:</p>
 
 <p>Suppose you un-map LEB <i>L</i> which is mapped to PEB <i>P</i>. Since
 <i>P</i> is not synchronously erased, but just scheduled for erasure, there
-might be "surprises" in case of unclean reboots: if the reboot happens before
+might be "surprises" in the case of unclean reboots: if a reboot happens before
 <i>P</i> has been physically erased, <i>L</i> will be mapped to <i>P</i> again
-when UBI attaches the MTD device after the unclean reboot. Indeed, UBI will
-scan the MTD device and find <i>P</i> which refers <i>L</i>, and it will
+when UBI attaches the MTD device at the next bootup. Indeed, UBI will
+scan the MTD device and find the <i>P</i> which refers to <i>L</i>, and it will
 add this mapping information to the
 <a href="ubi.html#L_scalability_det">EBA table</a>.</p>
 
-<p>But once you write any data to <i>L</i>, or map it using the
-<a href="ubi.html#L_map">LEB map</a> operation, it gets mapped to a new PEB
-and the old contents goes forever, because even in case of an unclean reboot UBI
-would pick the newer mapping for <i>L</i>.</p>
+<p>However, once you write any data to <i>L</i>, or map it using the <a
+href="ubi.html#L_map">LEB map</a> operation, it gets mapped to a new PEB and
+the old contents are gone forever, because even in the case of an unclean
+reboot UBI would pick the newer mapping for <i>L</i>.</p>
 
 <h4><a name="L_unmap_det">Implementation details</a></h4>
 
 <p>This section describes how UBI distinguishes between older and newer
-versions of an LEB in case of an unclean reboot. Suppose we un-map LEB
+versions of an LEB in the case of an unclean reboot. Suppose we un-map LEB
 <i>L</i> which is mapped to PEB <i>P<sub>1</sub></i>, which means UBI schedules
 <i>P<sub>1</sub></i> for erasure. Then we write some data to <i>L</i>, which
 means that UBI finds another PEB <i>P<sub>2</sub></i>, maps <i>L</i> to
@@ -959,56 +946,56 @@ after the write operation, we end up with 2 PEBs (<i>P<sub>1</sub></i> and
 <i>P<sub>2</sub></i>) mapped to the same LEB <i>L</i>.</p>
 
 <p>To handle situations like this, UBI maintains a global 64-bit <i>sequence
-number</i> variable. The sequence number variable is increased each time a PEB
+number</i> variable. The sequence number variable is incremented each time a PEB
 is mapped to a LEB and its value is stored in the
 <a href="ubi.html#L_ubi_headers">VID header</a> of the PEB. So each VID header
-has a unique sequence number, and the larger is the sequence number, the
-"younger" is the VID header. When UBI attaches MTD devices, it initializes the
-global sequence number variable to the highest value found in existing VID
+has a unique sequence number, and the larger the sequence number, the
+"younger" the VID header. When UBI attaches MTD devices, it initializes the
+global sequence number variable to the highest value found in the existing VID
 headers plus one.</p>
 
-<p>In the above situation, UBI just selects a PEB with higher sequence number
-(<i>P<sub>2</sub></i>) and drops the PEB with lower sequence number
+<p>In the above situation, UBI simply selects a PEB with the highest sequence number
+(<i>P<sub>2</sub></i>) and drops the PEB with the lower sequence number
 (<i>P<sub>1</sub></i>).</p>
 
 <p>Note, the situation is more difficult if an unclean reboot happens when UBI
-moves the contents of one PEB to another for a wear-leveling purposes, or when
-it happens during the <a href="ubi.html#L_lebchange">atomic LEB change</a>
+moves the contents of one PEB to another for wear-leveling purposes, or when
+the unclean reboot happens during an <a href="ubi.html#L_lebchange">atomic LEB change</a>
 operation. In this case it is not enough to just pick the newer PEB, it is also
-necessary to make sure the data reached the the new PEB.</p>
+necessary to make sure the data reached the new PEB.</p>
 
 
 
 <h2><a name="L_map">LEB map</a></h2>
 
 <p>The <b>LEB map</b> operation maps a previously
-<a href="ubi.html#L_unmap">un-mapped</a> logical eraseblock to a physical
-eraseblock. For example, if the operation is run for LEB <i>A</i>, UBI will
-find appropriate PEB, write <a href="ubi.html#L_ubi_headers">VID header</a> to
+<a href="ubi.html#L_unmap">un-mapped</a> logical eraseblock (LEB) to a physical
+eraseblock (PEB). For example, if the operation is run for LEB <i>A</i>, UBI will
+find an appropriate PEB, write a <a href="ubi.html#L_ubi_headers">VID header</a> to
 the PEB, and amend the in-memory
-<a href="ubi.html#L_scalability_det">EBA table</a>. The VID header will
-refer LEB <i>A</i>. After this operation all I/O to LEB <i>A</i> will actually
+<a href="ubi.html#L_scalability_det">EBA table</a>. The VID header will now
+refer to LEB <i>A</i>. After this operation all I/O to LEB <i>A</i> will actually
 go to the mapped PEB.</p>
 
 <p>The LEB map operation is available via the <code>ubi_leb_map()</code>
 UBI kernel API function, or via the <code>UBI_IOCEBMAP</code> volume character
-device ioctl command. However, thie ioctl interface is available only starting
+device ioctl command. However, this ioctl interface is available only starting
 from kernel version <code>2.6.29</code>.</p>
 
-<p>One of the possible use-cases of the LEB map operation is making sure the
-old LEB contents goes away forever. As it was explained in
+<p>One of the functions of the LEB map operation is to make sure
+old LEB contents are removed. As was explained in
 <a href="ubi.html#L_unmap">this</a> section, when an LEB is un-mapped, the
-corresponding PEB is not erased straight away. And if an unclean reboot happens,
-the LEB may becomes mapped to the same PEB again, after the UBI attaches the
-MTD device. So, if you map the LEB just after un-mapping it, you are guaranteed
-that the old LEB contents never comes back. In other words, the LEB is guaranteed
+corresponding PEB is not erased immediately. If an unclean reboot happens,
+the LEB may become mapped to the same PEB again, after the UBI attaches the
+MTD device. So, if you map the LEB immediately after un-mapping it, you are guaranteed
+that the old LEB contents are deleted. In other words, the LEB is guaranteed
 to contain only 0xFF bytes after the map operation returns, even in case of an
 unclean reboot.</p>
 
-<p>Please, use the LEB map operation carefully. Do not use this unless it is
+<p>Please, use the LEB map operation sparingly. Do not use it unless it is
 really needed, because mapped LEBs add more overhead on the UBI wear-leveling
 sub-system, comparing to un-mapped LEBs. Indeed, if an LEB is un-mapped, there
-is no PEB which contains LEB's data, and the wear-leveling sub-system does not
+is no PEB which contains this LEB's data, and the wear-leveling sub-system does not
 have to move any data to maintain wear-leveling. Conversely, if the LEB is
 mapped to a PEB, there is one more PEB for the wear-leveling sub-system to care
 about, and one more LEB to re-map to another PEB if the erase counter of the
@@ -1019,26 +1006,27 @@ erase counter and the old PEB is used for other operations).</p>
 
 <h2><a name="L_volupdate">Volume update</a></h2>
 
-<p>The <b>volume update</b> operation is be useful for device software updates.
-The operation changes the contents of whole UBI volume with new contents. But if
+<p>The <b>volume update</b> operation is useful for device software updates.
+The operation changes the contents of the whole UBI volume with new contents. But if
 it gets interrupted in the middle of the update, the volume goes into the
 "corrupted" state and further I/O on the volume ends up with an
-<code>EBADF</code> error. And the only way to get the volume back to the normal
+<code>EBADF</code> error. The only way to get the volume back to the normal
 state is to start a new volume update operation and finish it.</p>
 
-<p>The volume update operation allows detecting interrupted updates and
-re-starting it with help of, for example, a "mirror" volume which would have the
-same contents or by showing a dialog window which would inform the user
-about the problem and request flashing. In contrast, it is difficult to
-detect interrupted updates in case of raw MTD partitions.</p>
+<p>The volume update operation can detect interrupted updates and re-start
+the update with the help of, for example, a "mirror" volume which would have
+the same contents or by showing a dialog window which would inform the user
+about the problem and request re-flashing. In contrast, it is difficult to
+detect interrupted updates when using raw MTD partitions.</p>
 
 <p>The volume update operation is available via the user-space UBI interface and
 not available via the UBI kernel API. To update a volume, you first have to call
-the <code>UBI_IOCVOLUP</code> ioctl of the corresponding UBI volume character
-device and pass it a pointer to a 64-bit value containing the length of the new
-volume contents in bytes. Then this amount of bytes has to be written to the
-volume character device. Once the last byte has been send to the character
-device, the update operation is finished. Schematically, the sequence is:</p>
+the <code>UBI_IOCVOLUP</code> ioctl on the corresponding UBI volume character
+device node and pass it a pointer to a 64-bit value containing the length of the new
+volume contents in bytes. Then this number of bytes has to be written to the
+volume character device node. Once the last byte has been sent to the character
+device node, the update operation is finished. Conceptually, the sequence (in
+pseudo-code) is:</p>
 
 <pre>
 fd = open("/dev/my_volume");
@@ -1048,59 +1036,57 @@ close(fd);
 </pre>
 
 <p>See <code>include/mtd/ubi-user.h</code> for more details. Bear in mind, the
-old contents of the volume is not preserved in case of an interrupted update.
-Also, you do not have to write all new data at one go. It is OK to call
-the <code>write()</code> function arbitrary number of times and pass arbitrary
-amount of data each time. The operation will be finished after all the data
-have been written. If the last write operation contains more bytes than UBI
-expects, the extra data are just ignored.</p>
-
-<p>Special case of the volume update operation is what we call <b>volume
-truncation</b>, which is done by the same ioctl command if the data length is
-zero. In this case the volume is just wiped out and will contain all
+old contents of the volume are not preserved if the update is interrupted.
+Also, you do not have to write all the new data in one go. It is OK to call
+the <code>write()</code> function an arbitrary number of times and pass arbitrary
+amounts of data each time. The operation will be finished after all the data
+has been written. If the last write operation contains more bytes than UBI
+expects, the extra is ignored.</p>
+
+<p>A Special case of the volume update operation is what we call <b>volume
+truncation</b>, which is done by the same ioctl command when the data length is
+zero. In this case the volume is wiped out and will contain all
 <code>0xFF</code> bytes (all LEBs will be un-mapped).</p>
 
 <p>Note, the <code>/sys/class/ubi/ubiX_X/corrupted</code> sysfs file reflects
 the "corrupted" state of the volume: it contains ASCII "0\n" if the volume is OK
-and "1\n" if it is corrupted (because volume update had started but was not
-finished).</p>
+and "1\n" if it is corrupted (i.e. if a volume update was started but was not
+completed).</p>
 
-<p>The volume update operation does not preserve the old volume contents if it
-is interrupted, so it is not atomic. However, UBI also provides atomic volume
+<p>The volume update operation does not preserve its previous contents if the
+update is interrupted; it is not atomic. However, UBI does provide atomic volume
 updates by means of the <b>volume re-name</b> operation.</p>
 
-<p>The volume update is implemented with help of so-called <b>update
-marker</b>. Once the user has issued the <code>UBI_IOCVOLUP</code> ioctl, UBI
+<p>Volume updates are implemented with the help of <b>update
+marker</b>s. Once the user has issued the <code>UBI_IOCVOLUP</code> ioctl, UBI
 sets the update marker flag for the volume in the corresponding record of the
-UBI <a href="ubi.html#L_vol_table">volume table</a>. Then the volume is wiped
-out and UBI waits for the the user to pass the data. Once all the data have
-arrived and have been written to the flash, the update marker is cleaned. But
-in case of an interruption (e.g., unclean reboot, crash of the update
-application, etc.), the update marker is not cleaned and the volume is treated
-as "corrupted". Only a new successful update operation may clean the update
-marker.</p>
+UBI <a href="ubi.html#L_vol_table">volume table</a>. At this point the volume
+is wiped, and UBI waits for the user to send the data. Only when all the data
+has been sent and has been written to the flash successfully, will the update
+marker be cleared. If the update is interrupted (e.g., unclean reboot, crash
+of the update application, etc.), the update marker is not cleared and the
+volume is treated as "corrupted". Only once a successful update operation has
+occurred will the update marker be cleared.</p>
 
 
 
 <h2><a name="L_lebchange">Atomic LEB change</a></h2>
 
 <p>The <b>atomic LEB change</b> operation changes the contents of an LEB
-atomically, so that the old contents is preserved if the operation is
-interrupted. In other words, the result of the operation is that the LEB either
-has the old contents or the new contents.</p>
-
-<p>The operation is available via the <code>ubi_leb_change()</code> kernel API
-call. The user-space interface for this operation exists starting from kernel
-version <code>2.6.25</code>.</p>
-
-<p>The user-space atomic LEB change operation is run via the
-<code>UBI_IOCEBCH</code> ioctl command. You have to pass a pointer to a properly
-filled request object of <code>struct ubi_leb_change_req</code> type. The
-object stores the LEB number to change and the length of the new contents. Then
-you have to write the specified amount of bytes to the volume character device.
-Notice some similarity to the user-space interface of the
-<a href="ubi.html#L_volupdate">volume update</a> operation. Schematically,
-the sequence is:</p>
+atomically, so that the old contents are preserved should the operation be
+interrupted. In other words, the LEB will always contain either the old
+contents or the new contents. This functionality is available via the
+<code>ubi_leb_change()</code> kernel API call.</p>
+
+<p>The user-space interface for this operation was added in kernel version
+<code>2.6.25</code>. Its functionality is available to user-space via the
+<code>UBI_IOCEBCH</code> ioctl command. You have to pass a pointer to a
+properly-filled request object of <code>struct ubi_leb_change_req</code>
+type. This object stores the LEB number to change and the length of
+the new contents. Then you have to write the specified number of
+bytes to the volume character device. Note the similarity to the
+<a href="ubi.html#L_volupdate">volume update</a> operation. Conceptually, the
+sequence (in pseudo-code) is:</p>
 
 <pre>
 struct ubi_leb_change_req req;
@@ -1113,29 +1099,29 @@ write(fd, data_buf, data_len);
 close(fd);
 </pre>
 
-<p>If for some reason the user does not write the declared amount of bytes
-and closes the file, the operation is canceled and the old contents of the LEB
-is preserved.</p>
+<p>If, for some reason, the user does not write the specified number of bytes to
+the file descriptor before closing the file, the operation is cancelled and
+the old contents of the LEB are preserved.</p>
 
-<p>Similarly tho the volume update operation it does not matter how many times
+<p>Similarly to the volume update operation, it does not matter how many times
 the <code>write()</code> function is called and how much data it passes to the
-UBI volume each time. The atomic LEB change operation finishes once the last
+UBI volume each time. The atomic LEB change operation finishes only once the last
 data byte has arrived.</p>
 
-<p>The atomic LEB change operation might be very useful for file-systems, for
-example <a href="ubifs.html#">UBIFS</a> uses this operation as the last resort
-when it commits the file-system index. This operation may also be exploited
-to create an FTL layer on top of UBI (see <a
-href="http://lists.infradead.org/pipermail/linux-mtd/2008-January/020381.html">
-here</a> for the description of the idea).</p>
+<p>The atomic LEB change operation might be very useful for file-systems,
+for example <a href="ubifs.html#">UBIFS</a> uses this functionality when it
+commits the file-system index. This behaviour could also be used to create an
+FTL layer on top of UBI (see
+<a href="http://lists.infradead.org/pipermail/linux-mtd/2008-January/020381.html">
+here</a> for a description of the idea).</p>
 
 <p>Keep in mind that the atomic LEB change operation calculates the
-<code>CRC-32</code> checksum of the new data, so it has some overhead comparing
-to the LEB erase plus LEB write sequence. The volume update operation does not
-calculate data <code>CRC-32</code>, so it is faster to update the volume than to
-atomically change all its eraseblocks. This additional overhead has to be
-remembered about and the operation should not be used if the atomicity is not
-really needed.</p>
+<code>CRC-32</code> checksum of the new data, so it has some overhead compared
+to the "LEB erase" + "LEB write" sequence. The volume update operation does
+not calculate the data's <code>CRC-32</code> checksum, so it is faster to
+update the volume than it is to atomically change all its eraseblocks. Keep
+this overhead in mind and be sure to only use this operation if/when atomicity
+is really needed.</p>
 
 <h4><a name="L_lebchange_det">Implementation details</a></h4>
 
@@ -1143,33 +1129,33 @@ really needed.</p>
 physical eraseblock <i>P<sub>1</sub></i>. First of all, UBI always has one free
 PEB reserved for the atomic LEB change operation, let it be
 <i>P<sub>2</sub></i>. Before the operation, <i>P<sub>1</sub></i> stores the
-contents of the LEB <i>L</i> and <i>P<sub>2</sub></i> is free (it contains only
-the EC header and <code>0xFF</code> bytes). The new data are written to
+current contents of the LEB <i>L</i> and <i>P<sub>2</sub></i> is free (it contains only
+the EC header and <code>0xFF</code> bytes). The new data is written to
 <i>P<sub>2</sub></i>, not to <i>P<sub>1</sub></i>, so should anything go wrong,
-the old contents of the LEB is always there.</p>
+the old contents of the LEB are maintained.</p>
 
 <p>When the operation finishes, UBI un-maps <i>L</i> from <i>P<sub>1</sub></i>,
 maps in to <i>P<sub>2</sub></i>, and schedules <i>P<sub>1</sub></i> for erasure.
-If the operation is interrupted, <i>L</i> stays being mapped to
+If the operation is interrupted, <i>L</i> continues to be mapped to
 <i>P<sub>1</sub></i> and <i>P<sub>2</sub></i> is scheduled for erasure.</p>
 
 <p>If an unclean reboot happens half way through the atomic LEB change
 operation, it is obvious that UBI has to preserve the
-<i>L -> P<sub>1</sub></i> mapping and erase <i>P<sub>2</sub></i> when it is
-attaches the MTD device next time. But if the unclean reboot happens just after
+<i>L -> P<sub>1</sub></i> mapping and erase <i>P<sub>2</sub></i> when it
+attaches the MTD device on the next reboot. But if an unclean reboot happens just after
 the atomic LEB change operation finishes, but before <i>P<sub>1</sub></i> is
-physically erased, it is obvious that UBI has to preserve
+physically erased, it is obvious that UBI has to preserve the
 <i>L -> P<sub>2</sub></i> mapping and erase <i>P<sub>1</sub></i>.</p>
 
-<p>To resolve situations like that, UBI calculates <code>CRC-32</code> checksum
-of the new contents of the LEB before it is written to flash, and stores it in
+<p>To resolve situations like that, UBI calculates the <code>CRC-32</code> checksum
+of the new contents of the LEB before it is written to the flash, and stores it in
 the VID header (together with data length). When UBI finds 2 PEBs
 <i>P<sub>1</sub></i> and <i>P<sub>2</sub></i> mapped to the same LEB <i>L</i>
-during the initialization, it selects the one with higher sequence number
-(<i>P<sub>2</sub></i>) only if the data <code>CRC-32</code> is correct (which
+during the initialization, it selects the one with the higher sequence number
+(<i>P<sub>2</sub></i>) only if the data <code>CRC-32</code> checksum is correct (which
 means that all data has been written to the flash media), otherwise it selects
 the PEB with lower sequence number(<i>P<sub>1</sub></i>). Of course, UBI has to
-read the LEB contents in order to check the <code>CRC-32</code> checksum.</p>
+read the LEB contents in order to verify the <code>CRC-32</code> checksum.</p>
 
 
 
@@ -1178,8 +1164,8 @@ read the LEB contents in order to check the <code>CRC-32</code> checksum.</p>
 by setting CONFIG_MTD_UBI_FASTMAP to 'y'. Once enabled UBI evaluates the module
 parameter "fm_autoconvert". If it is set to 1 (default is 0) UBI automatically
 enables fastmap for any attached image. This means UBI creates a new internal
-volume with the fastmap data such that next time the fast attach mode can be
-used.</p>
+volume with the fastmap data such that next time the image is attached, the
+fast attach mode can be used.</p>
 
 <p>In the default configuration UBI will use the information stored in this
 fastmap volume to accelerate the attach procedure. If you want to test
@@ -1204,15 +1190,15 @@ fastmap, set fm_autoconvert to 1 and attach a volume.</p>
 <tr>
 <td>y</td>
 <td>0</td>
-<td>UBI will attach by fastmap if one exists on an image,
-but no fastmap will be installed on images without a fastmap</td>
+<td>UBI will use the fastmap data if it exists on an image,
+but will not install a fastmap on images that don't already have it</td>
 </tr>
 
 <tr>
 <td>y</td>
 <td>1</td>
-<td>UBI will attach by fastmap if one exists on an image, a fastmap
-is automatically installed on all attached images</td>
+<td>UBI will use the fastmap data if it exists on an image, and a fastmap
+is automatically created on all attached images</td>
 </tr>
 </tdata>
 </table>
@@ -1220,30 +1206,30 @@ is automatically installed on all attached images</td>
 <h4><a name="L_fastmap_compat">Backwards compatibility</a></h4>
 
 <p>The fastmap on-disk data structure makes use of delete compatible volumes,
-therefore fastmap enabled images are fully backwards compatible with UBI
+therefore fastmap-enabled images are fully backwards compatible with UBI
 implementations which do not support fastmap. The kernel will remove the
-fastmap volumes and continue with scanning. This includes not only v3.6- but
-also v3.7+ with this option disabled.</p>
+fastmap volumes and continue with scanning. This includes not only kernel
+version v3.6- but also v3.7+ with this option disabled.</p>
 
 <h4><a name="L_fastmap_tech">Technical design</a></h4>
 
-<p>A on-disk fastmap contains all information needed to attach the whole image,
-namely all erase counter values, a list of all PEBs and their state, a list of
-all volumes and their current EBA, ...
+<p>An on-disk fastmap contains all the information required to attach the whole image,
+including: all erase counter values, a list of all PEBs and their state, a list of
+all volumes and their current EBA, etc...
 To avoid too many writes of the fastmap, it also contains a list of PEBs which
 may have changed and need a full scan while attaching.
-This list is called "fastmap pool" and has a fixed sized, 5% of the total
-amount of PEBs. Using this technique UBI needs to write the fastmap only if the
+This list is called the "fastmap pool" and has a fixed size of 5% of the total
+number of PEBs. By design UBI needs to write the fastmap data only if the
 pool contains no free PEBs. Otherwise it would have to write the fastmap each
 time the EBA of a volume has changed.</p>
 
-<p>A fastmap consists of a super block (also known as anchor PEB) and payload
+<p>A fastmap consists of a super-block (also known as an anchor PEB) and payload
 data which can live on any PEB.
 The anchor PEB has to be located within the first 64 PEBs on the MTD device.
 It contains pointers to the remaining PEBs which carry the actual fastmap
 data. On modern NAND chips the whole fastmap fits into a single PEB.
 Hence, the anchor PEB points to itself.
-After loading the fastmap data, UBI attach information structure is created
+After loading the fastmap data, the UBI attach information structure is created
 from it.</p>
 
 <p>The attach process works as follows:</p>
@@ -1257,44 +1243,45 @@ from it.</p>
 	instead of all PEBs</li>
 </ol>
 
-<p>If UBI detects that the used fastmap is invalid or corrupted it
+<p>If UBI detects that the fastmap data is invalid or corrupt it
 automatically falls back to scanning mode and performs a full scan. Using a
 CRC32 checksum and consistency checks of the internal UBI structures UBI is
-able to detect whether a fastmap is invalid or not.</p>
+able to detect whether the fastmap data is invalid or not.</p>
 
-<p>A fastmap is written to the devices each time the fastmap pool becomes full
-(no free PEBs are available), the volume layout changes or the image is
-detached. One may wonder why writing at detach time is needed.  If UBI would
-not write a new fastmap at detach time all erase counter modifications since
-the last fastmap write are lost.</p>
+<p>The fastmap data is written to the device: each time the fastmap pool becomes full
+(i.e. no free PEBs are available), the volume layout changes, or the image is
+detached. If you are wondering why the fastmap data needs to be written at
+detach time, it is because otherwise all erase counter modifications since
+the last fastmap write would be lost.</p>
 
 <h4><a name="L_fastmap_overhead">Overhead</a></h4>
 
-<p>If fastmap enabled UBI will reserve enough PEBs to carry two complete
+<p>A fastmap-enabled UBI will reserve enough PEBs to carry two complete
 fastmaps. In practice on modern NAND chips two PEBs are reserved for fastmap.</p>
 
-<p>There is also some runtime overhead, to guarantee that the new fastmap is valid
-and conistent UBI has to take care that all IO which would cause EBA changes
-are blocked while attaching. Depending on flash chips this can take up to one
-second. Therefore, fastmap makes only sense on fast and large flash devices
-where a full scan takes too long. E.g. On 4GiB NAND chips a full scan takes
-several seconds whereas a fast attach needs less than one second.</p>
+<p>There is also some runtime overhead. In order to guarantee that the new fastmap is valid
+and consistent, UBI needs to make sure that all I/O which would cause EBA changes
+are blocked while attaching. Depending on the specific flash chips, this can take up to one
+second. Therefore, fastmap only makes sense on fast and large flash devices
+where a full scan would otherwise take too long. For example: on 4GiB NAND
+chips a full scan takes several seconds, whereas a fast attach needs less than
+one second.</p>
 
 
 <h4><a name="L_fastmap_notes">Notes</a></h4>
 
-<p>Enabling fastmap does not guarantee that every attach process can be done
-in a fast way. In some situations a full scan is still needed.
-This can happen in two cases, (i) if a power cut occurred while a fastmap was
-written to the flash or (ii) UBI ran out of PEBs while writing the fastmap.
-The latter case can happen if a massive amount of IO errors happen while writing
-and UBI cannot find an usable PEB.
+<p>Enabling fastmap does not guarantee that every attach process will be done
+in optimal time. In some situations a full scan is still needed.
+This can happen in two cases: (i) if an unexpected reboot occurs while a fastmap is being
+written to the flash or (ii) UBI runs out of PEBs while writing the fastmap.
+The latter case can happen if a massive amount of I/O errors happen while writing,
+and UBI cannot find enough usable PEBs.
 </p>
 
 
 <h2><a name="L_ubiblock">R/O block devices on top of UBI volumes</a></h2>
 
-<p>UBI allows to create block devices on top of UBI volumes with
+<p>UBI allows the creation of block devices on top of UBI volumes with
 the following limitations:</p>
 
 <ul>
@@ -1303,11 +1290,11 @@ the following limitations:</p>
 	    already serializes all I/O too.</li>
 </ul>
 
-<p>Despite these limitations, a block device is still very useful to mount
-read-only, regular file systems on top of UBI volumes. This is the case
-of squashfs, which can be used as a lightweigth read-only rootfs on a NAND
-device. The UBI layer will take care of things like bit-flips handling and
-wear-levelling.</p>
+<p>Despite these limitations, a block device is still very useful for the
+purpose of mounting read-only, regular file systems on top of UBI volumes.
+Take, for example, squashfs, which can be used as a lightweight read-only
+rootfs on top of a NAND device. In this case, the UBI layer will take care of
+low-level details such as bit-flip handling and wear-levelling.</p>
 
 
 <h4><a name="L_ubiblock_usage">Usage</a></h4>
@@ -1316,13 +1303,13 @@ wear-levelling.</p>
 attaching MTD devices to UBI. You can either use the <code>block</code> UBI
 module parameter or use the "<code>ubiblock</code>" user-space tool.</p>
 
-<p>In order to create a block device on bootup time (e.g. to mount the rootfs
+<p>In order to create a block device at bootup time (e.g. to mount the rootfs
 on such a block device) you can specify the <code>block</code> parameter as
-a kernel boot arguments:</p>
+a kernel boot argument:</p>
 
 <code>ubi.mtd=5 ubi.block=0,0 root=/dev/ubiblock0_0</code>
 
-<p>There are several ways if specifying a volume:</p>
+<p>There are several ways of specifying a volume:</p>
 <ul>
 	<li><p>Using the UBI volume path:</p>
 	<code>ubi.block=/dev/ubi0_0</code></li>
@@ -1330,11 +1317,11 @@ a kernel boot arguments:</p>
 	<li><p>Using the UBI device, and the volume name:</p>
 	<code>ubi.block=0,rootfs</code></li>
 
-	<li><p>Using both UBI device number and UBI volume number:</p>
+	<li><p>Using both the UBI device number and the UBI volume number:</p>
 	<code>ubi.block=0,0</code></li>
 </ul>
 
-<p>If you've built UBI as a module you can use this parameter at module
+<p>If you've built UBI as a module you can use the following parameters at module
 load time:</p>
 
 <pre>
@@ -1352,11 +1339,12 @@ $ ubiblock --remove /dev/ubi0_0
 
 <h2><a name="L_ubitest">UBI stress testing</a></h2>
 
-<p>If enabled, mtd-utils include user-space tools that can be used to stress
-test the UBI stack. This is useful if you want to test the stability and
-correctness of your particular UBI stack implementation.</p>
+<p>If enabled when configuring (right before building the code), mtd-utils
+includes user-space tools that can be used to stress test the UBI stack.
+This is useful if you want to test the stability and correctness of your
+particular UBI stack implementation.</p>
 
-<p>Example, running various UBI tests:</p>
+<p>Example: running various UBI tests:</p>
 
 <pre>
 $ flash_erase /dev/mtd3 0 0
@@ -1367,25 +1355,24 @@ $ /usr/libexec/mtd-utils/runubitests.sh /dev/ubi0
 
 <h2><a name="L_ubidoc">More documentation</a></h2>
 
-<p>Unfortunately, there are no thorough and strict UBI documents. But there is
-an old UBI design document which has some out-of-date information, but is still
-useful: <a href="ubidesign/ubidesign.pdf">ubidesign.pdf</a>.</p>
+<p>Unfortunately, no complete, up-to-date design documents exist for UBI. But there is
+an old UBI design document which has some out-of-date information which might
+still be of limited use: <a href="ubidesign/ubidesign.pdf">ubidesign.pdf</a>.</p>
 
 <p>There is also a PowerPoint UBI presentation available:
-<a href="ubi.ppt">ubi.ppt</a>. Note, this document has to be looked at
-in Windows, because it contains a lot of animation and Open Office cannot
-properly show it. Use slide show (<code>F5</code> key) when you look, because
-otherwise the animation is not shown.</p>
+<a href="ubi.ppt">ubi.ppt</a>. Note, this document contains a lot of
+animations, so be sure to view it in "slide show" mode (<code>F5</code> key)
+so that the animations will be played.</p>
 
-<p>Many useful information may be found at the
+<p>More information may be found in the
 <a href="../faq/ubi.html">FAQ</a> section.</p>
 
-<p>And of course just reading the UBI interface C header files which contains
-quite a few commentaries may help: <code>include/mtd/ubi-user.h</code>
+<p>And of course just reading the UBI interface C header files (which are
+well commented) may help: <code>include/mtd/ubi-user.h</code>
 contains the user-space interface definition (namely, it defines UBI ioctl
-commands and the involved data structures),
-<code>include/linux/mtd/ubi.h</code> defines the kernel API and the
-<code>drivers/mtd/ubi/kapi.c</code> file contains comments for each kernel API
+commands and the associated data structures),
+<code>include/linux/mtd/ubi.h</code> defines the kernel API, and
+<code>drivers/mtd/ubi/kapi.c</code> contains comments for each kernel API
 function (just above the body of the function).</p>
 
 <INCLUDE file="../inc/footer.tmpl" />
-- 
2.23.0.37.g745f681289


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
