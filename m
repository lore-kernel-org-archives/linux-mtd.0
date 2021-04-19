Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314DFC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 13:03:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 901B561107
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 13:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 901B561107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BkqHl0rYu918Mzan2CZVW5QzN3T7iutmhwhSWGaUE6k=; b=Wm3ScHCwB0a1kjL/3k1zmLrVS
	IU3e2ZrFALWAOZ9NZvjZsHXFxjKHZewIR6e09R7WWvSS9ZgP2x/gamKZGtynDob+kh0edgQzQdLMN
	3hDO3IXMuy5gtWJP2g/ttsuS+QdQD05p4YMe7iVsJ+T6I2/xI9FSyz2NBPRwG2zKX4HRV+Ia4sDL7
	HAiAIXd9Nd8GRC8INVkMsHJv45xY9q8eO5WSbB4NK2RbuOd9BVYtAbWv3EdGSIwW0c/53o86iArz+
	3/2q5LFqhVh/xscWKYbiJRWasLUgexQY6OjkV5IlCH8v4tmEk1SQHr4HyAWk9z1khxDLGxaPpyHgx
	7ACECCGOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYTY3-009tso-Ig; Mon, 19 Apr 2021 13:02:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTXT-009thm-Ns
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 13:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UHD1G1NZWhSCK9odfzzytbvktmBGLl70R/CDJGEgbvA=; b=hR90oY/m7Uo6rhFY8taKrmcYp8
 tKHMey5uEaqJhH5yvbrgNeA21pKIDLtbeezznj/13G+GzYGHqU89vSd0ToU2+bRUL30rsCtnqryTJ
 dbEnE74g/nyGRS7SHXIm8oAxliYdfMl5lM7C7CWmOA0DgP+LGo/zK0NJnh9M5+02rYnSikMUJiTei
 AKCpqWdqV+mR7Rqz7vZcdQ6BKhoErEDh7BHJip4Cy6FxtcbMas3Fpo9voMWcfHchULt4n+RCNfwWg
 1oaH7GkFmnss9JyJXtOtbypG2uCqiapZvd1f+DZrZV0Sy0/IKHyUZGeu6to7dBh0W1ZjN1kP7w88D
 e7k+ouXw==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTXP-00BN28-Iv
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 13:02:06 +0000
Received: by mail-lj1-x232.google.com with SMTP id a5so2261277ljk.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UHD1G1NZWhSCK9odfzzytbvktmBGLl70R/CDJGEgbvA=;
 b=RMoEqD/Msdqw2PLOXRuewmPl7mUmxm/EoqsWG5DZqElJMrD4wZIAbZPztjqr/OLHy5
 NUvcHLPw/z/SX960+N198Ab+T0kTADhTkelkuzfPBBoHvWKnAmJQzg0WX9dxjEeqboQH
 xizBaJnLWKHCgTZreE6LtfDyLHl1C3cywkBMWN3iNfPGhCyrKSBrgPKP0ouIJGq+tTEb
 prqlk6t4u6herS5kWHSNBhgo2tOvfheeXlOekZWnW8c5IhHpbVlOb27Yxws3G+EFB+cP
 Yo6coA2mJR3LVRYfZMXoefIDm/A/7RfLeLgUdsxAaHX5J6CIpzX1pE272g2QFxojXUZi
 T33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHD1G1NZWhSCK9odfzzytbvktmBGLl70R/CDJGEgbvA=;
 b=Xm/LwVztkCTBXgnmf1csEqZhRfDIdqnMJXtyts+obQ5rJMDP+UQ2zfmnF/S/ZmZRF0
 i6OZuDJQbsRrMBCWv6KKtfxkvsRnCffXJxlFckpJlmfbh+ewLIqI6Z77wHzrPPA8zkuU
 qmVJBy2u53lSWdvy6IELirfdZZ7LZo73oMu14JbiN+aVTk53KtaWtLYfKVazyL9KRIoG
 GttN3lE7uJnovymj/4QdkrhUBbHJKPZ0hJRX0V8tjG/FewbWT5HgLZow/bEKPRYeJjcq
 77HTnUNtLoWLqAd9B34Ci3w9ud7xtnpwPZR7ABSmf4uMcdKZ9INv1MLIDMcjq6zGqy1B
 UrnA==
X-Gm-Message-State: AOAM532dXNcp6Dt0Ni1Kudcsag40gw7IUp3L4RpYROREbcseu8f5rphc
 2xQOEpWTDMxehoEbDaHm9nyvxVdMAMjxsiqynBU=
X-Google-Smtp-Source: ABdhPJyiQYqmPd4w5ww9ZeBpZxYFbrD3mjwuYllYrRKc/KElQ6nd57P9+RUr9qdfs7qnioPWzhKpOvp5+yQCvx/F9Ok=
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr11411799ljj.490.1618837321597; 
 Mon, 19 Apr 2021 06:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <CAOMZO5CS03F9dDeaUus4WRBv9z_1svx7BqHM=b6PkxeUthGdzQ@mail.gmail.com>
 <CAOMZO5C921yS9mVkTpTjwxapjKhr_FgSddYcYXA62LBVPoK=9g@mail.gmail.com>
In-Reply-To: <CAOMZO5C921yS9mVkTpTjwxapjKhr_FgSddYcYXA62LBVPoK=9g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Apr 2021 10:01:49 -0300
Message-ID: <CAOMZO5B3q1H30vr1X_w9Vmy9wcFwU5xkxzfm8U9rGUVDcO+dcw@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Sascha Hauer <kernel@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_060203_661427_5A79091B 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, Apr 19, 2021 at 9:48 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Apr 19, 2021 at 9:41 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> > This commit landed in linux-next 20210329. I was able to find the
> > kernelci log for this version and NAND is correctly probed:
> > https://storage.kernelci.org/next/master/next-20210329/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html
> >
> > The first NAND error starts with 20210330:
> > https://storage.kernelci.org/next/master/next-20210330/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html
>
> linux-next 20210329 introduced the following logs that were not
> present previously:
>
> Bad block table written to 0x000007fa0000, version 0x01
> Bad block table written to 0x000007f80000, version 0x01
>
> Maybe this new 'two Bad block tables' will confuse the subsequent boots?

Also, prior to linux-next 20210329 the Bad Block table could be
correctly located:
https://storage.kernelci.org/next/master/next-20210324/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

Bad block table found at page 65472, version 0x01
Bad block table found at page 65408, version 0x01

which matches the Bad block table reported by Barebox.

However, in linux-next 20210329 the bad block table cannot be found anymore:

Bad block table not found for chip 0
Bad block table not found for chip 0

So in fact there is a regression starting with linux-next 20210329.

Could it be caused by bd9c9fe2ad04 ("mtd: rawnand: bbt: Skip bad
blocks when searching for the BBT in NAND")?

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
