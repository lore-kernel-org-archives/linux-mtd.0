Received: from smtp.zeuux.org ([210.51.160.52] helo=z.billxu.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9qfh-0004ll-Rq
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 00:41:54 +0000
Date: Tue, 9 Dec 2008 08:32:25 +0800
From: Jianjun Kong <jianjun@zeuux.org>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH] fs: cleanup for fs/jffs2/compr_rubin.c
Message-ID: <20081209003225.GA7198@ubuntu>
References: <20081208150554.GA22245@ubuntu>
	<Pine.LNX.4.64.0812081637370.5170@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0812081637370.5170@vixen.sonytel.be>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 08, 2008 at 04:39:20PM +0100, Geert Uytterhoeven wrote:
>On Mon, 8 Dec 2008, Jianjun Kong wrote:
>> fs: cleanup for fs/jffs2/compr_rubin.c

<sign> 
  
>> -	for (i=0;i<8;i++) {
>> -		ret = encode(rs, rs->bit_divider-rs->bits[i],rs->bits[i],byte&1);
>> +	for (i=0; i<8; i++) {
>
>scripts/checkpatch.pl still complains:
>
>ERROR: spaces required around that '=' (ctx:VxV)
>#47: FILE: fs/jffs2/compr_rubin.c:236:
>+       for (i=0; i<8; i++) {
>              ^
>ERROR: spaces required around that '<' (ctx:VxV)
>#47: FILE: fs/jffs2/compr_rubin.c:236:
>+       for (i=0; i<8; i++) {
>                   ^
>> +		ret = encode(rs, rs->bit_divider-rs->bits[i], rs->bits[i], byte&1);
>
>WARNING: line over 80 characters

Thanks for your reply. 
Another new patch.

>From f52c81569442247b530abfdf123d2a1f44619300 Mon Sep 17 00:00:00 2001
From: Jianjun Kong <jianjun@zeuux.org>
Date: Tue, 9 Dec 2008 08:24:31 +0800
Subject: [PATCH] fs: cleanup for fs/jffs2/compr_rubin.c

remove duplicated #include and other clean

Signed-off-by: Jianjun Kong <jianjun@zeuux.org>
Reported-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
---
 fs/jffs2/compr_rubin.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index c73fa89..35f1652 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -24,8 +24,6 @@
 #define BIT_DIVIDER_MIPS 1043
 static int bits_mips[8] = { 277,249,290,267,229,341,212,241}; /* mips32 */
 
-#include <linux/errno.h>
-
 struct pushpull {
 	unsigned char *buf;
 	unsigned int buflen;
@@ -157,7 +155,8 @@ static void init_decode(struct rubin_state *rs, int div, int *bits)
 	/* behalve lower */
 	rs->rec_q = 0;
 
-	for (rs->bit_number = 0; rs->bit_number++ < RUBIN_REG_SIZE; rs->rec_q = rs->rec_q * 2 + (long) (pullbit(&rs->pp)))
+	for (rs->bit_number = 0; rs->bit_number++ < RUBIN_REG_SIZE;
+		rs->rec_q = rs->rec_q * 2 + (long) (pullbit(&rs->pp)))
 		;
 }
 
@@ -241,7 +240,7 @@ static int out_byte(struct rubin_state *rs, unsigned char byte)
 			*rs = rs_copy;
 			return ret;
 		}
-		byte=byte>>1;
+		byte >>= 1;
 	}
 	return 0;
 }
-- 
1.5.6.3

-- 
Jianjun Kong |Happy Hacking
Homepage: http://kongove.cn
Gtalk:kongjianjun@gmail.com
