Return-Path: <SRS0=szY+=XQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8890AC49ED7
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 00:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543AA20C01
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 00:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t02T7a4O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs/jzLy4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 543AA20C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYaO7OoWjDoWdzwCAHl/cWnyjqYj+3fe0QIR3iyQNa0=; b=t02T7a4OurtNY3
	NKCR/+kb5ZtaIC5IkTDQ2iD1RRhWfeeJk2EshOMx7cWl6Jr4mXIT6OtjrtZKfgfmVCXmqtLGDY5Mu
	JZ35A3lx2zzvg190hZRm8UYRY4mZSWlzwGOqQp9EWODbLEFuVskin+kIbCvbCOaqFxOoZzarn/DIN
	NQJ3MYodEu1DZ+3cdYox3ZG/m1Msh3rEBQbQY1wdy1wkZp3rQOd7BJY3GE58f3TxnRXMpjkRg5aq5
	JooOzvn4LmLWz0GUBbSm515RZ9401o4gM2JwEARDy/y41zzpfzNCWtDb5YfcHxtGFLm123QD/z3l9
	aTvONyhV8SwnmeZVPhRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBT22-0003b2-41; Sat, 21 Sep 2019 00:13:46 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBT1y-0003ai-Rc
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2019 00:13:44 +0000
Received: by mail-io1-xd30.google.com with SMTP id q10so20153739iop.2
 for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2019 17:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YukVsXas+TebfLvlUNTkLa6Bex7HaQ//yQjvsaRFhnE=;
 b=cs/jzLy461v3xqH86qLLLhQPbjW2cZCP2YW4jyrTFrR2zW8B3YXqBevqapBBG4rlMf
 fYqO7LrsLZZ+EEAki9qdBxLhX/rR37XRDE047Oob+GGxWvWslkfVcSYSdPH6rFc76vDl
 TpCdkokbqhbqVSUfKMg0/p0JH5mK4EiO9BFHBIgbXPNID48UofvLVuZ/aYlRYEPfOAZv
 GPZs7EKr+/7Z0GLFu2M6XyGATfvk8+lB7dpZR/plpIQzpl0qUvfmSTf+Ox10iyqwV89O
 M0FMC+pFpo5Q+qJseK+eBBhzY2g9IJieH9i+o9WSkc9FlrIArujjDlf2tr7EYkhwsF4Z
 x91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YukVsXas+TebfLvlUNTkLa6Bex7HaQ//yQjvsaRFhnE=;
 b=R0aa2lV5dof0NkdcgteoRWw+xhhluNzc2yOfQ3jcWy/eBoWZIbkBhZIiMTt0aFxs1D
 xTOPyggTYRVfhA7xRtHfCNadVe+bRsQ+YXCFGXRnuFPHA7E1gV0gvSbR5NcpZJrCP0Ox
 3NMunP/+JJaSwpn2kJJXD6AKEMQg3aCZLnP89go40ts+RgwhEQiH8K/G0fjG7L2pn45O
 drsXaw7z6DLy1QmQlONsz8pya6UliI5SMD27CcEMT15GTqV6U1APSU+HzLJWx/lOKYFl
 8f0sGdxmePxwKSFN0x3HAEsUWEnn7fXA15jOwEbBGhW2ZXWn3FEsxA6TU4UnQXcPl1B1
 48CA==
X-Gm-Message-State: APjAAAU90crHWjf3G5PsC+SVLdHwqKHi2ZBxydQp32XWd1V0XbN8/UNU
 AbcFVWWDXg/HALfKEmmv5PCoD/a7JlxHjI9W+UQ=
X-Google-Smtp-Source: APXvYqyBUd3Zaue6nznRcSVKURVegb88UeBN5Vz+r//onlAoc8mXUCXaflfPwbkLPLk3oRdjN774QEuBE6beedaL+i4=
X-Received: by 2002:a6b:6b06:: with SMTP id g6mr3879529ioc.72.1569024821810;
 Fri, 20 Sep 2019 17:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Fri, 20 Sep 2019 17:13:41
 -0700 (PDT)
In-Reply-To: <CAFLxGvwN1_BJ+3iB8fdKH9cJ_XEr_JvkToFAhxTzmK=FsixCbA@mail.gmail.com>
References: <CAA=hcWRK-ChXxovKqSLpDF+JO7DtjginYXY33O-xtEAq25MiuQ@mail.gmail.com>
 <20190920111010.AF800240014@gemini.denx.de>
 <CAFLxGvwN1_BJ+3iB8fdKH9cJ_XEr_JvkToFAhxTzmK=FsixCbA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sat, 21 Sep 2019 10:13:41 +1000
Message-ID: <CAA=hcWQ8rDkYz7wTtH0CuRW3xE2RAVNgYsZJOHd4jDRqLeiK=g@mail.gmail.com>
Subject: Re: Missing all ubi commands in mtd-utils
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_171342_920830_7180CDC7 
X-CRM114-Status: UNSURE (   7.83  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks Richard and all, indeed in mtd-utils-ubifs, my apology.

Kind regards,

- jupiter

On 9/21/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> On Fri, Sep 20, 2019 at 1:10 PM Wolfgang Denk <wd@denx.de> wrote:
>> Probably "ubifs" is not set in your DISTRO_FEATURES ?
>
> Yocto splits mtd-utils into many sub-packages, ubi stuff is in
> mtd-utils-ubifs.
>
> --
> Thanks,
> //richard
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
