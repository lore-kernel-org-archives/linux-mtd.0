Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754ABC25B78
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfOTVtpY0dHUYPxraFaiglVI0ca223ikKBjEDNbVmvU=; b=XcKT8d/HLrWEQc
	bt/46jG48L6TDZOXE2Zqj23/3hwdHW725qIw8TnDXUO2XQFGiUDA4stTvpkWw5I3VGcVi3czaELY/
	GagQw6us4883N7HqyRBAlKpjA8hoLsZknU9rcvGK0r4cJYTJC7aN0ev+303EAYDLQZsYPcFXIfCnT
	wv5Aqatb3yJnfQoE4KBF9fwTneeT0rzSSIwSwvM8OzodwoS9BvFqZ8b9bEC2DSwbOJ5PeuuqaDd/M
	GMKywPkBbCWZyGrizPutnoBX+6yJ5MH4qRMUkHONdw+VorkEBmojADRChvkMG9mJ1hMXsVTPo4lu1
	jBOvopokWwWtZpDymIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwxQ-00000000p3n-1u2V;
	Tue, 28 May 2024 13:33:40 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwww-00000000oj5-3YgO
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 13:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+OlDy71KRIzdA+LVGy9z1RewFWm1WDFmdy93yC8byEM=; b=yp5FCoOteuewC8Nl9TYOsbYNyg
	CKaOdc1Zk/5mY7ser3Q/DH6EE2tB+ZAGkLTJZ4iNF3mUA5dfOYk7rEjwAdy+EaIdb1nNrzkOPJrpN
	KBYFEcUqqGiMCRUJmW6EJtHbjh4u7BuDD2JcnNPcjUNaytpc6amsgtDP5HjR8Ed4KjsO8YA+rdmBj
	A4gpEo+CgbIFKcu2Iv0+36JOsJxAFux7tHZ46NiWwgjCGQj6sv6cMaAumX111q+RRnV5xJ3jM7Hod
	f9Ur9+Qba2onRu6KXQqQTiDZ7Wr449FhD9vwCYV7cXRyemOcVuT7WvoX2pSKMd77dWJMnjIbpATGx
	XFzwPG2g==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBwws-0001Wh-HA; Tue, 28 May 2024 15:33:06 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBwwr-00068E-36;
	Tue, 28 May 2024 15:33:05 +0200
From: Esben Haabendal <esben@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Christophe
 Leroy <christophe.leroy@csgroup.eu>,  "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>,  "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc/configs: Update defconfig with now
 user-visible CONFIG_FSL_IFC
In-Reply-To: <096662e8-03cf-4c13-baa0-11918cab7511@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 28 May 2024 15:00:57 +0200")
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
	<20240528-fsl-ifc-config-v2-2-5fd7be76650d@geanix.com>
	<096662e8-03cf-4c13-baa0-11918cab7511@kernel.org>
Date: Tue, 28 May 2024 15:33:04 +0200
Message-ID: <87le3ukqnj.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27289/Tue May 28 10:30:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_063310_953084_39F53396 
X-CRM114-Status: GOOD (  15.48  )
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

> On 28/05/2024 14:28, Esben Haabendal wrote:
>> With CONFIG_FSL_IFC now being user-visible, and thus changed from a select
>> to depends in CONFIG_MTD_NAND_FSL_IFC, the dependencies needs to be
>> selected in config snippets.
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  arch/powerpc/configs/85xx-hw.config | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
>> index 524db76f47b7..8aff83217397 100644
>> --- a/arch/powerpc/configs/85xx-hw.config
>> +++ b/arch/powerpc/configs/85xx-hw.config
>> @@ -24,6 +24,7 @@ CONFIG_FS_ENET=y
>>  CONFIG_FSL_CORENET_CF=y
>>  CONFIG_FSL_DMA=y
>>  CONFIG_FSL_HV_MANAGER=y
>> +CONFIG_FSL_IFC=y
>
> Does not look like placed according to config order.

Correct.

> This is not alphabetically sorted, but as Kconfig creates it (make
> savedefconfig).

Are you sure about this?

It looks very much alphabetically sorted, with only two "errors"

$ diff -u 85xx-hw.config 85xx-hw.config.sorted 
--- 85xx-hw.config      2024-05-28 15:05:44.665354428 +0200
+++ 85xx-hw.config.sorted       2024-05-28 15:05:56.102019081 +0200
@@ -15,8 +15,8 @@
 CONFIG_DMADEVICES=y
 CONFIG_E1000E=y
 CONFIG_E1000=y
-CONFIG_EDAC=y
 CONFIG_EDAC_MPC85XX=y
+CONFIG_EDAC=y
 CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_LEGACY=y
 CONFIG_FB_FSL_DIU=y
@@ -71,10 +71,10 @@
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_NAND_FSL_ELBC=y
 CONFIG_MTD_NAND_FSL_IFC=y
-CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PLATRAM=y
+CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_NETDEVICES=y
 CONFIG_NVRAM=y

I don't think that this file has ever been Kconfig sorted since it was
created back in ancient times.

And as it is merged with other config snippets using merge_into_defconfig
function. I have no idea how to use savedefconfig to maintain such a snippet.
It would require doing the reverse of the merge_into_defconfig.

>>  CONFIG_FSL_PQ_MDIO=y
>>  CONFIG_FSL_RIO=y
>
> You also missed to update second defconfig - arm64.

Argh. I thought I checked, and it did not need any changes. But it needs
to have CONFIG_FSL_IFC=y added.

I will add that for v3.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
