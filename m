From: kschoo70c@netscape.net (kokseng choo)
Date: Mon, 17 Feb 2003 12:36:58 +0000
Subject: copy filesystem to nand flash without ecc
References: <4EF56021.2C81712E.0265FBE9@netscape.net> <200302131752.54716.tglx@linutronix.de>
Message-ID: <3E50D76A.40300@netscape.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--------------030901020400030402000706
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



tglx at linutronix.de wrote:

>On Thursday 13 February 2003 12:16, Kschoo70C at netscape.net wrote:
>  
>
>>Hi,
>>     I notice some update on the JFFS2 out of band usage in
>>http://www.linux-mtd.infradead.org/tech/nand.html,
>>whereby the offset 0x4 used to be ECC valid marker has been made obsolete.
>>In this case, if I write a jffs image to the mtd device without adding the
>>ECC in the out of band area, the nand driver will not know about that. The
>>question here is, what is the consequence of writing an image without
>>adding the ecc to the out of band area ? Isn't it true the jffs2 file
>>system always uses read_ecc and write_ecc when the flash type is nand ?
>>    
>>
>True.
>You will get a endless bunch of ECC failure warnings. They will go away,
>if you copy files around. As ECC is essential for NAND, we removed the
>non ECC stuff for JFFS2 :)
>
>  
>
I look into the nand.c code, and I found that the difficulty of ecc handling 
is due to the fact that nand has to support both YAFFS and JFFS2,
while both of the filesystem use the different oob offset to store the ecc.
Meanwhile, if the ecc_mode is set and the oobsel=0, then this will cause 
ecc error. In another word, pwrite could not do the job as we expected.

I also notice that nand.h also define the ecc location for 
oobsel=NAND_NONE_OOB, which in fact exactly the same as that of JFFS2. 
Why don't we just add those definitions in  oobconfigs[0] instead of 
zeroing it? Since a nand driver without ECC is really a bad idea which 
makes nand_write thus pwrite becomes useless. Can we just have a default 
"oobsel" during compile time?; which means explicitly 
define oobconfigs[0] to either JFFS2 or YAFFS or zero through configuration. 
By doing that, the mtd user does not have to use different API or ioctl 
to write to the flash. The "cp" utils will just work.

As a mtd user at userspace, ideally I would like to use the same pwrite() 
function for the flash, and I wish I do not have to know what is the 
flash type I am talking to. All I need to know is I am talking to a 
mtd device, and I do not have to know anything about ECC, just let 
the driver handle is implicitly.

I attach a patch which add the default entry for oobconfig[0], I think 
it will help me a bit as a mtd and JFFS2 user at userspace.

Please comment if it does not make sense, thank you.


regards
choo


-- 
Your favorite stores, helpful shopping tools and great gift ideas. 
Experience the convenience of buying online with Shop at Netscape! 
http://shopnow.netscape.com/


--------------030901020400030402000706
Content-Type: text/plain;
 name="nand_c_patch.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand_c_patch.txt"

--- nandOrg.c   Mon Feb 17 10:59:07 2003
+++ nandPatch.c Mon Feb 17 11:06:08 2003
@@ -136,6 +136,7 @@
 #include <linux/interrupt.h>
 #include <asm/io.h>
 
+
 /*
  * Macros for low-level register control
  */
@@ -147,7 +148,8 @@
  * out of band configuration for different filesystems
  */
 static int oobconfigs[][6] = {
-   { 0,0,0,0,0,0},
+    { NAND_NOOB_ECCPOS0, NAND_NOOB_ECCPOS1, NAND_NOOB_ECCPOS2,
+      NAND_NOOB_ECCPOS3, NAND_NOOB_ECCPOS4, NAND_NOOB_ECCPOS5},
 
    { NAND_JFFS2_OOB_ECCPOS0, NAND_JFFS2_OOB_ECCPOS1, NAND_JFFS2_OOB_ECCPOS2,
    NAND_JFFS2_OOB_ECCPOS3, NAND_JFFS2_OOB_ECCPOS4, NAND_JFFS2_OOB_ECCPOS5 },
@@ -361,7 +363,8 @@
 {
    int     i, status;
    u_char  ecc_code[6], *oob_data;
-   int eccmode = oobsel ? this->eccmode : NAND_ECC_NONE;
+   //int   eccmode = oobsel ? this->eccmode : NAND_ECC_NONE;
+   int eccmode = this->eccmode;
    int     *oob_config = oobconfigs[oobsel];
 

--------------030901020400030402000706--
