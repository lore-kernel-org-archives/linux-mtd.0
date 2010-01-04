Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRaXc-0001nt-5c
	for linux-mtd@lists.infradead.org; Mon, 04 Jan 2010 00:11:29 +0000
Received: by bwz4 with SMTP id 4so9171752bwz.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Jan 2010 16:11:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e14c53d91001031603h694291c1y5b008e86283d5a2d@mail.gmail.com>
References: <e14c53d91001031603h694291c1y5b008e86283d5a2d@mail.gmail.com>
Date: Sun, 3 Jan 2010 19:11:21 -0500
Message-ID: <e14c53d91001031611i736c54eev8636321d43f3f831@mail.gmail.com>
Subject: [PATCH] [MTD] WWW: Spelling correction in UBI FAQ
From: Lee Amirev <lee.amirev@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/alternative; boundary=0003255546b6a8fd0c047c4b8f8f
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0003255546b6a8fd0c047c4b8f8f
Content-Type: text/plain; charset=ISO-8859-1

diff --git a/faq/ubi.xml b/faq/ubi.xml
index 3a9c255..76ad9d9 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -707,7 +707,7 @@ $ modprobe nandsim second_id_byte=0x36
 <p>See <a href="nand.html#L_nand_nandsim">here</a> for more information
about
 the NAND simulator.</p>

-<p>To ensure that you have fake MTD devices, run "<code>cat
/prof/mtd</code>".
+<p>To ensure that you have fake MTD devices, run "<code>cat
/proc/mtd</code>".
 It should print something like</p>

 <pre>

--0003255546b6a8fd0c047c4b8f8f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">diff --git a/faq/ubi.xml b/faq/ubi.xml<br>index =
3a9c255..76ad9d9 100644<br>--- a/faq/ubi.xml<br>+++ b/faq/ubi.xml<br>@@ -70=
7,7 +707,7 @@ $ modprobe nandsim second_id_byte=3D0x36<br>=A0&lt;p&gt;See &=
lt;a href=3D&quot;nand.html#L_nand_nandsim&quot;&gt;here&lt;/a&gt; for more=
 information about<br>

=A0the NAND simulator.&lt;/p&gt;<br>=A0<br>-&lt;p&gt;To ensure that you hav=
e fake MTD devices, run &quot;&lt;code&gt;cat /prof/mtd&lt;/code&gt;&quot;.=
<br>+&lt;p&gt;To ensure that you have fake MTD devices, run &quot;&lt;code&=
gt;cat /proc/mtd&lt;/code&gt;&quot;.<br>

=A0It should print something like&lt;/p&gt;<br>=A0<br>=A0&lt;pre&gt;<br>
</div><br>

--0003255546b6a8fd0c047c4b8f8f--
