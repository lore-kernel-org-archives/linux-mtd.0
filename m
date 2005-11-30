Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EhNjt-0008UI-Pk
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2005 03:55:01 -0500
Message-ID: <438D68DD.9060400@ru.mvista.com>
Date: Wed, 30 Nov 2005 11:54:53 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
References: <20051129180204.2f79e2ae.vwool@ru.mvista.com>
	<200511301112.14512.manningc2@actrix.gen.nz>
In-Reply-To: <200511301112.14512.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Charles,

I've kept the read_ecc/read_oob interface as it was. The reasons behind are:
- permitting NULL data for read_ecc in order to facilitate pure OOB read 
will overcomplicate the implementation and will require API change (i. 
e. how much of the OOB to read, at least)
- read_oob provides additional capabilities like reading the OOB from a 
specified offset.

The problem remaining is that yaffs2 can/t work unmodified with my 
target (ARM926-based board with Sandisk NAND flash controller).
The reason is that the HW ECC engine uses 40 bytes per 2k page so the 
remaining amount of OOB is no more than 23 (64 - 40 - 1 byte for 
badblockpos). On the other hand, yaffs_PackedTags2 size is 28 bytes, so 
I'm in trouble.
What I suggest to overcome this issue is:
- use "__attribute__ (packed) " for all the structures put into the OOB;
- limit the number of bits for yaffs_PackedTags2TagsPart and members.

For instance, the patch inlined reduces the size of yaffs_PackedTags2 to 
12 bytes without impacting the functionality.
One may say that using "packed" limits the portability, but I will argue 
that statement since the alignments within the structure may also change 
from compiler to compiler and from arch to arch (i. e. GNU ABI vs EABI 
for ARM). So the best way would be not to mess with the structures for 
packed tags at all, but as for now, I'm worried just about reducing the 
size of yaffs_PackedTags2 :)

Best regards,
   Vitaly

diff -uNr linux.orig/fs/yaffs2/yaffs_ecc.h linux/fs/yaffs2/yaffs_ecc.h
--- linux.orig/fs/yaffs2/yaffs_ecc.h    2005-11-24 16:51:17.000000000 +0300
+++ linux/fs/yaffs2/yaffs_ecc.h    2005-11-30 11:05:18.000000000 +0300
@@ -26,10 +26,10 @@
 #ifndef __YAFFS_ECC_H__
 #define __YAFFS_ECC_H__
 
-typedef struct {
+typedef struct __attribute__((packed)) {
     unsigned char colParity;
-    unsigned lineParity;
-    unsigned lineParityPrime;
+    unsigned short lineParity:12;
+    unsigned short lineParityPrime:12;
 } yaffs_ECCOther;
 
 void yaffs_ECCCalculate(const unsigned char *data, unsigned char *ecc);
diff -uNr linux-2.6.10.orig/fs/yaffs2/yaffs_packedtags2.h 
linux-2.6.10/fs/yaffs2/yaffs_packedtags2.h
--- linux-2.6.10.orig/fs/yaffs2/yaffs_packedtags2.h    2005-11-24 
16:51:17.000000000 +0300
+++ linux-2.6.10/fs/yaffs2/yaffs_packedtags2.h    2005-11-30 
11:04:52.000000000 +0300
@@ -6,14 +6,14 @@
 #include "yaffs_guts.h"
 #include "yaffs_ecc.h"
 
-typedef struct {
-    unsigned sequenceNumber;
-    unsigned objectId;
-    unsigned chunkId;
-    unsigned byteCount;
+typedef struct __attribute__((packed)) {
+    unsigned short sequenceNumber;
+    unsigned short objectId;
+    unsigned short chunkId;
+    unsigned short byteCount;
 } yaffs_PackedTags2TagsPart;
 
-typedef struct {
+typedef struct __attribute__((packed)) {
     yaffs_PackedTags2TagsPart t;
     yaffs_ECCOther ecc;
 } yaffs_PackedTags2;

Charles Manning wrote:

>On Wednesday 30 November 2005 04:02, Vitaly Wool wrote:
>  
>
>>Hi,
>>
>>the patch below implements treating the OOB data as a chunk of _free_ OOB
>>bytes of mtd->oobavail size. This is what was announced several times. This
>>patch is a working one (verified with yaffs2 and jffs2), however, it's not
>>completely ready to work with 16bit NAND flashes. Anyway, I'd like to ask
>>for a permission to commit it to let other people start using it/report the
>>problems/etc. etc.
>>
>>Of course input of any kind is welcome.
>>
>>Best regards,
>>   Vitaly
>>    
>>
>
>
>Bloody Marvelous! This is very good news for the yaffs folk.
>
>My only concern/query is a taste issue:
>Should the read_oob funtion be used to do the available read or should is it 
>better to use a different function like read_ecc() using NULL for the data 
>argument?
>
>I have enumerated what I believe to be the pros and cons a few times, and I 
>prefer using read_ecc with NULL because this is unambiguous.
>
>However this is a taste issue and to me having a solution is better than 
>having an argument!
>
>-- CHarles
>
>
>  
>
