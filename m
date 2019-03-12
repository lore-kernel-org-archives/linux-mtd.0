Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD46C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:17:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB7E2087C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6Kyj6N5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X2jay6uD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DjU2Rz9c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB7E2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nWfliHNeuoWlg7pjIASYPwuvpHSTce3Aql3FuhvmPI=; b=S6Kyj6N54DJuIF
	MsXpJ6D7V9bqn98uZg4WvdFGvFD4qUGsFBce/9vuWF6rOGrgSmE1pzat1pdtvJJ3kJOryD1pUYWhU
	mplbeBcpgQhBkoKgsurw31/u9wmaAKAzD9xhTs+wqMRa5LtGH2xZWLkv8b4UYGr8xDfseZC70qyMJ
	I9iEUktYaQiEPKfPodiuGGrZlaEUQzQu9x02DMnoSZoRUvIZOiP6yVtH2VFchpAqN49JEfGiX5p73
	8dgsMDsGzvYHu4GviKKIkJJjoFSIRn3hQ6k33jAUbN8mgtPjveMpo2wzdQtZO2NjL2DxG7xQpjI81
	GdEM7j+hT5UggNDakmJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h40wd-00037n-96; Wed, 13 Mar 2019 10:17:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40qJ-0000lH-6G
 for linux-mtd@bombadil.infradead.org; Wed, 13 Mar 2019 10:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lsKe3e/rRCB2ilvS5ByoqjhLaNrBbXFuuZeU6FgWeaw=; b=X2jay6uDRgTS7IGWJ18dOmb8u
 Ree3vo8ZbhobrGykMv71PN3/eDlpGOiP/rS0ene8Nf7VTvNZ0XZ0BSAgsh9zAH2do/Nm6SESrL38h
 B7fh6eUQN6Ypv4Uijhag6GZyYB9b4xoZNTnNphmrW/NaU1lGWuRaWB/kV8z4igF4HRnbPCNIr6z7U
 EAcz0345Uzp7fy/nLpq4F5dZTTtaHwoeuTFasHTI7yRK7htcl7JCLja7GXfA4tZ3JQDpTy1bTjqQr
 bxVROhRUQ6cqgtmVbpHsL+M/u6XvISAAhKbpnnyaP49QZY/p3d3gk4SqeRkZkJc7QlGiRmcRh+XPT
 GIRLOfnyw==;
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3uoN-0003z7-Dj
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 03:44:13 +0000
Received: by mail-lf1-x142.google.com with SMTP id 10so340196lfr.8
 for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2019 20:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lsKe3e/rRCB2ilvS5ByoqjhLaNrBbXFuuZeU6FgWeaw=;
 b=DjU2Rz9c9ubVU3V1ayfdP/hErH6gw2To1kUnCQUGS4VJZWaNbwt205P09+S3qjzN2k
 WenjmgdKgP73MPbkLgL/pUz9ztGUC024sXplE7oUmC82HDSbK1astxS3sCqGiNVRbDQ+
 CRCqNWNr3Ht8xKXv5477pKlAnRk+7LEII/MUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lsKe3e/rRCB2ilvS5ByoqjhLaNrBbXFuuZeU6FgWeaw=;
 b=SZA7cGzG1Ry74T7ELlYK6XYuVYb0TCLmAxDKUBpA+L5i315EPG9eR5p3fWRZ1gtG0X
 DTueQP72Kk8Y+VaRPa6khPYBZ6o1QNO430PYQHBHO7HfRxLWx8cOZLX8S4xjiI683gpe
 gK9pHpekze81xwElBpdiZgK8qIxlgaMoc5Y6XqrMXWA8AwJwDGky8M+tS3EU4YPA72QD
 J+kSkkoJJy5ukzZ1VXHklKJpNSITSTPz9U9o3okpGzUlXd4Kk8ebrb13KvXCHtLA8LI+
 vCGmgVscso9bXy+Gu+z2DWSmNYWK9fQtO0UCqUyJwnmfed1VtUofWkfS2tidoMDkwPr2
 EHwA==
X-Gm-Message-State: APjAAAVdX+JaOxSZlYgrMDpXjksnBAxGmHJnwMv8Yt/RaN6c7AtN26ZD
 F/DGshhwGdErHlsLy7ExNT/fFS4piss=
X-Google-Smtp-Source: APXvYqySfjrqFfyo6fNniPEkIlF2lpfZ+xxCnOvT8uItGHxjvBf9oLMQk2z/YRp1o/MEMykEEL+QwQ==
X-Received: by 2002:ac2:4191:: with SMTP id z17mr22502636lfh.78.1552434050677; 
 Tue, 12 Mar 2019 16:40:50 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id e18sm1543456ljb.2.2019.03.12.16.40.49
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Mar 2019 16:40:49 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id k136so76242lfg.5
 for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2019 16:40:49 -0700 (PDT)
X-Received: by 2002:a19:700e:: with SMTP id h14mr21654369lfc.67.1552434049202; 
 Tue, 12 Mar 2019 16:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <6283638.XALati16HY@blindfold>
 <CAHk-=wixZBzR5nbPZ3Y1=VahyVDsqVZhRfRhewJybx2-yA_FEQ@mail.gmail.com>
In-Reply-To: <CAHk-=wixZBzR5nbPZ3Y1=VahyVDsqVZhRfRhewJybx2-yA_FEQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 12 Mar 2019 16:40:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiR64B3MY852L64auE8ZGBhfFoTNXG=F=h5TVEM5gxRtg@mail.gmail.com>
Message-ID: <CAHk-=wiR64B3MY852L64auE8ZGBhfFoTNXG=F=h5TVEM5gxRtg@mail.gmail.com>
Subject: Re: [GIT PULL] UBI/UBIFS updates for 5.1-rc1
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_034411_806867_83C7671C 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 3:18 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 12, 2019 at 8:13 AM Richard Weinberger <richard@nod.at> wrote:
> >
> >   git://git.infradead.org/linux-ubifs.git tags/upstream-5.1-rc1
>
> Pulling this thing is taking forever for me. I can _ping_ the site,
> but the "git pull" has been hanging for a while.

Ok, after leaving it for an hour and a half I just gave up. It's not worth it.

Put your repos on some other host, and re-send the pull requests,

                   Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
