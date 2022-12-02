Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BDAC4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvTjYNbI80vBz0okdp6WJAx81CmaVhrvjuZbYmnbdq8=; b=sdtheVk/ROoEDd
	ixuaWKn2QQ+2B7d2W+r4UrLekFm/iPquN5OeJiN1scLQ90bYNEiU4YF0dNREUzi5Mt/x4/14+1En9
	EPqEno1H+v4NvZb4xNeGvBS51NcXbjmI8zPd/ut46dbZ7k6hgxWUk50ij6r8Gn4IuZmFbxM+znXA5
	JgQpwx2CDiR3IZtYFFObfGo952W3QoNgMX18ZLgSFTp0HyxZOVg0SQH05r1EE95RZhTfwDDRyVVn0
	j0hLji0uI8+TEnXodrD/RAJ71kEaSElwh11iPZNu9LVogAuIhyATArFo/frJrvi/ICv+7EvS/Z65a
	dxlfm2xu67q2ctXArxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18kM-00HR8U-WA; Fri, 02 Dec 2022 16:18:43 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18ji-00HQtS-J0; Fri, 02 Dec 2022 16:18:04 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CF5B782F29;
	Fri,  2 Dec 2022 17:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669997880;
	bh=WTrTtiTeEcjbMtAhGvYuwA6qAl+AkVjLUEnMqtMNKfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gusw4R3dAuGAzAk7CgUjYuKCeij5yE5BB7N8Purxn1zmm9xNd3OSnM3TaD4Pd2faV
	 ZaoeS6XuP8c2e0N1OvVJP9i9o8gN8SW7JK3Vp7Qcgy1a10ubqh0fEXmmpZigNJVQr+
	 CkGDJ0Em+19JDt3KrPQocHK9ogZvI3ISJTiyv0FWScpGVV8tSfHSQ4ArB7uZADGFml
	 ENeG0BC/jmWytauGZ3nHpmD+/Q22dP7sbCMG3m6MWSXIRAdfBDihIoi1TOQa2cP3Yo
	 8gvHh/z+7FfZzyLHA0k8DG46yV1yLeS3FrJN3c4UCJ+l8eryIHzY52fb/XnXBxBPxh
	 YFx0w57ezqu2A==
Message-ID: <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
Date: Fri, 2 Dec 2022 17:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
 <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
 <20221202164904.08d750df@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221202164904.08d750df@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_081803_102589_AC5620B9 
X-CRM114-Status: GOOD (  34.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/2/22 16:49, Miquel Raynal wrote:
> Hi Marek,

Hi,

>> On 12/2/22 16:00, Miquel Raynal wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> marex@denx.de wrote on Fri, 2 Dec 2022 15:31:40 +0100:
>>>    
>>>> On 12/2/22 15:05, Miquel Raynal wrote:
>>>>> Hi Francesco,
>>>>
>>>> Hi,
>>>>
>>>> [...]
>>>>   
>>>>> I still strongly disagree with the initial proposal but what I think we
>>>>> can do is:
>>>>>
>>>>> 1. To prevent future breakages:
>>>>>      Fix fdt_fixup_mtdparts() in u-boot. This way newer U-Boot + any
>>>>>      kernel should work.
>>>>>
>>>>> 2. To help tracking down situations like that:
>>>>>      Keep the warning in ofpart.c but continue to fail.
>>>>>
>>>>> 3. To fix the current situation:
>>>>>       Immediately revert commit (and prevent it from being backported):
>>>>>       753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>>>>       This way your own boot flow is fixed in the short term.
>>>>
>>>> Here I disagree, the fix is correct and I think we shouldn't
>>>> proliferate incorrect DTs which don't match the binding document.
>>>
>>> I agree we should not proliferate incorrect DTs, so let's use a modern
>>> description then
>>
>> Yes please !
>>
>>> , with a controller and a child node which defines the
>>> chip.
>>
>> But what if there is no chip connected to the controller node ?
>>
>> If I understand the proposal here right (please correct me if I'm wrong), then:
> 
> Good idea to summarize.
> 
>>
>> 1) This is the original, old, wrong binding:
>> &gpmi {
>>     #size-cells = <1>;
>>     ...
>>     partition@N { ... };
>> };
> 
> Yes.
> 
>>
>>
>> 2) This is the newer, but still wrong binding:
>> &gpmi {
>>     #size-cells = <0>;
>>     ...
>>     partitions {
>>       partition@N { ... };
>>     };
>> };
> 
> Well, this is wrong description, but it would work (for compat reasons,
> even though I don't think this is considered valid DT by the schemas).
> 
>>
>> 3) This is the newest binding, what we want:
>> &gpmi {
>>     #size-cells = <0>;
>>     ...
>>     nand-chip {
>>       partitions {
>>         partition@N { ... };
>>       };
>>     };
>> };
> 
> Yes
> 
>>
>> But if there is no physical nand chip connected to the controller, would we end up with empty nand-chip node in DT, like this?
>> &gpmi {
>>     #size-cells = <X>;
>>     ...
>>     nand-chip { /* empty */ };
>> };
> 
> Is this really a concern?

I don't know, maybe it is not.

> If there is no NAND chip, the controller
> should be disabled, no? I guess technically you could even use the
> status property in the nand-chip node...

Sure.

> However, it should not be empty, at the very least a reg property
> should indicate on which CS it is wired, as expected there:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Documentation/devicetree/bindings/mtd/nand-chip.yaml?h=mtd/next

OK, I see your point. So basically this?

&gpmi {
   #size-cells = <1>;
   ...
   nand-chip@0 {
     reg = <0>;
   };
};

btw. the GPMI NAND controller supports only one chipselect, so the reg 
in nand-chip node makes little sense.

> But, as nand-chip.yaml references mtd.yaml, you can as well use
> whatever is described here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Documentation/devicetree/bindings/mtd/mtd.yaml?h=mtd/next
> 
>> What would be the gpmi controller size cells (X) in that case, still 0, right ? So how does that help solve this problem, wouldn't U-Boot still populate the partitions directly under the gpmi node or into partitions sub-node ?
> 
> The commit that was pointed in the original fix clearly stated that the
> NAND chip node was targeted

I think this is another miscommunication here. The commit

753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")

modifies the size-cells of the NAND controller. The nand-chip is not 
involved in this at all . In the examples above, it's the "&gpmi" node 
size-cells that is modified.

> , not the NAND controller node. I hope this
> is correctly supported in U-Boot though. So if there is a NAND chip
> subnode, I suppose U-Boot would try to create the partitions that are
> inside, or even in the sub "partitions" container.

My understanding is that U-Boot checks the nand-controller node 
size-cells, not the nand-chip{} or partitions{} subnode size-cells .

Francesco, can you please share the DT, including the U-Boot generated 
partitions, which is passed to Linux on Colibri MX7 ? I think that 
should make all confusion go away.

(or am I the only one who's still confused here?)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
