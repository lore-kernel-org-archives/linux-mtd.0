Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGre-0000jE-Ip
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:35:06 +0000
Received: by bwz4 with SMTP id 4so12357618bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 07:35:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB59301E1EB4063@dbde02.ent.ti.com>
References: <ce9ab5791001060600q1bef6ff5x602519e7db9e145@mail.gmail.com>
	<B85A65D85D7EB246BE421B3FB0FBB59301E1EB4063@dbde02.ent.ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 8 Jan 2010 21:04:41 +0530
Message-ID: <ce9ab5791001080734y31a0a48cya64e7fa8a6527e30@mail.gmail.com>
Subject: Re: [PATCH 1/3][NAND][OMAP]: Fixing compilation warning for
	'nand/omap2.c'
To: "Premi, Sanjeev" <premi@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 8, 2010 at 8:31 PM, Premi, Sanjeev <premi@ti.com> wrote:
>> -----Original Message-----
>> From: linux-omap-owner@vger.kernel.org
>> [mailto:linux-omap-owner@vger.kernel.org] On Behalf Of Vimal Singh
>> Sent: Wednesday, January 06, 2010 7:30 PM
>> To: Linux MTD
>> Cc: linux-omap@vger.kernel.org
>> Subject: [PATCH 1/3][NAND][OMAP]: Fixing compilation warning
>> for 'nand/omap2.c'
>>
>> From 3e856346f93afaf3f519dffe7987e4bbf56a136d Mon Sep 17 00:00:00 2001
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Tue, 5 Jan 2010 12:49:24 +0530
>> Subject: [PATCH] Fixing compilation warning for 'nand/omap2.c'
>>
>> Fixing below warning in compilation:
>> drivers/mtd/nand/omap2.c: In function 'omap_write_buf_dma_pref':
>> drivers/mtd/nand/omap2.c:508: warning: passing argument 2 of
>> 'omap_nand_dma_transfer' discards qualifiers from pointer target type
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>> =A0drivers/mtd/nand/omap2.c | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 1bb799f..4eea97c 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -505,7 +505,7 @@ static void
>> omap_write_buf_dma_pref(struct mtd_info *mtd,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_write_buf_pref(mtd, buf, len);
>> =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* start transfer in DMA mode */
>> - =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, buf, len, 0x1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, (u_char *) buf, le=
n, 0x1);
>> =A0}
>
> Vimal,
>
> I had posted the fix in DEC. Did you miss it?
> http://lists.infradead.org/pipermail/linux-mtd/2009-December/028373.html
>

I did. But I wanted to have all of these together. In fact I had
posted a patch for this sometime back, which was handling this quite
differently.
http://patchwork.kernel.org/patch/57235/


--=20
Regards,
Vimal Singh
