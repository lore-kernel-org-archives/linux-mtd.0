Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF8FC25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 06:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8tXlHZFOWn7YzJJWxvlayuHQBHjDDzhLoqueWRtzAI=; b=nmfK5hbeuv9Ay/
	eAs5IgwU5gcd/da70O1q2Hn1DrUrc954TyY/DYB3foYcdw2Mqi9e+EJ8L0pLfTRvWK6w3WZsVs0b3
	98eWNKp0HFAtA5Ff0GBrFGfe9710ongbxd/wa0fcbVYn1gw0MLgHB7IG1NVAWHARbIl2ACpBOthVa
	95yNsgCf/o/uIVUOJG48nwhMxieDcbCpj2jPQFQxOc8nwgkejNPd0N03JA7L6jYYDyGI9xgxar1aH
	4EkKyhpRrAW3QNIBiqfZ8c4N+vn1tlT4mU64AYOPfHtsD/5h2bg/O7NpShnVXY5jlpfvrqq9QI6AF
	wev5x3ASbOIpOFdY0dHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUH1-0000000DzPJ-0KaQ;
	Mon, 27 May 2024 06:55:59 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUGx-0000000DzOO-0huY
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 06:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Qq3+xYe/YAnEavdjtFQxxGGF2ofcopXV/qtuneNfe0A=; b=mTUlAJnZ2zdCm7YVNNcH3ZNJsH
	849hc9R7sHcjnd+vqa5gY8GhB4KCr/EralmAgExTuMm90CBK/BX7+hNKNS97z6JcIuWEFtbUokG4I
	ASCOyhxXXbs9zgACeHzRyhOF2JnXOR7FCMzotlzvkTwm/h4oc7W+1iGGTG0UUHecxPh9iZOmgQE0x
	/YZMflyzsrkmICIoGHzXLNeYbHJ1WiWJdN55BgH9vk3zzo1LJhtwV7w42L/XnviBaNI5J+sisvPtl
	H27oM7ayIIzNRLaGq2NECJ58T0axMrea6lMN+PEAC67McYUXC3KsMziCMiYhNgopYuhOag5m472wQ
	2lSMzSeA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBUGp-000EIj-BG; Mon, 27 May 2024 08:55:47 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBUGp-0002o8-0w;
	Mon, 27 May 2024 08:55:46 +0200
From: Esben Haabendal <esben@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
In-Reply-To: <6c166ad5-8004-4bc4-9107-a47ba9a72161@kernel.org> (Krzysztof
	Kozlowski's message of "Sat, 25 May 2024 18:41:06 +0200")
References: <20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com>
	<979fd913-050b-445d-9ca8-0ec6906ce3ea@kernel.org>
	<87cypc38gu.fsf@geanix.com>
	<9a7f73f4-f5dc-4342-855b-08df6a839bb5@kernel.org>
	<87le3zoatn.fsf@geanix.com>
	<6c166ad5-8004-4bc4-9107-a47ba9a72161@kernel.org>
Date: Mon, 27 May 2024 08:55:46 +0200
Message-ID: <87ttijaglp.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27287/Sun May 26 10:27:50 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_235555_521726_439C45FC 
X-CRM114-Status: GOOD (  15.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 24/05/2024 10:47, Esben Haabendal wrote:
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>> 
>>> On 23/05/2024 16:32, Esben Haabendal wrote:
>>>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>>>>
>>>>> On 23/05/2024 15:58, Esben Haabendal wrote:
>>>>>> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
>>>>>> driver selects FSL_IFC automatically, we need the option to be selectable
>>>>>> for platforms using fsl_ifc with NOR flash.
>>>>>
>>>>> Which driver is that?
>>>>
>>>> This is drivers/memory/fsl_ifc.o driver. It is for Integrated Flash
>>>> Controller (IFC) from NXP. It is used in various Layerscape socs.
>>>
>>> ? I know that, I mean the NOR flash working here.
>> 
>> Ah, sorry. The NOR flash I am using here is a Spansion S29AL016J.
>> 
>>>>> Which DTS?
>>>>
>>>> It is for "fsl,ifc" compatible devices.
>>>
>>> That's not a NOR flash.
>> 
>> Nope.  The binding used for the NOR flash is "cfi-flash".
>
> And now let's get back to my original question. I asked for driver, not
> device, and for DTS not compatible.

You got me really confused now. I am not sure what you are asking me
for, and why.

I am sending a patch which changes to Kconfig for a memory controller
driver. The change is AFAICS quite similar to commit be34f45f0d4a
("memory: omap-gpmc: Make OMAP_GPMC config visible and selectable").

As for the NOR flash that in this situation is attached to the IFC
controller, it is (as mentioned) Spansion S29AL016J. It is handled by
the drivers/mtd/maps/physmap.o driver (CONFIG_MTD_PHYSMAP +
CONFIG_MTD_PHYSMAP_OF)

The DTS used to specify the NOR flash is

&ifc {
        status = "okay";
        #address-cells = <2>;
        #size-cells = <1>;
        ranges = <0x0 0x0 0x0 0x60000000 0x00200000>;

        nor_flash: nor@0,0 {
                #address-cells = <1>;
                #size-cells = <1>;
                compatible = "cfi-flash";
                reg = <0x0 0x0 0x200000>;
                bank-width = <2>;

                partition@0 {
                        reg = <0x000000 0x0f0000>;
                        label = "boot0";
                };
        };
};

So as mentioned, it is a quite standard "cfi-flash" compatible device
declaration.

Do you think there is a way that ti enable CONFIG_FSL_IFC for my
situation without the config being visible? Something like automatically
selecting CONFIG_FSL_IFC when CONFIG_MTD_PHYSMAP and
CONFIG_MTD_PHYSMAP_OF is enabled? Will that not include a risk of
pulling in CONFIG_FSL_IFC in some cases where it is not desired?

Something like

config MTD_PHYSMAP
	tristate "Flash device in physical memory map"
	depends on MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_RAM || MTD_LPDDR
        select FSL_IFC if SOC_LS1021A

But that looks like a road somewhere not so nice. The generic
MTD_PHYSMAP being littered with architecture specific selects.

Or is there something completely obvious (not for me then) that I am
missing?

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
