Return-Path: <SRS0=Hh9c=LR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87853C4743C
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 03:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC6760FDC
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 03:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC6760FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qsw4BsI9hQUNS6GouFRMssQVdyKHY05UwgTaTACaHVw=; b=KRwVlKWtZ3aOmR
	hv90X5ymejEJ23CKXevI14iCuVl5nw22knveVMRbtn3ntLCDIK4pXeP3ag5ZJG5dBclMcCVndG/2u
	fG5DRyzfvz3hi+RWjm6T+NrqruawkLGmF/e/w+xQxiNat30z2qcQzwiYwHBwt0FkYGpYakr+Bvy8K
	eLLaLfJ1SZ6PxTU649AwCwCXmyCPB9Iw2xXpdj6W3wUoSH2fY21otZbCIp6K/TemUMZydIyNp3RI5
	eCmNfzfcEkT6zH7h7JNzWsrzGlh1PJ1ureIlI88MfY5RjA2YIZdfrHo2P2qIj5WhjYnAk3fA6s3VV
	SJ/I/d90aglB7xu79rHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvtTN-00993m-6G; Wed, 23 Jun 2021 03:22:41 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvtTK-00992f-8L
 for linux-mtd@lists.infradead.org; Wed, 23 Jun 2021 03:22:40 +0000
Received: from [192.168.1.107] (unknown [81.0.122.178])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3F9F280C94;
 Wed, 23 Jun 2021 05:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624418554;
 bh=S9lwjloj2NwiOqMfyrUvlH3GueMAUyXvxfqC0HmvcJg=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fMd582tScLN8lpASdmD/JIL9HGPfgmCrtuacOTxupYCrhTkLlYOpfT8xz8gXKV/sa
 v8OFo5zY9nOfkjQOY2m7RUc8MGeI6LcFrjv1+ofDR8IgVYuZuHHEgsQg932VCfeSAQ
 RUmiBrqIIGOSLoCoYInZRpEmJ2LKmBwYw1AOQbQ57QnbtBHXV4uJ/okpq0y30pbwOK
 RI/vaTetEahyo8meKiCI35xJCxoKpik5TbMrdM+HbUowHTlYm6dSyOig0yBHEsjq45
 pHHJFrTJHvqA5CpOWCs2p0ZxJP8bh1QS2t2nIKkLAR9BcfnMD65otxUvCglfD0lDAk
 HSXef4xWN+CYg==
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable
 warnings
To: Colin Ian King <colin.king@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, kernel-janitors@vger.kernel.org
References: <YMyir961W28TX5dT@mwanda>
 <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
 <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
 <aff4cbba-b8a4-445a-4290-7717355effc8@canonical.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <b944467a-2f35-30e8-98a1-458038d3c377@denx.de>
Date: Wed, 23 Jun 2021 05:22:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <aff4cbba-b8a4-445a-4290-7717355effc8@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_202238_518010_DE63D3CE 
X-CRM114-Status: GOOD (  16.61  )
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Colin, Dan,

On 22.06.21 17:39, Colin Ian King wrote:
> On 22/06/2021 16:31, Fabio Estevam wrote:
>> On Sat, Jun 19, 2021 at 3:23 AM Heiko Schocher <hs@denx.de> wrote:
>>>
>>> Hello Dan,
>>>
>>> On 18.06.21 15:42, Dan Carpenter wrote:
>>>> Smatch complains that zero length read/writes will lead to an
>>>> uninitalized return value.  I don't know if that's possible, but
>>>> it's nicer to return a zero literal anyway so let's do that.
>>>>
>>>> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> ---
>>>> People, when we add a new driver can we make sure the first commit uses
>>>> the new prefered subsystem prefix?  For example,
>>>>
>>>> "mtd: mchp48l640: add support for microchip 48l640 EERAM"
>>>>       ^^^^^^^^^^
>>>> Otherwise it's not clear to me what I should use as a patch prefix.
>>>
>>> Ok, sorry...
>>>
>>> Hmm... Colin already sent a fix for this, see:
>>>
>>> https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html
>>
>> Yes, both patches work, but I think Dan's solution is a bit clearer, so:
>>
>> Reviewed-by: Fabio Estevam <festevam@gmail.com>
>>
>> Thanks
>>
> Yep, I'm good with that.

+1

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
