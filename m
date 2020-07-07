Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAC7C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 16:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A649206CD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 16:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IG/9lg3H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLP+5VBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A649206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sri4o3hgs+opCKCJqkRXJUekxIKz7M2PcxUUkfCIav4=; b=IG/9lg3HFgSxoj6venuxl6iiK
	NJzk2x6W1a2MI9a7XUWrSwsSUrfRcnTLaUOrcyRbtNag5l9FgyAIBao3E6ZNi9zfEOfLIAeMRLu16
	8blxlZEFDND3AVuV1wE3pks06iiSxTcjIH2IQYWrdxTViwA6WXZmGHgP4kWgPPn8rAul6OzORiMCf
	klRM+SCtSQROz+f8EVtcqmP6hiaW3Jm97e5zE3UBlQzeacyp1W8HR+oPtWSsDgiY6s9bQEEAG8swl
	6ZI8hz0LxgKdhpQfi5Yls5UGf4ZHudzpHDSMScGrjdoymzpjAawLsCmUEnAg0fLOLV+7PT4T3yCb1
	rp2I/kP2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsqUX-0002yI-HN; Tue, 07 Jul 2020 16:30:45 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsqUU-0002xZ-TN
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 16:30:43 +0000
Received: by mail-qv1-xf41.google.com with SMTP id a14so19092816qvq.6
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2020 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ti/+hZiOquvF5N2JLhYOzuH+AIpIHJEt/nDYOxccwps=;
 b=qLP+5VBPQz5ox+9pAMpWmJbxG7qvfMXwFt1ZVAS40taFtFVS2G4AboXtjtfvafVeK7
 qQjX73lv2CvlbFf0DPfnQTRpbZRXcc2MDuONjES3ebATEyWvXBFjKShxlYc2dFgUp+8O
 KF45M1p7f8MWV7XroKuY/3a9TwJBofCnqXqG5WK3Tpea5+xXDzcQr32Os+98ZLbFB93z
 +ZYF1nZimfd6Gr7RDkfDhpXrJe39QcXby4Y55mFEtswkKBelC0/WJenSV8m1ZTwHa+Wo
 DKc8T+6VbfqNibRIfKBUjl8kjv6AY8brZTM4h/KroBNHslFbOwtRodDbIx4fX8vSLN9B
 DhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ti/+hZiOquvF5N2JLhYOzuH+AIpIHJEt/nDYOxccwps=;
 b=PEj9rBdnlera6WPGX+xBqSliYWGM27pesAkm4o8EZRQUExo8POCvEwICk+wCqFxGe1
 ad1YUPuAy8gTDkHZyeNtzI10V7E5vfZRUhvp/DNyjFSP8OYHW4NpYTjGN3dJCYm5ECb8
 87lR+bd8n7xdoI9Jg6AVKIbnr0J72Bw1x2v/5kUmB4/rf0QO7wfgOKkOrqcqgKng1p/0
 J3FUBX1xdRK1p/wYBEEZZ3qQv2iTPgphk3p70zmiMxCB6O6Qi8S/0btIFuoxaul+YGG9
 HUO0HppqFjeQrlzeKnR82KDQgRAMcZphVb6E8/ZWp+dJn5cM+Les5S8lu0hTfubq2KBY
 5f0w==
X-Gm-Message-State: AOAM533wPe7XieMhqCinK+rZ939D2G0p8RHjm/C8GtnyC8V2MMYYL7Q4
 LU8Cxjn7poYQxCkEd7LpdPMSBEodliRio2XFgsE=
X-Google-Smtp-Source: ABdhPJzFd5AWBG/kEeF/s9VNCdKXRs9fzrF74RxtC/PKZSPqDvtMtuOPN7uCe5MFF4We5LsuMqNtnbFuNYTdkShwCH8=
X-Received: by 2002:ad4:4903:: with SMTP id bh3mr53168588qvb.17.1594139440905; 
 Tue, 07 Jul 2020 09:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200619090635.58548-1-lizhe67@huawei.com>
 <e0d04d70ce674584a71af1a5a00984dd26729891.camel@infinera.com>
 <dadc539df01b17aa5dc85e7c0f1dbc83591667cc.camel@infinera.com>
In-Reply-To: <dadc539df01b17aa5dc85e7c0f1dbc83591667cc.camel@infinera.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 7 Jul 2020 18:30:29 +0200
Message-ID: <CAFLxGvzP3AuZBJ3RugZiRTobxv3Z-kxYKnBUi0rfshwf7GuuCA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix UAF problem
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_123042_987739_3C29AD74 
X-CRM114-Status: UNSURE (   6.21  )
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
Cc: "lizhe67@huawei.com" <lizhe67@huawei.com>,
 "qiuxi1@huawei.com" <qiuxi1@huawei.com>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "wangfangpeng1@huawei.com" <wangfangpeng1@huawei.com>,
 "zhongjubin@huawei.com" <zhongjubin@huawei.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "chenjie6@huawei.com" <chenjie6@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 7, 2020 at 4:08 PM Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> Maintainer ping ?

Whoops. Applied for fixes.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
