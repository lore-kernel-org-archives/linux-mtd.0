Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N854c-0005c0-56
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 04:44:54 +0000
Received: by bwz4 with SMTP id 4so704733bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Nov 2009 20:44:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1257863063.21596.765.camel@localhost>
References: <ce9ab5790910292321nf230810v353c23f9c1ce1931@mail.gmail.com>
	<ce9ab5790910300142s615c7d59h15bb2d46d4f76574@mail.gmail.com>
	<1257236323.21596.56.camel@localhost>
	<ce9ab5790911030038p31bb69cfs1ba86cd70b243e4c@mail.gmail.com>
	<1257237728.21596.65.camel@localhost>
	<ce9ab5790911030101t256e49e8iaf26c733e6472157@mail.gmail.com>
	<1257863063.21596.765.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 11 Nov 2009 10:14:29 +0530
Message-ID: <ce9ab5790911102044h32aa5818t3a76edad324634a7@mail.gmail.com>
Subject: Re: [PATCH 1/3] Fixing compilation warning for 'nand/omap2.c'
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 10, 2009 at 7:54 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2009-11-03 at 14:31 +0530, Vimal Singh wrote:
>> >> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> >> index 090ab87..92573d5 100644
>> >> --- a/drivers/mtd/nand/omap2.c
>> >> +++ b/drivers/mtd/nand/omap2.c
>> >> @@ -501,11 +501,13 @@ static void omap_read_buf_dma_pref(struct
>> >> mtd_info *mtd, u_char
>> >
>> > :-) It is the same again.
>> >
>> > Try to send the e-mail to yourself, then save it and apply with git-am=
.
>> > If it works, send to the mailing list.
>>
>> Below patch applies. Sorry for noise... :(
>>
>> Thanks,
>> vimal
>>
>>
>> From eebbd81141b196af2dc3f7a2650ce16b6b0d76ae Mon Sep 17 00:00:00 2001
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Fri, 30 Oct 2009 11:31:34 +0530
>> Subject: [PATCH] Fixing compilation warning for 'nand/omap2.c'
>>
>> Fixing below warning in compilation:
>> drivers/mtd/nand/omap2.c: In function 'omap_write_buf_dma_pref':
>> drivers/mtd/nand/omap2.c:508: warning: passing argument 2 of
>> 'omap_nand_dma_transfer' discards qualifiers from pointer target type
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>> =A0drivers/mtd/nand/omap2.c | =A0 =A06 ++++--
>> =A01 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 090ab87..92573d5 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -501,11 +501,13 @@ static void omap_read_buf_dma_pref(struct
>> =A0static void omap_write_buf_dma_pref(struct mtd_info *mtd,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 const u_char *buf, int len)
>> =A0{
>> + =A0 =A0 u_char *p =3D (u_char *)buf;
>> +
>> =A0 =A0 =A0 if (len <=3D mtd->oobsize)
>> - =A0 =A0 =A0 =A0 =A0 =A0 omap_write_buf_pref(mtd, buf, len);
>> + =A0 =A0 =A0 =A0 =A0 =A0 omap_write_buf_pref(mtd, p, len);
>> =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* start transfer in DMA mode */
>> - =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, buf, len, 0x1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, p, len, 0x1);
>> =A0}
>>
>> =A0/**
>
> BTW, this patch is still corrupted for me. And it is strange that I do
> not see it in the archives, so I cannot check is this my setup which is
> guilty, or it is you sending the patches incorrectly:
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-November/027918.html

Here is the patch once again:

Fixing below warning in compilation:
drivers/mtd/nand/omap2.c: In function 'omap_write_buf_dma_pref':
drivers/mtd/nand/omap2.c:508: warning: passing argument 2 of
'omap_nand_dma_transfer' discards qualifiers from pointer target type

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/omap2.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 090ab87..92573d5 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -501,11 +501,13 @@ static void omap_read_buf_dma_pref(struct
 static void omap_write_buf_dma_pref(struct mtd_info *mtd,
 					const u_char *buf, int len)
 {
+	u_char *p =3D (u_char *)buf;
+
 	if (len <=3D mtd->oobsize)
-		omap_write_buf_pref(mtd, buf, len);
+		omap_write_buf_pref(mtd, p, len);
 	else
 		/* start transfer in DMA mode */
-		omap_nand_dma_transfer(mtd, buf, len, 0x1);
+		omap_nand_dma_transfer(mtd, p, len, 0x1);
 }

 /**
