Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34ACC79F8C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 06:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Message-ID:Date:
	Mime-Version:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj9sAMv1rpPg95v9vwP37kcVV0qSHGBBbqBbCWqvu2M=; b=M7yoY+OzYmd3vn
	0OVS/G9BgE/eS1K/cLXSphqd7eQq/cQ8PtoJOa3mx4MzsmIfnb+589dGYOlJu5YW6wNVVdbOsqfPj
	rhItaY3e+NpZw946ctKXJfiVxy/sedso2Pwli5KT4eZ0aqs9Zjzldqvugnu1NP6FHrYr3NTe1Bw4D
	+ZIrL+KFgwB1d1ZL29TOBoERvKFJRLRayrEOcpg+TKLSNd5oSQD+W7YTEb/hpO48HoT8vv/JGWajO
	3SRZRDZ5aNvXKINCMRUZPLfCY9TY0LuIpML96zHpXsCbqJQcRrZLCSUWkSYIB7UHho2k+PhIhHT5g
	PVFwN9+OCCq7/g45KbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BoK-0000000AsW3-476c;
	Wed, 09 Sep 2026 06:29:32 +0000
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BoI-0000000AsU6-0rEk
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 06:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788935363; bh=+pdap0uuKbgUosOmANRUk/9FWBKtG/h+1HwPpPjHqds=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=dxH19Z0KKkFbAQefwAc5DO9SgqdIykbdo9l9hAPvGKfm5cWEoHRkeeoRvxGSJst+R
	 kx3tagDs2WCfahZFWAhsaan895UhMCbzpcmlLMaSUbo3iCzyiguSWSpbiaYRKKm3PR
	 u0RuAah/FvbaPOdrTLUZC/XKEPAlrQUq0f0VSC5E=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: McF9JvsryK5Jcya3w+KH97a3P5xXcr7RMjBnG+rEcCCWzNC9IH3WVGp6sTNGXW
	 s/qYu6oYEOp36cyxBBIxDQc+bGnh831VmBy64GLTwROHQ1eK6qL3eXQBC+MMSi0ZlRhzTJKtfwoJf
	 pfXJ69iKHquhSEZN7+GRfwRlzofl43O1gVkMog5lCS/+wo8lCaWRlaiPvdvxp+etUaEqrt4cJgwCY
	 u2Oz7YUquYH/RDzZXnQmV5OpI6K6JTCmQD65sEzo6eCSEyZ7BXvVa93mbNah3NL+l78iFP3Ez4dug
	 rR0IAfnZup899cnaPpa9QI7abhA64I42x+1BpCPjYItF0y1qElaxJDxA22vAfzRMEWyWgaAcdEfXy
	 Ixweue/j2ixELDnfS7hUzuF/LxOlSlILbxvR0WCL9bluYz5nljkhekJ1iT/vvsCHue07lIMAXur9P
	 vruwu7RTojGVl0ijdq1IJ53njkUmIJcbxvO+a3QMf3mvUHt+O8urfoI3BFZDF8hOxlds5yF/uFXOX
	 pPKA4/8YuBzO4m5D4Uj1YGQLHh5IY5RVmzDCazyI/4/F3NuR7qDD9mSUxOJwZ7/xZ6FANBAmhHvIW
	 30KBcGAuDOxITm9Esu9kWrY0ZG9Bb85xHjHMPX91dtYI3CpMFFztt208Q6OhfsVOOt4KWxUREIUin
	 6+TFJXtMwSToEOaffjA1hpzSdo7Hmzdry17m3+2KkN6gHqCLS1oOYCdL7JYW5GBfytXzhue4DIrz0
	 SrslpLlOsLaexwSdcOn5HT2uzhcfBM3OS9sSZoF/R1famtRU+geZl+zFEbnDRRXOXh4ybioOowqP0
	 Hr2LNNxXXHZynsFVj7rUgomH8zauJFo26MZ5U9HJsVc8JI+d3hHpNwvXi4BZ/d6c6l34ahmJ1IFoT
	 MoHWaFAhpqRSW9cW3VJVDbaFPVxmWPIPXQSu4YQKQNSze4qNLKjXZpzUPXB0URGmZGxiuo3V7ggS3
	 X2OKgW1WJ/BX5s66gDn36NkXntSn++n+f/QPa536gjAU+a/6OGQ3scTUlcCP6IfegGUrJCXg==
From: "=?utf-8?B?Wm9uZ3poZW4gRmVuZw==?=" <1768315307@qq.com>
To: "=?utf-8?B?TWlxdWVsIFJheW5hbA==?=" <miquel.raynal@bootlin.com>
Cc: "=?utf-8?B?bGludXgtbXRk?=" <linux-mtd@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?cmljaGFyZA==?=" <richard@nod.at>, "=?utf-8?B?dmlnbmVzaHI=?=" <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: spinand: cache the last read page to avoid redundant SPI operations
Mime-Version: 1.0
Date: Wed, 9 Sep 2026 14:29:21 +0800
X-Priority: 3
Message-ID: <tencent_ADBE12933F3EE6A4DFBD640C15CB67442305@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
	<tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
	<87o6e7u8jt.fsf@bootlin.com>
In-Reply-To: <87o6e7u8jt.fsf@bootlin.com>
X-QQ-mid: xmseua17-0t1788935361t91bksk78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_232930_814694_7CE4A3B8 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

Hi Miquel,

Thanks for the feedback. I checked the email thread and patchwork, but
couldn't find the Sashiko review comments for v3. The v2 Sashiko
complaints about:

1. Cache not invalidated when databuf is overwritten by non-cacheable
   reads (RAW, continuous, OOB-only)
2. Pages with uncorrectable ECC errors being cached

have already been addressed in v3.

Could you please forward the remaining Sashiko complaints or point me
to where I can find them? I'd like to address them before your human
review.

Thanks,
Zongzhen
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
