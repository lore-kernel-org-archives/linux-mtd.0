Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSWlB-0002DX-9D
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 15:58:06 +0000
Received: by bwz1 with SMTP id 1so2642602bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 08:58:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTikNC8F2TPY2TFHuHtU=-xhwef2ikw@mail.gmail.com>
References: <1307078050.4167.1.camel@phoenix>
	<BANLkTikNC8F2TPY2TFHuHtU=-xhwef2ikw@mail.gmail.com>
Date: Fri, 3 Jun 2011 23:58:03 +0800
Message-ID: <BANLkTin5oTOEq_t+NDHGOdtG5e0Mam9BLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: fix a memory leak
From: Lei Wen <adrian.wenl@gmail.com>
To: Daniel Mack <zonque@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd@lists.infradead.org, Axel Lin <axel.lin@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 3, 2011 at 9:02 PM, Daniel Mack <zonque@gmail.com> wrote:
> (Cc Lei Wen)
>
> On Fri, Jun 3, 2011 at 7:14 AM, Axel Lin <axel.lin@gmail.com> wrote:
>> In pxa3xx_nand_remove, we should call nand_release instead of
>> mtd_device_unregister to properly free bad block table memory
>> and bad block descriptor memory.
>>
>> Signed-off-by: Axel Lin <axel.lin@gmail.com>
>> ---
>> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 1fb3b3a..f7040ea 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -1119,7 +1119,7 @@ static int pxa3xx_nand_remove(struct platform_devi=
ce *pdev)
>> =A0 =A0 =A0 =A0clk_put(info->clk);
>>
>> =A0 =A0 =A0 =A0if (mtd) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd_device_unregister(mtd);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_release(mtd);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(mtd);
>> =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0return 0;
>> --
>> 1.7.4.1
>>

Acked-by: Lei Wen <leiwen@marvell.com>
