Return-Path: <SRS0=Xhow=5B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9FDC0044D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 22:33:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B19E20663
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 22:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PbO78Wfx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtJUj5yB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B19E20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+aH8ABfpxuKEE9lexYQORmRYijD4nyzlso1uvGbUpM=; b=PbO78WfxIlo4VE
	SlMYSeCbx8eBRfGMObScfBdpBLSQN7NEDkWRgwLQUDe5WG3LebqphCOgLK5P8mWJhLnpBg0Qt+3RQ
	0lFs0AOet7eirmDOH2kAXBWHRpclp5XpBxhVi3SwiS5/VtAsqBVvHwUXe8X1r0BmuzUvwObFP5f3G
	yfHjQbjRuNng596eVjac6ii9R9NkIQjvapuS0wGRMg4/f2isAbZJY+hCV+OOSQ0gRoN1BYdg6d3S8
	nq+lsVPpAPVkXSGabJS9IlAFC5es2J6Pp6nsM+VIOPfoyrzUc3bXTaMkX1MuioOSwDVuI0nweOK1+
	VfkJ1+eBMF7fU38RUeoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDyIy-00084y-3K; Mon, 16 Mar 2020 22:33:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDyIv-00084e-SU
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2020 22:33:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id h6so2942943wrs.6
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2020 15:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JWl+iNNE1kQ6qn42a/qyjhKp3jU6JENvi5djsutMII=;
 b=RtJUj5yB0cn9Tbgu/sSt5bnZX5S4AFxcetNuRotPINWpCl5X/ZH+7SMf0AFAcjKfuD
 RYjB46w136PDMVLF3pBmV3j91q+uWg3GfHs2Dh0RpLroTSsu7LTBvdCQUYRHSibaF/83
 eaDDk3LSoC1lI/jULKQEBvGFfe4cC0/e7XLWnLQ16QKkROWQmmvkaBx3LnS2y5A5m2/H
 YG9mOIqfe8DmdZsl439ku+Yw5+rLFByWyX4WaABwll4wdruhUmwd/gwWQDuYpBaRttje
 fLFCA5N2v/3fuRwXPvr5gGPFOHzryQc8XgP4+KCRuvXZhO9gGXDFEZZ2bVzAy4iI8NbD
 DX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JWl+iNNE1kQ6qn42a/qyjhKp3jU6JENvi5djsutMII=;
 b=QTSOy4xPxuLsgOtSWr71H1ZQQ0GN1XAAfoXbENGWfDr1VnBpbvov1WD2YNUD0I8e5+
 +Ro0YAl2NR6YubkJA/ldNdTdKEH2m6T5pPLakmO8M+BchHKze4wyvohuo+MDKWNZwAM8
 sF2UTZLf4jfOrh9GH4kLan1AuuLFvhzA7VrlbosyQC5WdOqGb1aWRiFqJLbgOnaMTNqu
 Fqfxh0wHZQU/tkuKSZnlFZFBAmLP51+PpZ2+Tkj/atFZtBZvHI/E1GgONuH8r0mA+WRx
 JqQoWtW76MIV/2PFAi6mgZl94Qaxob2D3myb5c7PfJHVOiDAUpPeS2wTuocvO2sG6Njp
 OxxQ==
X-Gm-Message-State: ANhLgQ1CEIQBuMq5BICdIVL/SCR8DxvsENj9CvbeTfhRKGaxs01uJSAg
 P7/tDn9jDx2O4/W+39Sw35ctIHt7HOeG+2XBeK8=
X-Google-Smtp-Source: ADFU+vt7w15DcS2+FivImE3I2sjvfJYRLyLsBS8I4vScBeSorxt5oWqP2yTKQGFmBZIaxcDH9fkYGqQVW8UiK5vPWik=
X-Received: by 2002:adf:df8f:: with SMTP id z15mr1590237wrl.184.1584398026579; 
 Mon, 16 Mar 2020 15:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200305092205.127758-1-houtao1@huawei.com>
 <20200305092205.127758-3-houtao1@huawei.com>
In-Reply-To: <20200305092205.127758-3-houtao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Mar 2020 23:33:35 +0100
Message-ID: <CAFLxGvzrZm=r03VFXWV+=XU_LaVq3XPGeKJxGm-YnV_HHVu_wg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ubifs: read node from wbuf when it fully sits in
 wbuf
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_153349_919847_662BA98A 
X-CRM114-Status: UNSURE (   8.69  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, Carson.Li1@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 5, 2020 at 10:15 AM Hou Tao <houtao1@huawei.com> wrote:
> The actual situation of the problem is the LEB is GCed, freed and then
> reused as journal head, and finally ubifs_tnc_locate() reads
> an invalid node. And it can be reproduced by the following steps:
> * create 128 empty files
> * overwrite 8 files in backgroup repeatedly to trigger GC
> * drop inode cache and stat these 128 empty files repeatedly

So far I failed to reproduce. Do you have a script?
Or even better, a xfstest?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
