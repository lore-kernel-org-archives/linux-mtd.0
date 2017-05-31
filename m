Received: from serv1.kernkonzept.com ([88.99.87.17] helo=mx.kernkonzept.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG5Gg-0007jD-5H
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 15:10:40 +0000
Subject: Re: [PATCH] Fix typo in comment.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, han.xu@nxp.com,
 computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org
References: <1496130091-2363-1-git-send-email-matthias.lange@kernkonzept.com>
 <20170531112255.1073ca9a@bbrezillon>
From: Matthias Lange <matthias.lange@kernkonzept.com>
Message-ID: <ed4d18bf-a18a-ea5c-5fc0-79a60fb3f2ee@kernkonzept.com>
Date: Wed, 31 May 2017 17:07:54 +0200
MIME-Version: 1.0
In-Reply-To: <20170531112255.1073ca9a@bbrezillon>
Content-Type: multipart/mixed; boundary="------------AA5669A06062FA5A66FD71C2"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------AA5669A06062FA5A66FD71C2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Boris,

please consider the new version of the commit.

Best,
Matthias.


On 05/31/2017 11:22 AM, Boris Brezillon wrote:
> Hi Mattias,
> 
> On Tue, 30 May 2017 09:41:31 +0200
> Matthias Lange <matthias.lange@kernkonzept.com> wrote:
> 
> Commit title should be prefixed with "mtd: nand: gpmi: ".
> 
>> Signed-off-by: Matthias Lange <matthias.lange@kernkonzept.com>
>> ---
>>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> index 141bd70..41f53ae 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> @@ -932,7 +932,7 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
>>  
>>  	nand->select_chip(mtd, 0);
>>  
>> -	/* [1] send SET FEATURE commond to NAND */
>> +	/* [1] send SET FEATURE command to NAND */
>>  	feature[0] = mode;
>>  	ret = nand->onfi_set_features(mtd, nand,
>>  				ONFI_FEATURE_ADDR_TIMING_MODE, feature);

--------------AA5669A06062FA5A66FD71C2
Content-Type: text/x-patch;
 name="0001-mtd-nand-gpmi-fix-typo-in-comment.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mtd-nand-gpmi-fix-typo-in-comment.patch"

>From 09b2ba7b74617888376e1e8022b1e68d022473a9 Mon Sep 17 00:00:00 2001
From: Matthias Lange <matthias.lange@kernkonzept.com>
Date: Tue, 30 May 2017 09:35:03 +0200
Subject: [PATCH] mtd: nand: gpmi: fix typo in comment

Signed-off-by: Matthias Lange <matthias.lange@kernkonzept.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 141bd70..41f53ae 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -932,7 +932,7 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 
 	nand->select_chip(mtd, 0);
 
-	/* [1] send SET FEATURE commond to NAND */
+	/* [1] send SET FEATURE command to NAND */
 	feature[0] = mode;
 	ret = nand->onfi_set_features(mtd, nand,
 				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
-- 
2.7.4


--------------AA5669A06062FA5A66FD71C2--
