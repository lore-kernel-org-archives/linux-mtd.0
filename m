Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750D6C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 20:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9C220723
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 20:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XKcOG/O6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3h2A4a5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E9C220723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gL9ko2Z6bdt+aFwnDIuItwJhHGGc8Sc65CU3ddfttW8=; b=XKcOG/O6mO6nI5CM/B2Ry4fJf
	eIQUTyDBsVPNmvvrt43SL0h3OwlJBlV00mzJM0YUQ6vW9uytPSK/PWrjXMqV7gR3eE3V4SCBuUMhw
	7sxFYwo6wPCToRawIQL5C49bnXR+JTV06PZsdf/+v+1fXK13G+I+Xxpv4QkVz9n/VhyX8sNaNXeAU
	tMN0YxCb4AwNFeGIL0mwJ7A8jBfrmdAXTW7CRcg3WkL/Ms7dfEiFgAGrXVsUhsLV+CC3vVbTN0Nm7
	JYIVLq3oBHlOCgnkCOawchZBz/MK58WPfMwJOPyyqwIjakt2j8Qt6LW7XWTb1VUOQ3dS90Z9DE2KH
	InBfoE1Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYxjg-0002vL-E1; Sat, 31 Oct 2020 20:44:28 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYxje-0002ut-MN
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 20:44:27 +0000
Received: by mail-qk1-x741.google.com with SMTP id x20so8250864qkn.1
 for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2020 13:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=muc0kVwivNXzGUfAH7TU9Xb3fqNFKltfoR7TwK0/np4=;
 b=N3h2A4a5sqoc2YkkSvR+llcB0PmusXb1nybQ23YFBNEMv9luRBYcgDQe+Ns9yDYZyE
 h73nk1aF8wU0CBWM329J0HO4POExnRfJEPhts49f6HRIFlbXplR0ujOJL78VdqDTUyRF
 IEikuVcs+YVLybFhxP5avOMANN4Zw2XAoQFpJxwdtWH8HMo1kwRFYlTeXwlXowXGjawU
 +3C781rZqg7IW5GLJgWJRXOi1oVTlPT4rarqWtoNEDoyabGSKV9ZRZd95ywNXVrDJLfH
 KAssFMepmTLh/8+XM9QL4TxTwXUBz/ihkWhbRlhc5RDZ6oNZ5XfEr3zh5lNvqaLU9kSe
 W5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=muc0kVwivNXzGUfAH7TU9Xb3fqNFKltfoR7TwK0/np4=;
 b=gH3irblNTZ6t+jXED1BYhBJEzKp6SVsSTz4LOVVJKK+TAzK71Dw6Y30VTzaFkdJDZS
 A/009EoEvOFkMdhUBcycuewgfDVDiRWc/Be0390y2SV3LJNnSJVg8OMHhmqjoK2PRCRu
 L/qMWsMDYjhdGmkZxUejAOv81fD2IkCq9fUrEZFzaUkcBazvvV6Uv0/U/EG/VP4FA+m4
 pd2YOc9gcBxSpVgrlDe2wukJHqpM7PurJhiZ95CqG3AaB5TijE0MDV3hM8IQRwCIMaJb
 tPfs4XGQkZs6R9ndxqrYP4qbsf+i9mOJPhsgyNGqtcMrAVLRsN1Lj6U22ztfBgQ9+1Ks
 vugQ==
X-Gm-Message-State: AOAM532CWodL+z1CF56boqQ740VZnu7975rbPIb2d6RxC5Sulsr/MBiW
 n9ViBw0IzR8KdTcjDLQZ0sGxX5KjZV8ZZZnk+d1cuLrac9W7vw==
X-Google-Smtp-Source: ABdhPJxFstStOYPuZdlbN7GmDhPQ7MzKgC0gumNK13a+9afl0w4AxcL03uU/AW1WK2pRywoYrD3u3MmM9QTcCZtW5nE=
X-Received: by 2002:a37:7183:: with SMTP id m125mr8375331qkc.237.1604177063121; 
 Sat, 31 Oct 2020 13:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201031085420.1316-1-kechengsong@huawei.com>
In-Reply-To: <20201031085420.1316-1-kechengsong@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 31 Oct 2020 21:44:12 +0100
Message-ID: <CAFLxGvxB3-ryVLPtS0XhZnu+4w-gSzzw=BV+1mKTGt3mOKbeiw@mail.gmail.com>
Subject: Re: [PATCH v2] ubifs: Fix the printing type of c->big_lpt
To: Chengsong Ke <kechengsong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_164426_752576_C287DF0A 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 wangfangpeng1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 9:56 AM Chengsong Ke <kechengsong@huawei.com> wrote:
>
> Ubifs uses %d to print c->big_lpt, but c->big_lpt is a variable
> of type unsigned int and should be printed with %u.

Well, it is:
unsigned int big_lpt:1;
So, either 0 or 1.

Does changing it to %u silence some static checker or is there some
other problem I don't
see right now? :-)

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
