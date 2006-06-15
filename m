Received: from moutng.kundenserver.de ([212.227.126.183])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fqn3S-00006L-Uy
	for linux-mtd@lists.infradead.org; Thu, 15 Jun 2006 04:18:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by comm-neu.esd (Postfix) with ESMTP id 72B911097AD
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jun 2006 10:16:02 +0200 (CEST)
Received: from comm-neu.esd ([127.0.0.1])
	by localhost (comm [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 23115-02-13 for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jun 2006 10:16:02 +0200 (CEST)
Received: from [10.0.18.190] (pc-linux-dev.esd [10.0.18.190])
	by comm-neu.esd (Postfix) with ESMTP id 2753C1097A4
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jun 2006 10:16:02 +0200 (CEST)
Message-ID: <44911741.50205@esd-electronics.com>
Date: Thu, 15 Jun 2006 10:16:01 +0200
From: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: Add support for the CPCI405 board
References: <449017E0.7070008@esd-electronics.com>
	<1150315948.11159.182.camel@shinybook.infradead.org>
In-Reply-To: <1150315948.11159.182.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

David Woodhouse wrote:
> Please could you send the SST39VF3201 support separately? 
See below.
> 
> I want to stop adding map drivers -- any reason you can't use physmap?
No special reason. Just by habit.

> Either with a platform_device, or preferably by extending it to use an
> of_device too, since this is a PPC platform.
Ok, I will take a look at that. Probably cloning katana_setup_mtd() from
the katana board will be just fine.

Regards
Matthias

Signed-off-by: Matthias Fuchs <matthias.fuchs@esd-electronics.com>

---

diff --git a/drivers/mtd/chips/jedec_probe.c
b/drivers/mtd/chips/jedec_probe.c
index 517ea33..f99f73e 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -147,6 +147,7 @@ #define SST29LE512  0x003d
  #define SST39LF800     0x2781
  #define SST39LF160     0x2782
  #define SST39VF1601    0x234b
+#define SST39VF3201    0x235b
  #define SST39LF512     0x00D4
  #define SST39LF010     0x00D5
  #define SST39LF020     0x00D6
@@ -1483,6 +1484,22 @@ static const struct amd_flash_info jedec
                 }

         }, {
+               .mfr_id         = MANUFACTURER_SST,     /* should be CFI */
+               .dev_id         = SST39VF3201,
+               .name           = "SST 39VF3201",
+               .uaddr          = {
+                       [0] = MTD_UADDR_0x5555_0x2AAA,  /* x8 */
+                       [1] = MTD_UADDR_0x5555_0x2AAA   /* x16 */
+               },
+               .DevSize        = SIZE_4MiB,
+               .CmdSet         = P_ID_AMD_STD,
+               .NumEraseRegions= 2,
+               .regions        = {
+                       ERASEINFO(0x1000,512),
+                       ERASEINFO(0x1000,512)
+               }
+
+       }, {
                 .mfr_id         = MANUFACTURER_ST,      /* FIXME - CFI
device? */
                 .dev_id         = M29W800DT,
                 .name           = "ST M29W800DT",
