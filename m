Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D690C07E95
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 22:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D7016112D
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 22:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D7016112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iirvMLQ9eVBBGf0wlrBOJWdHHIJUPP6FZq4bsPDgmeI=; b=fQ3hOsooxMRp/v
	jBNmjdI9sr3nHCMAc9sqJkczgEvvP67J75FUWTPbE/cyIDSXQCuCXntDC/N1DSnXcVGcXybvA7w0D
	BVQsqGpvUcAEhlSeR1JUEP6UX6UBWw2Dx+lxp2+ECppXZ+k+uChY86R5jy0m9fR5O9ig+RYsvrULw
	OsFjcHUSh8g+uUUt6gzzEyvgfl0Y/gs/AYGdykBva/uVYIv0GFWTLjBTsSfgmdG6EsRFPDDf2NJ0k
	sO3TYgNYTtQRhu5ooj37/Il5AstmrSlCl0F9Nkix8AovG3OPPVxZ6BOY9JXU5yEOb9QLHCsYDOJNT
	3JdNjL0jmmR8E36DYbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5bdE-00BPtM-2D; Mon, 19 Jul 2021 22:21:00 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5bdA-00BPsp-Un
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 22:20:58 +0000
Received: by mail-lj1-x229.google.com with SMTP id e20so28480967ljn.8
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=giLVdFNjkMf42ynjdwMyRWp4rAUYN1mhjNp+VTRX3T4=;
 b=t2kLWKe+frM9Wuhpgj+3uycEP0Bfu0hggEokGkRQi5ztETQaOyaKMYsTwU7QlElitY
 N8m44uy85zvn9x+AqAuG0Y4aJS7meA5lJF/FO5liAGlVDoxqpVzaqRCf0zySEbPhhbvl
 jndE7seImVY3I5k1w9bxKOW8DhI2H7d6qrLedGqqPmAtsDhQihHD8nnV4Qfcz9BbqF4i
 /hT7el3em3s8sOTJdLP0+XDjpk1h+SB3gmjSaCwQftio9XC2Gqt7E8I9q086VZ+3LguG
 oMyDGbO/RyswdPckFUBqHwqMCSGr0f5DZkq5lcBMhiF/GzZ9ltSO9WwutZV2hY2pt1lS
 ifmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=giLVdFNjkMf42ynjdwMyRWp4rAUYN1mhjNp+VTRX3T4=;
 b=tUjAUCVlDMoP0Iu/huYeZMQHizcT9ok5JdUlj2hrawn0OtEK3rjwpy8ZogKjAX/YWA
 HdyUrO36KXZMmyguf8FIvdjr6zB2mlWuSAZ6yveUwWpEszOiPXKFKXZ5AMaZ6vxtb60O
 HHtc+FHBM7lyFgkFN6pbCpW8L+HALOG0Cr8oWvHY5/zfxkTf6ypcGsWCZBtusnHxcOjA
 nxFOdYTIA5tB5FrSD7eCMwbVETZiBaMWWDbUs77vqsz3EfVsAeWb6rDSqenL3+33bGpL
 ImdWstS9S2g5ZdIZgN5iqorsjvWdKqfr3pP5t5LgVIjoZotPp68pKsRjOCD4gfdVB7S9
 rLXQ==
X-Gm-Message-State: AOAM53229aGqV/Sxo1cqQ7qA3VfbeFlmzCQOROg8Sc0OaahcKKlMk/t8
 QnRaZJSdIerkBFzCjzs8718mHB6BikLwscYZ8JAgYCk1+uc=
X-Google-Smtp-Source: ABdhPJyJHKHuI5Cx9VdTrUkL1Iq4fBOqlNA3vmy3u2jOZivtLiIgzPYUBoIvocjsi+7QFDGWO85cJ4jHmI2ux0cVkkU=
X-Received: by 2002:a2e:a785:: with SMTP id c5mr24200042ljf.490.1626733255170; 
 Mon, 19 Jul 2021 15:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BX9iYmZwBBGEstbcWpvftRNExtwq+kX_rQff0v_o1P5g@mail.gmail.com>
 <323618383.46712.1626723406949.JavaMail.zimbra@nod.at>
In-Reply-To: <323618383.46712.1626723406949.JavaMail.zimbra@nod.at>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Jul 2021 19:20:44 -0300
Message-ID: <CAOMZO5CL7VVSUnQtB69xsrLLRiDZWDWkQCdegW6eJyk-zqB_MQ@mail.gmail.com>
Subject: Re: mtd-utils: Proper way to handle erasize=0
To: Richard Weinberger <richard@nod.at>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Marek Vasut <marex@denx.de>, hs <hs@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_152057_051393_91296740 
X-CRM114-Status: UNSURE (   7.83  )
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

Hi Richard,

On Mon, Jul 19, 2021 at 4:36 PM Richard Weinberger <richard@nod.at> wrote:

> Didn't this commit address that problem?

Ah, thanks for pointing that out. This should fix it.

OpenEmbedded is pulling mtd-utils 2.1.2, where this commit is not present.

Maybe it is time to release 2.1.3? :-)

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
