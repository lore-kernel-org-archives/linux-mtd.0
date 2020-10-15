Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C31C433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 01:37:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC1B22254
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 01:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EWlhOdp+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmAOhx76"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC1B22254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8ngdWDmf0/kOdFfl7swY+6vgxsTyP+xJX9QW9moumc4=; b=EWlhOdp+aEnRIa3/JmrxBM5rb
	0fbZWJqHqwsVicsV0B/Dnp/zMsICKOwwYNM33WL5okPBD+VPvZ1xR6050mKzTzfQYsOxZ4kVUNaCq
	LapFb1sQV+A77E5lbH/J4YIsq0e42fvqAe6bDaCigo0yktg/Kpq2xMomm1KvSS+GNMlg9EL0VQgES
	SjfQrN13yFjNp8pNyXIkFUbpZrH49nNnbtAC/eMkQOhgTgX+1N/hW1DjL3+8ufkpFZXLB9TA6o3za
	aP5apyMGLuvVH55pDNbRhaMtIneF8vWIp94V5p0yCfXXUPH7J1mNLtCuWOW7OcpKP6eNpTqPTUUkx
	iKedDOjhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSsBS-0006jU-Ta; Thu, 15 Oct 2020 01:35:58 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSsBQ-0006iZ-MM
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2020 01:35:57 +0000
Received: by mail-lf1-x144.google.com with SMTP id j30so1639498lfp.4
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2020 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+NOWIl/SBpmOSKk3+GS383cnKrcZV4QgJHwBav/wQzk=;
 b=NmAOhx76nrUXIq6I+Dy4RWWEybicPzQaQNNuBZEU5wLtw3NQj6qu+8/OJx/cl0YuRf
 HTwM7lQu+BZUsnaaqJSWNfxldhwzSImYI//Jelf5o4jZjrEwIVJEhj3qXCK1d6/OayGe
 2eUxYs7enGeCSuhiTFX225vozyZSkZAlKq4cnuyCEUHrnw7/gQgB4ceNuwBh/5OJWvQ8
 xOGOirqR9sNLBUKoZiFFn9ni/bvO3xpn2h2goR4NnuLxePVMK7YiTBsY/d1/MdVQ25TN
 1i2Ktg1Vr8hi3R1/n6zYY9jB+0UwR0/aK2Z1Aa8B3+kAaLfGeje23VsVfWyD7wJ6F6F4
 gxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+NOWIl/SBpmOSKk3+GS383cnKrcZV4QgJHwBav/wQzk=;
 b=abdYfo5YdHaJq7qCneHMghMKz3WF1qL2Ed2JOJN/nq4EWHwLg8+9uatL1R7XWILIGJ
 li3p5HPHXnj8EUnXfwYY/j4+sbIZqAqgLfR2Rww/yuiVv5VwSDHk8O0ZIktFVxgT9m1T
 ALusdoA57XTD9JqOm4i0IXXhNPWe83Ll0ZATEGFWrbcEwS7XePyXk9yKf62UbfzACg06
 P1GTnytywccMuMoXkpLccKMK0UnUNCO93/9df/cnEuw/k7l7d0JCQ0rBYVnRhCSrSEVp
 FzxHxJwBv1Pif+gDRNuoZG4zBrwIR0EfLuO9VSbGhUeQgsRnQfUwBdycucANX4GHyqVp
 Jo8A==
X-Gm-Message-State: AOAM533NtskAjqQTEPCY1XpdU263ANKvYVNSEehFoKIdDeL1zkgvBThu
 KsOc+oCiNLDbmsnTmSoVGj11S5LzYY59nMdmUVs=
X-Google-Smtp-Source: ABdhPJy8j2gXrClHYqRNXLmo8WeDQlyx9+5Dxk8+bGa5I2swvySq4OHn/++KrGUbchm+u6wLBOCyyYcrAWHm7AGc9Ig=
X-Received: by 2002:ac2:4157:: with SMTP id c23mr247371lfi.527.1602725755220; 
 Wed, 14 Oct 2020 18:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
In-Reply-To: <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Oct 2020 22:35:43 -0300
Message-ID: <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Han Xu <xhnjupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_213556_747722_70E2BBEB 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Han Xu,

On Wed, Oct 14, 2020 at 6:38 PM Han Xu <xhnjupt@gmail.com> wrote:

> Hi Miquel, the changes to the nested switch statement make the logic
> of this break wrong.

Care to send a fix, please?

We have seen ECC NAND regressions on mx27 and LS2088 platforms.

In which platform did you noticed the ECC issue?

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
