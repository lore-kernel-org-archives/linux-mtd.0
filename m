Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A1BC0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:49:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36BC4216C8
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obKasn/R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DhmqW9TI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36BC4216C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMAOEIAXSd0106XS6St83S0qBlTf1ITLuV3PEG5PNsg=; b=obKasn/R6O30zr
	C1O/q0jYyFrCX/xIC9qh0YaAtiTPVPoCBclFWB/BWn5UHG4AIgzngh/Po8pOYksAf5p96bU7kTFuk
	7zRzi+kaYzProrxw7HDgSSgA9/oI9Y5f7l66j4GXuYqk/mdCqI8iKGH0uCSDsm0VRlkEAqQTOip4F
	joTU0k+SZWu+UAOvQAPgxMkZoOEv6MmnuTrL4zQDUxo1sCSaJtHp0cr9E+nmqhxNokYVFcPKGPc7D
	X9J8ivocqs6YrZ10p2J1p11UCldr4ge8KuZcfZoaK/hUeMafXfVzKhKzcLNfa1Ei5QX0ev1hBqsFt
	ROd8hW14kFJO51FGVbNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWF0-00079v-IB; Tue, 30 Jul 2019 17:48:50 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWEx-00079E-Ol
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 17:48:49 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6UHmVZ5102624;
 Tue, 30 Jul 2019 12:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564508911;
 bh=JyDOEk7Byy3nIF8i201hocgIjoeRb/5joImFM1xcR9s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DhmqW9TIxmVvcF+nDkDJ5mWEqMZW1Nns9T3dm9ZAGVzGKpbJd2iSzaXHrZvqSCc+P
 hdXaXNjtLPaVF3ESL7I/1rgMxwluITEQP+yx3ULNpu6E0rKjueTjQzIZhaBBbsb6N/
 luEqBR6C8Wk/YLgUttgUxu1EKD42aa50bXUHtgz4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6UHmVao091553
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Jul 2019 12:48:31 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Jul 2019 12:48:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Jul 2019 12:48:30 -0500
Received: from [10.250.133.35] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6UHmQj1083839;
 Tue, 30 Jul 2019 12:48:27 -0500
Subject: Re: [RFC v1 0/3] *spi-mem: adding setup and callback function
To: Boris Brezillon <boris.brezillon@collabora.com>, Tomer Maimon
 <tmaimon77@gmail.com>
References: <20190729142504.188336-1-tmaimon77@gmail.com>
 <20190729172859.4374a2ad@collabora.com>
 <CAP6Zq1iPXDX_Gtz6ZWYm3JoHgHjdapotVLGw-Lq4tc2X-6eAug@mail.gmail.com>
 <20190730085438.6fe0480b@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d8adef3f-e901-2e25-6183-35cb1e53bcda@ti.com>
Date: Tue, 30 Jul 2019 23:18:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730085438.6fe0480b@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_104847_915701_2556C5D1 
X-CRM114-Status: GOOD (  16.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, bbrezillon@kernel.org,
 richard@nod.at, tudor.ambarus@microchip.com,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 30-Jul-19 12:24 PM, Boris Brezillon wrote:
> Trimmed the recipient list a bit and used Frieder's new address.
> +Sergey
> 
> On Mon, 29 Jul 2019 23:55:05 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
> 
>> Hi Boris,
>>
>> Thanks for the prompt reply,
>>
>>
>>
>> On Mon, 29 Jul 2019 at 18:29, Boris Brezillon <boris.brezillon@collabora.com>
>> wrote:
>>
>>> Hi Tomer,
>>>
>>> On Mon, 29 Jul 2019 17:25:01 +0300
>>> Tomer Maimon <tmaimon77@gmail.com> wrote:
>>>  
>>>> Lately we have working on Flash interface unit (FIU) SPI driver that
>>>> using spi-mem interface, Our FIU HW module support direct Flash Rd//Wr.
>>>>
>>>> In our SOC (32 bit dual core ARM) we have 3 FIU's that using memory  
>>> mapping as follow:  
>>>>
>>>> FIU0 - have 2 chip select and each one have 128MB memory mapping (total  
>>> 256MB memory mapping)  
>>>> FIU1 - have 4 chip select and each one have 128MB memory mapping (total  
>>> 512MB memory mapping)  
>>>> FIU2 - have 4 chip select and each one have 16MB memory mapping (total  
>>> 32MB memory mapping)  
>>>>
>>>> Totally 800MB memory mapping.
>>>>
>>>> When the FIU driver probe it don't know the size of each Flash that
>>>> connected to the FIU, so the entire memory mapping is allocated for each  
>>> FIU  
>>>> according the FIU device tree memory map parameters.  
>>>
>>> Do you need those mappings to be active to support simple reg accesses?
>>>  
>>>> It means, if we enable all three FIU's the drivers will try to allocate  
>>> totally 800MB.  
>>>>
>>>> In 32bit system it is problematic because the kernel have only 1GB
>>>> of memory allocation so the vmalloc cannot take 800MB.
>>>>
>>>> When implementing the FIU driver in the mtd/spi-nor we allocating memory  
>>> address only  
>>>> for detected Flash with exact size (usually we are not using 128MB  
>>> Flash), and in that case usually we allocating much less memory.  
>>>>
>>>> To solve this issue we needed to overcome two things:
>>>>
>>>> 1.    Get argument from the upper layer (spi-mem layer)
>>>> 2.    Calling the get argument function after SPI_NOR_SCAN function.  
>>> (the MTD Flash size filled in  SPI_NOR_SCAN function)
>>>
>>> That's clearly breaking the layering we've tried to restore with the
>>> spi-nor/spi-mem split, and I don't see why this is needed since we now
>>> have a way to create direct mappings dynamically (with the dirmap API).
>>> Have you tried implementing the dirmap hooks in your driver?  
>>
>>
>>  Sorry but I wasn't familiar with the direct mapping in the spi-mem, it
>> seems it needed to implemented in the m25p80 driver as well, am I correct?
> 
> There's this patch [1] floating around. IIRC, Sergey was waiting for
> the m25p80 -> spi-nor merge to send a v5. Vignesh, any updates on that
> one? If you don't have time to work on that, maybe Sergey could send a
> v5.
> 

I did send an updated series of merging m25p80 to spi-nor last week and
have received few comments. Will respin one more version this week
(mostly by tomorrow).

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
