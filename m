Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16HLaV-0008JW-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Dec 2001 09:03:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C1FD0DD.9A4F2CC8@comdev.cc> 
References: <3C1FD0DD.9A4F2CC8@comdev.cc> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: patch for 64 bit wide flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Dec 2001 09:14:13 +0000
Message-ID: <3698.1008926053@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

adam.wozniak@comdev.cc said:
> I've got a 64 bit wide flash consisting of eight 8bit wide chips.
> Here's a patch against the 2.4.16 kernel 

I'm a little concerned about the following bit - gcc is fairly crap at 
dealing with 64-bit datatypes. I'd prefer to do that only if it's 
necessary. Can we define a cfi_busword type which is only as big as we need 
- so it's only a __u64 if CONFIG_MTD_CFI_B8 is set?

@@ -337,9 +393,9 @@
  */
 static inline __u32 cfi_send_gen_cmd(u_char cmd, __u32 cmd_addr, __u32 base,
 				struct map_info *map, struct cfi_private *cfi,
-				int type, __u32 *prev_val)
+				int type, __u64 *prev_val)
 {
-	__u32 val;
+	__u64 val;
 	__u32 addr = base + cfi_build_cmd_addr(cmd_addr, CFIDEV_INTERLEAVE, type);
 
 	val = cfi_build_cmd(cmd, map, cfi);

--
dwmw2
