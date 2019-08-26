Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7647DC3A5A5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 07:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A49E2080C
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 07:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NkK4oR/6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgwNGXBf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A49E2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jar6AKOc37Kj3l+jVbxDFBIUtrbEk9Cp6PxQe6DCTg4=; b=NkK4oR/6li3kbZ
	Qw5tjSASt1Cgq2tx3aBJrziezHvc2UQw+m/h3uSl1erOEs+r9D42tgeeJEwSHf5gBf7nKV2ZOzZdK
	DnPD2Jmwv2DNtcXJ9QYDu81polsNAKVHzSgigSSkPgChyBAp7PVsfFWkUqNaiRF/LzY54jbYYvXlX
	oKNcfoRl5/8y7VRMG1H8g9OA6t3XXxkty9wo4Xa7x1wbWNuQ5zFeHH9JtEZheBBco/64r/TQJvsUZ
	GABquw6DJBlaVDlqYK5Fm5UPTJXzsLB1H/jfKUKawPzYMBJWUQ1zYn0WE76I1sZRgOhoWDjFW9D1+
	YbP3Iu9ZAkr11kug0prg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i29ee-0005px-IE; Mon, 26 Aug 2019 07:43:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i29eb-0005ou-9N
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 07:43:06 +0000
Received: by mail-wr1-x434.google.com with SMTP id z1so14271135wru.13
 for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2019 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CPfJYNj/vr8qfYHczQg8BMzBP0ihy/vaBIvutGAAoEE=;
 b=hgwNGXBf+8znUmyPRGAVICDDTM5HMTd1h5qTufue0bN99y6UnBPAKKnwv2Ot1E8pmV
 GCvfij2LUhwzNQoYA2IYXMooV/Zq7FANyVrV4WhAAht0o1mzpJxsECBSBXJ+ic1es05W
 Gb3PGti3Ea+phnvitToZhG7znFhlh5VxtggtTP8m3VF6xVnaNJdIJWn4GrIHkbv2hKib
 Qx7qkEnN1P+exNdibWtLbov4I6MvrlddhITvbCtKzrC/T9sDILVMNikhVcA1efFlUVss
 Us5mtg/qXbqNwz6pkfIKa1+HOdhdgaV6IfosAP/pVNzN5TGofy445t0JVm9ix9xuVnAD
 uBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPfJYNj/vr8qfYHczQg8BMzBP0ihy/vaBIvutGAAoEE=;
 b=Hf7R0aPS6RQbdBOVbILznYXYHAlzReTYqYLIpTfX84z0vMqao6Tbh56DpAsdADEbk0
 p5ROCNwLtPwH4RoGIrsIZsOjDzhtunHdsP9uEIZ880orXF62hNcZyaMR7ifnqMPbTgwG
 7Rys79g677wKbeAiNky994vL5bEA3kr2EGIOfPpdSJjcGS7xdsUGq97zIFvn3LqMVAws
 67hG6uedAQ9yKmdTCZ39I45PlGJTqUxyUdm2pnnrAeV/6bmJFJPojo9nMm13PwcTzArW
 WEkfQlSYoqi9FcpJZe9S3XWDUm3LzrN5eqddroX309GjTHUXCOthNgYANc8DAkx9cR/y
 XKOw==
X-Gm-Message-State: APjAAAUgTLZya8REJxHbowfnCCNQZfVJ8MwG2bdqxLtQLWiBQIOf/+qm
 ln9x1LO9Nhyd7S+OPkvkoqAfha2aNgSp8+UI+mA=
X-Google-Smtp-Source: APXvYqzuwIuP3xdhcGEytAtOSYnpp5tmkqm02ts8+Jl2G9gF4Nk4Jfpw8tkX80NV4onSdZ6OoO2W7/fNpWEPJCFV5nU=
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr20770337wrw.185.1566805383875; 
 Mon, 26 Aug 2019 00:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
 <ba3f204a-aa11-4a81-97ab-cf8e7eca7e94@www.fastmail.com>
In-Reply-To: <ba3f204a-aa11-4a81-97ab-cf8e7eca7e94@www.fastmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 26 Aug 2019 09:42:52 +0200
Message-ID: <CAFLxGvx6RDvzXC57DeqyfMkSxCo3-0kr=uJebR0f6VsY0pUpfw@mail.gmail.com>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
To: Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_004305_353324_C6D922C3 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 26, 2019 at 2:32 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 26 Aug 2019, at 04:53, Richard Weinberger wrote:
> > On Wed, Aug 21, 2019 at 2:06 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > Looks like a lack of robustness to filesystem corruption to me. LWN
> >
> > What exactly makes you think so?
>
> It was a bit of guess from a brief inspection of the stack trace (that was probably
> unhelpful in the overall scheme of things). Sorry for the noise.

No need to worry. :-)
Without inspecting the image it is hard to say what the root cause is.
But I suspect a runtime bug in jffs2.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
