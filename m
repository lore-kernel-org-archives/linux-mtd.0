Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TnP5Y-0005N1-Ut
 for linux-mtd@lists.infradead.org; Tue, 25 Dec 2012 07:38:13 +0000
Received: by mail-wi0-f171.google.com with SMTP id hn14so6708246wib.16
 for <linux-mtd@lists.infradead.org>; Mon, 24 Dec 2012 23:38:09 -0800 (PST)
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd-www: remove any references to
 dtype/UBI_SHORTTERM/UBI_LONGTTERM
Date: Tue, 25 Dec 2012 09:37:05 +0200
Message-Id: <1356421025-10968-1-git-send-email-shmulik.ladkani@gmail.com>
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These no longer exist.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
1. Artem, this patch completely removes these parts of the documentation.
 Would you prefer to keep, with a statement they no longer exist since
 [whatever kernel version]?
2. Piggy backed is a tiny style fix at the affected area: </p>. to .</p>
 I assumed no need for a separate patch, but let me know if you prefer a
 separate patch.

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 13b8174..d912b8f 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -974,28 +974,7 @@ go to the mapped PEB.</p>
 <p>The LEB map operation is available via the <code>ubi_leb_map()</code>
 UBI kernel API function, or via the <code>UBI_IOCEBMAP</code> volume character
 device ioctl command. However, thie ioctl interface is available only starting
-from kernel version <code>2.6.29</code></p>.
-
-<p>The LEB map operation accepts the <code>dtype</code> parameter which suggests
-UBI which type of data the LEB will contain. Namely, <code>dtype</code> may be
-one of:</p>
-
-<ul>
-	<li><code>UBI_SHORTTERM</code> - the LEB will store short-term data,
-	which means that it will be erased soon; UBI will map this LEB to a
-	PEB with low erase counter, so it will grow relative to other PEB
-	erase counters;</li>
-	<li><code>UBI_LONGTTERM</code> - the LEB will store long-term data and
-	will not be erased soon; UBI will map this LEB to a PEB with high erase
-	counter, so it will go down relative to other PEB erase counters;</li>
-	<li><code>UBI_UNKNOWN</code> - should be used most of the time, when
-	you are not sure whether the data are long-term or short term.</li>
-</ul>
-
-<p>Bear in mind that <code>dtype</code> is only a hint. Please, use
-<code>UBI_UNKNOWN</code> if unsure. And note, UBI authors never really tested
-the effects of using <code>UBI_SHORTTERM</code> and <code>UBI_LONGTTERM</code>,
-so there is not guarantee they improve anything.</p>
+from kernel version <code>2.6.29</code>.</p>
 
 <p>One of the possible use-cases of the LEB map operation is making sure the
 old LEB contents goes away forever. As it was explained in
@@ -1109,8 +1088,6 @@ struct ubi_leb_change_req req;
 
 req.lnum = lnum_to_change;
 req.len = data_len;
-req.dtype = UBI_LONGTERM;  /* data persistency (may also be UBI_SHORTTERM
-                              and UBI_UNKNOWN) */
 fd = open("/dev/my_volume");
 ioctl(fd, UBI_IOCEBCH, &amp;req);
 write(fd, data_buf, data_len);
-- 
1.7.9
