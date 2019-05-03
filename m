Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CDCC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 11:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00FD22087F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 11:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2pA2Sj7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtW8rkXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00FD22087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMlo6Rmu2v4FSCKdgnhWzBY2nN66OTcoL+5ewxQeYqU=; b=q2pA2Sj7O7QQH5
	OZJNq91X3CayNmtPPm0pBEnt9uhfd9cUyk2Uauknxm7Z24bYxW8qQbphkuUq+30M2FaxA9Cgzf5jY
	XZN89yeRkDTKYtIi1ocLPl194mAcpgYh0ttZiDkFbaA7lh9XTbHcR+gVYXcMehBYkoRxxRZMHDRYI
	SZ4oAquNk2n8oA+iFTShdU6MYtKOK8D2jf+EO8iNerkKugMMZ+Ru0ZoF+e7x/3Blfth1lYRgjZVcz
	0edYz7tXb6ljI6hy1QRmaaZqahY7WatfHYKBYW7CYlaq+NCCkRyvcFvSM3xvve/Ra3ZZMtNRpJzou
	sL+ppWZTIkr5crzkHPDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMWLx-0000lV-PZ; Fri, 03 May 2019 11:27:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMWLv-0000l7-IQ
 for linux-mtd@lists.infradead.org; Fri, 03 May 2019 11:27:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id y5so6343815wma.2
 for <linux-mtd@lists.infradead.org>; Fri, 03 May 2019 04:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qT8fctyh/NTtgLpBOVz/YqcyXidYhaHzijOB2ar/c2Y=;
 b=HtW8rkXO6GVnxXCxg9W+TehfpHqgFJ4BDrZWs1UpshGfMMBH1Hp7Sb2G5AupRSuOtO
 9gsCEo/dUNF5WwRryKFg5rQifBtBv8IMx6mg5yfbXdETsXOzH6UGEFgfs8oGxnAM2f0d
 dJliHrIRRP5r1jrPfvgeKQKmlBRA0NXNqmZi1Gkp0aqeZsufMMHbLobNLpsAewm1vaSg
 TEqQPmEydFQ4oU9Nhaf5qq1Jjg/fVH3VIAZJ83mlx0Od4+kWZsdnbKgnINlL/C5TUhBB
 coNkicnUrD9SRF1F+vLTVGdoGkPTJl7VR+0PKuGYG8v3SwFNnnMbf3qugIhae8yLffil
 czbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qT8fctyh/NTtgLpBOVz/YqcyXidYhaHzijOB2ar/c2Y=;
 b=Uf+4rxGwrjh80f+NMa+w5MXVnAp1zbhdSrL/JEcNfqAMGmfSzp55pKfp7FXch+k3Xl
 ZkMWgQU6WoUwrRlzlqYMj7O/muXfvVQsnmo3ENFWNwrxfewlvMsiioTq76c0PgJ90Qyi
 JKbroeAR3pnoEm+OxqdgNmuTCNmYNAOjDA5eyZwX/KH6bixSRhM2p5o4EpIL2lh9h6oy
 Z8OM1xDfXzOTxCzyK9dinFV5Rrhe7Lb8D7mTmIGBQzyQgpYlOUEqBo4nwOFimq85lZDQ
 xgwOyMumUIdUJ0kbCeEKjGS5sRLPtLUdQYXUXEz//A5+VjTy9Sl9YFg7elos3XI9r2k2
 kHTw==
X-Gm-Message-State: APjAAAW9VuUuuJ66x4RLjUMQVYUEA0CKnDq5KpwL19uDj7qn9sic8Ek2
 VX54w/seOtxMy1ztvL3+4dU=
X-Google-Smtp-Source: APXvYqw62T5hIXnX6MLwYBTQsAQFn3c0zBFxcl9l5uMqqjVkvyOiVR7Ixq62QGnGKXTaeDyvYXHmaA==
X-Received: by 2002:a05:600c:28c:: with SMTP id
 12mr5640674wmk.65.1556882861274; 
 Fri, 03 May 2019 04:27:41 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
 [86.49.110.70])
 by smtp.gmail.com with ESMTPSA id r9sm1931240wrv.82.2019.05.03.04.27.40
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 04:27:40 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: enable 4B opcodes for n25q256a
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
References: <20190503085327.5180-1-simon.k.r.goldschmidt@gmail.com>
 <8161008c-fafd-a89f-d2d8-413224844cd2@gmail.com>
 <CAAh8qsyBHCD9o_wyk6cHxyxagpQvX0dtXxy_P4KqZgoeU8VrEg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <4ff197be-6ede-6644-d135-b13aab590bb6@gmail.com>
Date: Fri, 3 May 2019 13:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAh8qsyBHCD9o_wyk6cHxyxagpQvX0dtXxy_P4KqZgoeU8VrEg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_042743_611092_17FFEA07 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/3/19 12:37 PM, Simon Goldschmidt wrote:
> On Fri, May 3, 2019 at 12:00 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>
>> On 5/3/19 10:53 AM, Simon Goldschmidt wrote:
>>> Tested on socfpga cyclone5 where this is required to ensure that the
>>> boot rom can access this flash after warm reboot.
>>
>> Are you sure _all_ variants of the N25Q256 support 4NB opcodes ?
>> I think there were some which didn't, but I might be wrong.
> 
> Oh, damn, you're right. The documentation [1] statest that 4-byte erase and
> program opcodes are only supported for part numbers N25Q256A83ESF40x,
> N25Q256A83E1240x and N25QA83ESFA0F.

;-)

> Any idea of how I can still enable 4-byte opcodes for my chip?
Maybe SFDP tables contains some information whether the chip supports
the 4B opcodes ?

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
