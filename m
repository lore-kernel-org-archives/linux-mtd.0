Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKzVb-0002gU-RC
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 18:21:52 +0000
Message-ID: <49664427.7060801@grandegger.com>
Date: Thu, 08 Jan 2009 19:21:27 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] CFI: remove major/minor version check for command set
	0x0002
References: <496624A4.3050808@grandegger.com>
	<alpine.LFD.2.00.0901081134110.6007@xanadu.home>
	<1231433317.28362.77.camel@macbook.infradead.org>
	<4966310C.1010103@grandegger.com>
	<alpine.LFD.2.00.0901081237460.6007@xanadu.home>
In-Reply-To: <alpine.LFD.2.00.0901081237460.6007@xanadu.home>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> On Thu, 8 Jan 2009, Wolfgang Grandegger wrote:
> 
>> David Woodhouse wrote:
>>> On Thu, 2009-01-08 at 11:47 -0500, Nicolas Pitre wrote:
>>>>> The NOR Flash memory K8P2815UQB from Samsung uses the major version
>>>>> number '0', which seems to be unusual but not illegal, IIUC. This
>>>>> patch removes the major-minor version check to get this Flash memory
>>>>> supported as well.
>>>> Instead of removing the test entirely, I'd suggest you augment it with 
>>>> the manufacturer ID (cfi->mfr and cfi->id).  Or better yet, just use 
>>>> that information to fix up the version number to something sensible.
>>> Couldn't you use a quirk to do the latter?
>> The major/minor version number is not used anywhere else and therefore a
>> quirk seems to be overkill too me.
> 
> Please look again.  Searching for "MinorVersion" turns up a couple 
> places.
> 
> A quirk is not overkill at all.  To the contrary it's the whole purpose 
> of quirks to fix up things like this.

I see.

> Although, in this case, I think quirks are evaluated only after the CFI 
> version is tested, meaning that the fixup might have to be done inline.

Yep, the patch below introduces cfi_fixup_major_minor() to do the quirk. 
What do you think now?

Wolfgang.

---
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++++++++
 include/linux/mtd/cfi.h             |    1 +
 2 files changed, 11 insertions(+)

Index: linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.6.orig/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -322,6 +322,14 @@ static struct cfi_fixup fixup_table[] = 
 };
 
 
+static void cfi_fixup_major_minor(struct cfi_private *cfi, 
+				  struct cfi_pri_amdstd *extp)
+{
+	if (cfi->mfr == CFI_MFR_SAMSUNG && cfi->id == 0x257e &&
+	    extp->MajorVersion == '0')
+		extp->MajorVersion = '1';
+}
+
 struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -363,6 +371,8 @@ struct mtd_info *cfi_cmdset_0002(struct 
 			return NULL;
 		}
 
+		cfi_fixup_major_minor(cfi, extp);
+
 		if (extp->MajorVersion != '1' ||
 		    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
 			printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
Index: linux-2.6/include/linux/mtd/cfi.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/cfi.h
+++ linux-2.6/include/linux/mtd/cfi.h
@@ -520,6 +520,7 @@ struct cfi_fixup {
 
 #define CFI_MFR_AMD 0x0001
 #define CFI_MFR_ATMEL 0x001F
+#define CFI_MFR_SAMSUNG 0x00EC
 #define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
 
 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
