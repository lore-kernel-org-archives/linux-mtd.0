Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAJbM-0005kk-Vl
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 16:43:54 +0000
Received: by mail-wm0-x241.google.com with SMTP id a20so8505584wme.2
 for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2016 08:43:32 -0800 (PST)
Subject: Re: [PATCH v3] mtd: spi-nor: fix spansion quad enable
To: "Esponde, Joel" <Joel.Esponde@Honeywell.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <1479901660-124876-1-git-send-email-joel.esponde@honeywell.com>
 <4c1b8cc9-3f1b-fa43-8ebc-eb6c3481abcc@gmail.com>
 <d08bf4d1-7667-1888-f9fa-ec63e4c9b249@atmel.com>
 <751ced45-1d6c-2d2d-3ea8-bb6d6be1da4a@gmail.com>
 <F6CD090A69E64C4289DC608E1C5D20242545B77C@DE08W1305.global.ds.honeywell.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d81e5625-4ab8-52cb-ea12-c891bfc84948@gmail.com>
Date: Fri, 25 Nov 2016 17:43:29 +0100
MIME-Version: 1.0
In-Reply-To: <F6CD090A69E64C4289DC608E1C5D20242545B77C@DE08W1305.global.ds.honeywell.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/25/2016 05:01 PM, Esponde, Joel wrote:
>> -----Message d'origine-----
>> De : Marek Vasut [mailto:marek.vasut@gmail.com]
>> Envoyé : vendredi 25 novembre 2016 16:08
>> À : Cyrille Pitchen <cyrille.pitchen@atmel.com>; Esponde, Joel
>> <Joel.Esponde@Honeywell.com>; linux-mtd@lists.infradead.org
>> Objet : Re: [PATCH v3] mtd: spi-nor: fix spansion quad enable
>>
>> On 11/25/2016 03:50 PM, Cyrille Pitchen wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Le 25/11/2016 à 15:17, Marek Vasut a écrit :
>>>> On 11/23/2016 12:47 PM, Joël Esponde wrote:
>>>>> With the S25FL127S nor flash part, each writing to the configuration
>>>>> register takes hundreds of ms. During that  time, no more accesses
>>>>> to the flash should be done (even reads).
>>>>>
>>>>> This commit adds a wait loop after the register writing until the
>>>>> flash finishes its work.
>>>>>
>>>>> This issue could make rootfs mounting fail when the latter was done
>>>>> too much closely to this quad enable bit setting step. And in this
>>>>> case, a driver as UBIFS may try to recover the filesystem and may
>>>>> broke it completely.
>>>>
>>>> Does this apply to all spansion chips or only to selected few ?
>>>>
>>>
>>> I've recently faced the very same issue with Winbond memories, which
>>> use the same procedure as Spansion to set the Quad Enable bit.
>>> More precisely, in my case it was some bare metal (bootloader) code
>>> but the issue was the same, there was no polling of busy bit from the
>>> Status Register after having set the QE bit in the Status Register 2 /
>>> Control Register 1. Then the next SPI command came too early and
>>> failed because the memory was actually still busy.
>>>
>>> I faced this issue with Winbond W25Q256 and W25M512.
>>
>> So we can leave this code as is ?
>>
> 
> 
> Hi,
> 
> I checked these data sheets, and in all of them, Bit 0 of the Status Register stands for WIP (Work in progress).
> 
> S25FL032P	http://www.cypress.com/file/196861/download#G4.1231516
> S25FL064P	http://www.cypress.com/file/196856/download#G3.1231516
> S25FL127S	http://www.cypress.com/file/177961/download#G3.1468489
> S25FL128S,
> S25FL256S	http://www.cypress.com/file/177966/download#G3.1254282
> S25FL512S,
> S70FL01GS	http://www.cypress.com/file/177971/download#G3.1238704
> S25FL129P	http://www.cypress.com/file/197121/download#G4.1231516
> S25FL004K,
> S25FL008K,
> S25FL016K	http://www.mouser.com/ds/2/380/spansion%20inc_s25fl004k-016k_00-329492.pdf#page=16&zoom=auto,61,683
> S25FL128K	http://www.cypress.com/file/228376/download#G4.1299435
> S25FL116K,
> S25FL132K,
> S25FL164K	http://www.cypress.com/file/196886/download#G3.1239521
> S25FL204K	http://www.cypress.com/file/196871/download#G4.1354778
> 
> I was not able to find the data sheets of S25SL parts.
> Based on this old patch provided by an Spansion engineer, it looks like S25SL family never existed:
> https://patchwork.ozlabs.org/patch/59109/

Oh great, thanks a lot for checking :-) So we can leave the code as is.

Regarding the S25SL, I found [1], but that might be a typo.

[1]
http://lxr.free-electrons.com/source/arch/powerpc/boot/dts/mpc8536ds.dts?v=3.0

-- 
Best regards,
Marek Vasut
