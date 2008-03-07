Received: from an-out-0708.google.com ([209.85.132.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXgvh-0004ln-Sv
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 18:04:26 +0000
Received: by an-out-0708.google.com with SMTP id c3so139951ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Mar 2008 10:04:23 -0800 (PST)
Message-Id: <EEE80EFD-230F-49B5-94A7-F9E533B591DF@gmail.com>
From: chris mcharg <chris.mcharg@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: [PATCH][MTD-UTILS] nanddump: fix badblock oob output
Date: Sat, 8 Mar 2008 03:04:20 +0900
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Was looking over the nanddump code and it appears that the incorrect  
buffer is being 0xffed when outputting badblock oob data.

I haven't actually run nanddump yet and so haven't tested, but it  
seems simple enough so I've included the patch below.

Cheers,

Chris

----

--- a/nanddump.c
+++ b/nanddump.c
@@ -335,7 +335,7 @@ int main(int argc, char **argv)
                         continue;

                 if (badblock) {
-                       memset (readbuf, 0xff, meminfo.oobsize);
+                       memset (oobbuf, 0xff, meminfo.oobsize);
                 } else {
                         /* Read OOB data and exit on failure */
                         oob.start = ofs;
