Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C1D606A31E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 00:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/vNU32w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=W7Ll6+aw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8swtxEn7CgufPeXbjVWcyiEB803RkUjC3HtttBOx0HU=; b=t/vNU32wgGcfxmPywJ1qdXvca5
	iOlwFpRaDFs5qOOj5Grha5ydxHnhRIuxBhi9W8pboyDQc8aAglrwXebxXXAMn89c0LBDUHVnKanAn
	rHDbpi3VZGRTGAgoivuotJESl61OQA8k2Qlluk41Ia/0iHWnP6R84xWTfH96WESzC4PwAgNNnZ40c
	aZi6xHmyKLZSXgrKxHG/WmZUmz3nyIrbH77ah/Zu1E7BHwZVnkeHbiroaNsz0r6qoNukHWB+BfHAr
	1TIDEK5FZlM4TzpVSHvm0c7Z6L24fF5ThTY0hHSKUfunp0Ol6QnP5P7dU5Erk/UqMrV1HXel7DMcO
	mTUyd0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPNZ-0000000HEd1-2NST;
	Sat, 24 Oct 2026 00:12:57 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPNW-0000000HEcD-38Db
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 00:12:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A68110B0D2;
	Sat, 24 Oct 2026 02:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792800764;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=majQ4gnBolYu2mbieTBQiMbMKTHzyfMnZWZk6wCUSQw=;
	b=W7Ll6+awp/KidNpG5Z+6z9RXzsR/0QZzZJKf3J+h8QJp5pf5xYQER3gr/8uXpcSHDqDP12
	+bHUsXjHagZVtjrOOy8/wTCBn6vzfQRpObXP7IQXXf78//QFS3/ME0TMGaFdz6Oks+pOvO
	yNrY06Vh7VMKJpZsOSYr72ZBpMUzJfklS6y86aRvGB4Hqjngsj8YxYZt5IvAKNEsiUL/Lc
	YD6R+1lExQco6EIrhGsz7ezRd7U6VWVfbXOf8JgW4G3S8SNJrMV3IaguaM5to9LRZYXbL7
	dSvWOxQ8U7lTMf4WYpV2ENqCuX0D6n/QtBGv/ZmlxUsSc8Fbmj54WXp4YHBj5Q==
Message-ID: <f1edf86a-8f64-405d-b2d1-f5bad7d7c1c8@nabladev.com>
Date: Sat, 24 Oct 2026 02:12:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
To: Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
Cc: chengminglin@mxic.com.tw, mwalle@kernel.org, miquel.raynal@bootlin.com,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
References: <20260925014517.174496-1-marex@nabladev.com>
 <9bdd8b02469042ffa71851fd2641708e@infineon.com>
 <75174a84-13b6-4a97-b4bf-7513ee43ab69@nabladev.com>
 <8daec856e8dd4f11a805d5d9dcf8d51a@infineon.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <8daec856e8dd4f11a805d5d9dcf8d51a@infineon.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_171255_006870_A269A277 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/26 10:05 AM, Takahiro.Kuwano@infineon.com wrote:

Hello Kuwano-san,

>> @@ -89,6 +139,7 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
>>    };
>>
>>    static const struct spi_nor_fixups macronix_qpp4b_fixups = {
>> +       .post_bfpt = mx25l51245_post_bfpt_fixups,
>>          .post_sfdp = macronix_qpp4b_post_sfdp_fixups,
>>    };
>>
> please use late_init hook. post_bfpt should fixe params declared in SFDP/BFPT.
> locking is not declared in SFDP/BFPT.

Understood, will do so and send V2 shortly.

But I would really like it if Macronix people could have a look at the 
patch too before it is applied, to be on the safe side.

[...]

Thank you for your help !

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
