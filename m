Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7150EC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:38:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29CE423B01
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29CE423B01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lmbZ7RFy5oPZ0EgQsvGHrM7fvQrjT0lsaxfR5Q40agg=; b=zkfWTAAn67mAY77G2AeQt5+fg
	bDPoUfk20sU9yQeoh8VIROSrVLT22SYreVMCwzhAcilCcwUNGPq6m/mxOeq459SK9iBoz12ucLYid
	9mwdvuTluHpxcJmMG6gwWlWTfc6qHHu9B0eQU13R5DZY2aUi0xOScLCEzgfb0grKfwzTvgfqtLs5b
	pV1jpCadO9G3ftWPaWI3xl5H/tO7s+ji9eFFOcAzy9Szv92Z9rH0NAEZqAh0ERyjA3JusXISjv1UD
	UW8Q5ajTVCJm0lHFYYfgAUtWWO8qxmiZCjwbxZorpqFtx9D7FvRivGtJMATu5gLo/I33MoK4MqrPq
	rhkKO4gVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3480-0005Ef-Ob; Fri, 22 Jan 2021 21:38:00 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l347x-0005DG-RJ
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 21:37:58 +0000
Received: by mail-qk1-x729.google.com with SMTP id z11so6661574qkj.7
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jan 2021 13:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z01sMEM1BHDDDy4DLJ6CtoFG8LkWlK4WVMit2bUEiks=;
 b=exvIKpbaQJKw7viwBDrWQchThnS0qFGB2za1m3aBoBnhTpOWkyw3IDmeFY02EwPo8S
 XFvhW1HFLhHvp4VBrzHpAcrjy3rexoNvhBIIN7aVtsUtwLl4AmmDcobelXXt4OMwCsuw
 l4d8/GbHvv3DG3lFX5GvTt6Iq1SnfL7z/3ozFBVm9dwQo6pJwLmKVAg+VvSnRGZ5DM23
 54oO8OUWlUbQDdU09Q4RtKMH9vtDUvPk1AbzFdS4eKVcgElCWo5+z6kF61dvOXiXr2dU
 rJGpK8/dpfFW2AkzDaRFF3eIZOa4dU5Z2vNWK6syiJ0r/JfQVUtdVr+6TKrVp4QD2k/e
 /hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z01sMEM1BHDDDy4DLJ6CtoFG8LkWlK4WVMit2bUEiks=;
 b=ZSPnz8LvligwsdFJmDdA4QyT5dFd6PZ6xvuAnv1CqNBxhdeQ7BNdveVEyXLoXmbfd+
 rlxfqQFxHLN/BCnQFDILzSZ0V/Coh5w1BuMCmDCm/h7+xkLd6wvdfDaiMAVsMWlNhhmM
 f3DHB5E1dyiC6p2Ws5zfEJsYLLPR0qr/c6AMvTI0C6OyS/k3OkoyOlXemZkZsuyMzPPp
 +u9jjQXj5CXiuyShppwVfOqO5ao8MFKj9Y3fczeLcMmeuV4LvtXj755euZGHnTYZGo8z
 l1MdtA7swKaMzYS8BuyfgolG0xG6Ta9QsUMVshG0tp6ZmGzuuXEZ1DQzmrlqHBighE+u
 EApA==
X-Gm-Message-State: AOAM530OBYUR4JgFvAfiY1U3vKZ4ZNb8Uie9YoGLHO059vv1fN3zKY5a
 ROlpk+1tzjS9icCj93bY1iJxNZJ0NyZJSMsX2mQ=
X-Google-Smtp-Source: ABdhPJyjIS6wf1++BNEZehaFXPvE86D5YfbbVJc2+dJNt/eYNRD17y136paRfTW2VVbvirqQPmfvLC15rRHQkWoHo3o=
X-Received: by 2002:a05:620a:22ab:: with SMTP id
 p11mr6727935qkh.237.1611351474358; 
 Fri, 22 Jan 2021 13:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20210115153901.31052-1-zajec5@gmail.com>
 <20210115153901.31052-3-zajec5@gmail.com>
 <20210119165138.4982ae46@xps13>
In-Reply-To: <20210119165138.4982ae46@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 22 Jan 2021 22:37:43 +0100
Message-ID: <CAFLxGvxu0Fd1bgHzuKER_R+kG+jet2oKBUyBFVi9NqDTwv-aZQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: parsers: ofpart: support BCM4908 fixed partitions
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_163757_938357_7045C679 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMTksIDIwMjEgYXQgNTowMSBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNr
aSA8cmFmYWxAbWlsZWNraS5wbD4KPgo+IFRoZSBhcHByb2FjaCBsb29rcyBmaW5lIGJ5IG1lLCBs
ZXQncyBzZWUgd2hhdCBvdGhlciBtYWludGFpbmVycyB0aGluay4KClNhbWUsIGxvb2tzIGdvb2Qg
dG8gbWUhIDotKQoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
