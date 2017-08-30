Received: from da1vs04.rockwellcollins.com ([205.175.227.52])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dn82x-0008Rn-Mf
 for linux-mtd@lists.infradead.org; Wed, 30 Aug 2017 18:49:05 +0000
Received: by mail-yw0-f200.google.com with SMTP id e9so13151724ywh.8
 for <linux-mtd@lists.infradead.org>; Wed, 30 Aug 2017 11:48:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <HE1PR04MB124123999DA6E9CEE905F890979C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1504036047-38848-1-git-send-email-matthew.weber@rockwellcollins.com>
 <HE1PR04MB124123999DA6E9CEE905F890979C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Date: Wed, 30 Aug 2017 13:48:20 -0500
Message-ID: <CAB0kKmzppQu7i8gqp_Q-5NYoPLoEbBJy2Bgdawv7Ek6OgWav2w@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: map: new driver for NXP IFC
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "arnd@arndb.de" <arnd@arndb.de>, Scott Wood <oss@buserror.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Prabhakar,

On Tue, Aug 29, 2017 at 7:37 PM, Prabhakar Kushwaha
<prabhakar.kushwaha@nxp.com> wrote:
> Dear Matt,
>
>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
>> Matt Weber
>> Sent: Wednesday, August 30, 2017 1:17 AM
>> To: linux-mtd@lists.infradead.org
>> Cc: Matt Weber <matthew.weber@rockwellcollins.com>; boris.brezillon@free-
>> electrons.com; Sanjay Tandel <sanjay.tandel@rockwellcollins.com>;
>> arnd@arndb.de
>> Subject: [PATCH v2] mtd: map: new driver for NXP IFC
>>
>> From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
>>
>> This patch adds map driver for parallel flash chips interfaced over
>> a NXP Integrated Flash Controller (IFC). This driver allows either
>> 8-bit or 16-bit accesses, depending on bank-width, to parallel flash
>> chips(like Everspin MR0A16A), which are physically mapped to CPU's
>> memory space. For unaligned accesses, it performs read-modify-write
>> operations to keep access size same as bank-width.
>>
>
>
> IFC is configured as per Flash's width per Chip select via boot-loader.

That's right. We are configuring IFC from boot-loader.

>
> Can you please share more details about the driver requirement.
> What is not working with NXP IFC?

8-bit accesses to 16-bit MRAM (through IFC) , using MTD map driver,
seem to corrupt the data.
We need this driver to limit all accesses to be bank-width size,

For more details, please refer the discussion on following thread:
https://patchwork.ozlabs.org/patch/797787/

>
> --prabhakar
>

Regards,
Sanjay
