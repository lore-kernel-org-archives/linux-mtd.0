Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzzda-0003WH-Nw
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 05:23:32 +0000
Subject: Re: MTD partitions vs erase regions
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
References: <AM4PR0701MB21304CE213B5F0B0534AB52FFEAA0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <35c63aa4-d686-e06a-a12f-408c25895a22@denx.de>
 <AM4PR0701MB2130B3903E47ACF2A5D9A3F5FEAD0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <c821516b-cda3-d6e1-2aad-1fe3c11cab77@denx.de>
Date: Fri, 28 Oct 2016 07:08:08 +0200
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB2130B3903E47ACF2A5D9A3F5FEAD0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/28/2016 06:50 AM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
> Marek,
> 
>> -----Original Message-----
>> From: Marek Vasut [mailto:marex@denx.de]
>> Sent: Friday, October 28, 2016 2:15 AM
>> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
>> <marcin.krzeminski@nokia.com>
>> Cc: linux-mtd@lists.infradead.org
>> Subject: Re: MTD partitions vs erase regions
>>
>> On 10/27/2016 02:19 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> I am sending mtd partition and erase regions conflict that I had.
>>> I admit I have no investigated it, since finally all is different.
>>> This could make some problems with your idea of having erase sizes
>> defined from DT.
>>
>> Which flash is that ?
> 
> Sorry - forgot to mention: MT25Q00 (64KiB erase size).
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is disabled.

I think this is expected then, the subsystem is not ready for device
with variable eraseblock length.

-- 
Best regards,
Marek Vasut
