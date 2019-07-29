Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986D7C76186
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 20:36:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6576E20693
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 20:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jm/qRG0e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5DEu5bu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6576E20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D75c8GiSH1BSVybsUZmCXYIs6NSx9uHeU4ZJejlNcSI=; b=Jm/qRG0eKU4ltc
	PDbVsFYg81W5kTAG0RN8HtHMN8CHjyWzmmAem88p26ZR9ua9FApq08jLZ/wa9TB9KdawvYh892nhI
	G817/l2k8e6EtXXM49XiBcQogzjleqW6Ya2WnJC/7iYuKUyO21LB3K5MWeqyZINhw82SposLyifz2
	brv2WzXdrB1FZBIswwYMjHBcMfx2mQVoULUYshg2PpYgW1A4sdw7WYfJc0P6friXkLJ4glTnhg4cj
	XP+/RDTdnDHz0tW3cE8G5Ixl1ZjUCteA5nbzllM8027cFdN2vPUcRi4jtL84zvwFhvY/s1Q0Jgxz+
	/EbhSccGHWx+FWycAAFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsCNQ-00008d-B9; Mon, 29 Jul 2019 20:36:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsCNN-00008K-DF
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 20:36:10 +0000
Received: by mail-wm1-x344.google.com with SMTP id v19so54670458wmj.5
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2019 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FooYDDFf+QXrH1X2HJ27EzsB8p/Ze/1us0sP5MjgLwA=;
 b=A5DEu5buxVLitvWnebvp4Y9lHghguiQVhio58oKGyfjpXmllT17XLj/gRBHD6jusWX
 PAqJiU0rabGc2ISidvuOwYe1ydFs89v5x2DHR62S8dnXoRfOI6OUfY3UhDQl5Yk0nr25
 Q/0HT6zQj0DrgXJ38RaZssWYzu6y3te8m0l9eMAFCe1DIgIgyVm5pN35X0lHzcL+LgA9
 bR2BBO19zYhKGAMx/VMy1BI/sU7HFc+zvNBNek9IA47odqqmYxzD//dJ3JVu24Crb56V
 v8pVRznJOuswwoAP2HXPxr37HtdCAlnrjpx6RTBX4wO9LdlzxeSJg807BFEQk+LaibOA
 Vd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FooYDDFf+QXrH1X2HJ27EzsB8p/Ze/1us0sP5MjgLwA=;
 b=ZyTJAXM8syfY/VQTwKaPw4koZha6gG4lQbz5PEZzZjPTam4SLp70zkxwuqds1t44iu
 bXcKL0bLk80bOqmvrh0Vmh8pLIYNg/Iiwr5PvJ2jUnHDtE2A0+wQURujJB1K+5ptgmC6
 BNnTKYcOn2zihySO8A/+h1JcK+CbkanTBPhncSq3Dg9RUUYUbO2y1AY2cEm/zJQjAdwH
 zYEiueY5ki9I198I0Z2tmI9vYNMtzu4gl1IA5OPZEUhwIybBNPpumU5I111KJPC6toCx
 QZ85M8ipFGUw9Mq3EVQfXbw4mo/QPlAUeCpEsZdkVmwg2LiH6FpeXUE6nhm2l0FRmI1I
 rJsQ==
X-Gm-Message-State: APjAAAWldFqlXurPDphRg7L4JJdvEwQmvvc40BlQDPY4dzlqXMGbH1GD
 9Ha5FG4LZ+E0SiYY/tMzY2BzSiOqUym3mNYqLn8=
X-Google-Smtp-Source: APXvYqxObuwqk1KJbtVybQvwbQ+trqPkdgi1+saS04N9RpNZwHQRmCpidlFFShpoGdC098kF0WPndNGSS620tPVY/f0=
X-Received: by 2002:a1c:1f41:: with SMTP id
 f62mr102828308wmf.176.1564432567191; 
 Mon, 29 Jul 2019 13:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <1563602720-113903-1-git-send-email-chengzhihao1@huawei.com>
 <CAFLxGvxEAGtQDFm4G3orY+M9yuthDA4j0+u=HbE9DKuo7H8WCg@mail.gmail.com>
In-Reply-To: <CAFLxGvxEAGtQDFm4G3orY+M9yuthDA4j0+u=HbE9DKuo7H8WCg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 29 Jul 2019 22:35:55 +0200
Message-ID: <CAFLxGvy-LL1aHibR73beifVES0_oUB44=j98jRGOaR2ci3V=qw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: ubifs_tnc_start_commit: Fix OOB in layout_in_gaps
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_133609_453194_18C768D7 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: yi.zhang@huawei.com, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 29, 2019 at 6:51 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> > -               ubifs_assert(c, p < c->gap_lebs + c->lst.idx_lebs);
> > +               ubifs_assert(c, p < c->lst.idx_lebs);

I wonder, doesn't this assert trigger too?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
