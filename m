Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEF3C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSzMeRsIZUxYA7HGDvyfmIRlna+sPT4O57UxUmeLAdc=; b=YJeHJrTjOXgku1
	bzp+T9EETGOBWGVa0aAZkRq6oADXg6/KLE/fkMNhMpSkD1cDianCIZXVCo/Cb40OcQFpxT6z19/cj
	AAFCAyAZb8I+6+ow5QUc4hX2+O3iigFFxEAsUzet3QzSg/la0iPRvzK6OKq1ErEE5v0PnyBbrRlkH
	zwcXVxK0rFLBr+Hgb0yyWBm087KrUNPnJParVRA5E9XBrfQoGNeS0ugcdyVSpTVYlFLLSxF3lKK5V
	xqT4zL99f4/dgHL2KAAO47pP1GaIJxlfk3H4BTfkoOEyM0rv34k07iZ2uwp0lmkjXE0vOIAhTn1r+
	VevED8WHfPwtSs41FIvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMwXV-00FkVN-7U; Wed, 23 Feb 2022 18:39:01 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMwXR-00FkTp-J7
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 18:38:59 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NIcp5C012312;
 Wed, 23 Feb 2022 12:38:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645641531;
 bh=VlmLvNgPCe5L7g2q46zh3SU4EKwQf3NcvwX8kmi+hUA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=xKURzZxvW+WP32Fpl1fCWJ3EEqsRpzEMUb/t94kLSXojbDmZkQY40tDTRrLPsy3Ys
 px4LKDr3kAHZKAL36DRdY80IxrkvrMLIolj5woEvWL7Cn9bvGT8eaQGrwxL93v4Y8P
 wUeSKqdkX3cQHB33RXSXLTu4V/qcTuLjiFt5T+NE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NIcpQO112522
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 12:38:51 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 12:38:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 12:38:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NIcoo4017359;
 Wed, 23 Feb 2022 12:38:50 -0600
Date: Thu, 24 Feb 2022 00:08:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Message-ID: <20220223183849.xcwciv2ybnkdnauk@ti.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
 <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
 <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
 <3cd510ad-a6ab-d4a0-92e3-9156a0c7ddbf@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cd510ad-a6ab-d4a0-92e3-9156a0c7ddbf@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_103857_735520_FDE1EE95 
X-CRM114-Status: GOOD (  27.43  )
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

Hi Tudor,

On 22/02/22 02:43PM, Tudor.Ambarus@microchip.com wrote:
> On 2/22/22 16:27, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Am 2022-02-22 15:23, schrieb Tudor.Ambarus@microchip.com:
> >> On 2/22/22 16:13, Michael Walle wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >>> the content is safe
> >>>
> >>> Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
> >>>> On 2/21/22 09:44, Michael Walle wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
> >>>>> know
> >>>>> the content is safe
> >>>>>
> >>>>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
> >>>>>> Fortunately there are controllers
> >>>>>> that can swap back the bytes at runtime, fixing the endiannesses.
> >>>>>> Provide
> >>>>>> a way for the upper layers to specify the byte order in DTR mode.
> >>>>>
> >>>>> Are there any patches for the atmel-quadspi yet? What happens if
> >>>>
> >>>> not public, but will publish them these days.
> >>>>
> >>>>> the controller doesn't support it? Will there be a software
> >>>>> fallback?
> >>>>
> >>>> no need for a fallback, the controller can ignore
> >>>> op->data.dtr_bswap16
> >>>> if
> >>>> it can't swap bytes.
> >>>
> >>> I don't understand. If the controller doesn't swap the 16bit values,
> >>> you will read the wrong content, no?
> >>>
> >>
> >> In linux no, because macronix swaps bytes on a 2 byte boundary both on
> >> reads and on page program. The problem is when you mix 8D-8D-8D mode
> >> and
> >> 1-1-1 mode along the boot stages. Let's assume you write all boot
> >> binaries
> >> in 1-1-1 mode. When reaching u-boot if you enable 8D-8D-8D mode, when
> >> u-boot
> >> will try to get the kernel it will fail, as the flash swaps the bytes
> >> compared
> >> to what was written with 1-1-1 mode. You write D0 D1 D2 D3 in 1-1-1
> >> mode and
> >> when reaching u-boot you will read D1 D0 D3 D2 and it will mess the
> >> kernel image.
> > 
> > But you have to consider also 3rd parties, like an external programmer
> > or
> 
> Why? If you use the same mode when reading and writing, everything is fine.
> I'm not sure what's your suggestion here.

So our stance here is that we don't care about external programs?

If that is the case then why bother with all this anyway? Since the swap 
happens at both page program and read, what you write is what you read 
back. Who cares the order stored in the actual flash memory as long as 
the data read is correct?

If we do care about external programs, then what would happen if the
external program writes data in 8D-8D-8D mode _without_ swapping the 
bytes? This would also cause data corruption. You can't control what 
they mode they use, and you can't detect it later either.

I think there is no winning here. You just have to say that external 
programs should write in 8D-8D-8D mode or it won't boot.

> 
> > another OS. So, there has to be *one correct* way of writing/reading
> > these
> > bytes.
> > 
> 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
