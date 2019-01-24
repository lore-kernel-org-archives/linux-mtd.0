Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F398C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 13:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDE421855
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 13:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="he3ZAMDJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EDE421855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zHEaT2rvZ7JoI9OzgfMs+v0l0bL3cqvpWnltks+lXdc=; b=he3ZAMDJ9A/vQ3Pae1izldFyM
	PIg61SZbwTOQ+DGMoomZdwyyXTrETDCF8hrvuifXV1t5WYdeMSn7isaNrBQjMl2sa11kqSziHJYTK
	Vx/WTAq5nE6jzrTEoQZo4c42isEtW/+MUEPW4imwT4B+VHWSaixPGWjeQMq0TvMN5eOPnJGM9qIH0
	hWMwUhIzEMvN3DEUozSVLxA/4Jpz9T8fk3soTXpuIXltYoGydVXKrAvqbrMFTEMZaN1vglwYlufW7
	zFq9M7zqXw0D7aDgc9iy58doy9qYlbj7VQwJ5j6nhIMMhm08RTa2lC43SyrEbewLE6/qDw8Mj3YX0
	jpk5qoeLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmfXm-0001Ih-Co; Thu, 24 Jan 2019 13:59:46 +0000
Received: from mx2a.mailbox.org ([2001:67c:2050:104:0:2:25:2]
 helo=mx2.mailbox.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmfXi-0001I0-8p
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 13:59:44 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 00383A132E;
 Thu, 24 Jan 2019 14:59:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id N3dLwMHU5eez; Thu, 24 Jan 2019 14:59:37 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190122145632.17547-1-sr@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
 <20190123103512.722095cd@bbrezillon>
 <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
 <20190123122514.0db87887@bbrezillon>
 <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
 <20190123132249.2e7f65a2@bbrezillon>
 <358c78d9-6507-3998-a065-ddd18809d02b@denx.de>
 <20190123134050.7efe59a6@bbrezillon> <20190123135735.358fc9a6@bbrezillon>
 <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
 <20190124085018.2ad33dab@bbrezillon>
 <39d6edd9-14ad-8110-b618-6454f6840b28@denx.de>
 <20190124091459.11cb2912@bbrezillon>
 <6dadd565-aa59-82ba-757f-db0a1c03656d@denx.de>
 <20190124101901.7b44c5c5@bbrezillon>
 <29f49243-6b52-5c98-29a6-81f9a32697b9@denx.de>
 <20190124121435.4ed6069d@bbrezillon>
 <d504c576-d2f8-c325-528e-e4ba71ab1361@denx.de>
 <20190124131808.11165b42@bbrezillon>
 <bde33ebf-dd3d-d237-68a8-9eeb43c22368@denx.de>
 <20190124134136.7fb975ac@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <93819bce-b03e-c3f4-e22e-f7e63b14003b@denx.de>
Date: Thu, 24 Jan 2019 14:59:36 +0100
MIME-Version: 1.0
In-Reply-To: <20190124134136.7fb975ac@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_055942_483953_04EF6E1B 
X-CRM114-Status: GOOD (  13.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24.01.19 13:41, Boris Brezillon wrote:
> On Thu, 24 Jan 2019 13:28:36 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>> This one works as well. Feel free to add my:
>>
>> Reviewed-by: Stefan Roese <sr@denx.de>
>> Tested-by: Stefan Roese <sr@denx.de>
>>
>> tags if appropriate.
> 
> I will.
> 
>>
>> Another question though regarding older kernel versions (e.g. v4.19 LTS).
>> Could you perhaps push your fix [1] from yesterday as well?
> 
> Yep, will send a separate patch with Fixes+stable tags and queue it to
> the mtd/fixes branch after you have reviewed/tested it.

Thanks. Could you perhaps also check if the U-Boot implementation also
needs a fix/change in this area?

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
