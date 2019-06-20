Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849EEC43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 19:57:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5B52084A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 19:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7NmrY19";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="kth8MnUp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5B52084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCCIzR6BWCNQ+WICgu3lXa+0Q5hwAXdVzMakJpowOCU=; b=Y7NmrY19tVWLt0
	sIoYXj9J+SJZ8bRE83uNhwvRdlr1dnkYlXag3TtffcX9pGubyZ5HriTjYCm4fJovPg44uEdjKq3mf
	/njxPPome1UQQN2+haMyEwMg6qXD2tDDUw8bK06p3f8B1XAEpSDBSNy7BRCdWxKGi5H/45FsznDZS
	uYUQAVL3l1T1xkwWk9CfxrIhc05tEHKzsS90sNuGLTf5d1XnuS3TGKHxxqu7axys7Z0NCccrXZCxF
	TOtbGxo7wUuGDUXq+kpHlzo9Eq9yhMOiSEdWoHW5b0GJ4FFBh48mgNWT4vr4M/sVpDkfiIDxyS3/N
	TKDNgiofyKvo5OQmqJYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he3BP-0008QL-5T; Thu, 20 Jun 2019 19:57:19 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he3BM-0008PM-27
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 19:57:17 +0000
Received: by mail-pg1-x542.google.com with SMTP id y72so2115347pgd.8
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2019 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s0dGUTL6eh2cw6ZjVrg36nefIFWQ8LGFInVMiQ8EtQo=;
 b=kth8MnUpjxyuCl9fAHan9Zr1btXnsrS+SXmfVZD6ide3lk4u8eIs3n/RAAPUA8Z69y
 yru8kEG3F4D99rdy9VTgkLr4G9S5TJn0iG9tXFPoK5cdux9yKfyH/ebl5pZrdZ3pG5U2
 erboCyCjhbRBtMSYG4yCmEM8EUTUmM9F0+b7ZG8qTOTTesY2zD7/4VHq7pn0A2p7SFVu
 f1/+A/RP6+PZUzRJCXhTTIQqJWEtVfeBtRGpH/oTpEEiq8R786PYepVmyBbk8+Szo64J
 jKHRObHwAotf01Dl4oRyjBCwvK8yXJmO40drgi8v866r4mf37GMhu8koCOarJU64u11F
 6wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0dGUTL6eh2cw6ZjVrg36nefIFWQ8LGFInVMiQ8EtQo=;
 b=Rf9rJdmzSs0O3Knc91imOnT2aIrRFux656AzuFhjHrGwjRsvh2mHoOpFSDg7K03Jxp
 tyf41cwfg8lQF+5wsFDMeNO3PxQqCRZgLXsxgp0Rxl/O2EfZvh1MM8HYWDhI/qnN5ciW
 t53JYVLg5wOke+I6nce+9ZemJaaberRG8aeqlKVFW/FUyf0oMQS1kH1UQFv963GPd+8+
 7Kc7EgmauGY7syjTAQ5KRF2Wm2J8BDQzU75kJ7BDsdTqObxNUKdfXrDnDwsmQfvz/MZC
 Ei7eLIt6UImb+cQxn60Sq/47hP3KDdQArlZRge0sJOoHnMkrJ9DZn2FI2Is1tVaTlUDt
 oRmg==
X-Gm-Message-State: APjAAAV8VfmIBaVlpXmffg6alan4unGxoyOf3X7aJ2HRIrrgUchVyztf
 lWgalQHWam9oiUmzNLu9xQl+XcTBCeEzi8Ew3B17+Q==
X-Google-Smtp-Source: APXvYqzl/20aaRBmRoGXt3kETQ7Qhl+p14lzrG0EYxUeYrU0503TNSYKL4okd2K0mx/+BzbCHSRf44rXbKeGSuwULlo=
X-Received: by 2002:a62:2c8e:: with SMTP id s136mr88622095pfs.3.1561060629486; 
 Thu, 20 Jun 2019 12:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190620155505.27036-1-natechancellor@gmail.com>
In-Reply-To: <20190620155505.27036-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Jun 2019 12:56:58 -0700
Message-ID: <CAKwvOdk7ZTcWEXPTBASPzk1SjOdnONawtQJkR-jU=REFSo1hVQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd-abi: Don't use C++ comments
To: Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_125716_105595_44184FA4 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2019 at 8:55 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When compiled standalone after commit b91976b7c0e3 ("kbuild:
> compile-test UAPI headers to ensure they are self-contained"),
> a warning about the C++ comments appears:
>
>   In file included from usr/include/mtd/mtd-user.hdrtest.c:1:
>   In file included from ./usr/include/mtd/mtd-user.h:25:
>   ./usr/include/mtd/mtd-abi.h:116:28: warning: // comments are not
>   allowed in this language [-Wcomment]
>   #define MTD_NANDECC_OFF         0       // Switch off ECC (Not recommended)
>                                           ^
>   1 warning generated.
>
> Replace them with standard C comments so this warning no longer occurs.

Should there be a fixes by tag?
-- 
Thanks,
~Nick Desaulniers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
