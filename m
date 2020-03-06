Return-Path: <SRS0=bEc/=4X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E47C10F26
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 08:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A049020848
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 08:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U+GEZ2ez";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTLiPTzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A049020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkwxDerKZdMfUIKL5p1MbfYKooCSOjjZuaVayzKT/J0=; b=U+GEZ2ezq6lhC+
	Pf62eqIirZEkrVNIdBIWpz5MExKUMwnu+SM95GuW5l/JjTLJmAjFgZUB3JWUoJOyo9Jd93B5BuxtG
	zzPxG22wI/EObrjUpTY2erBKrAwuts8AxyYjRi4KR9kaF+oo/TuwwKWqz0e5AE3gISlP5M2rRW0bA
	JEokdCiot5ftSq93xZlIxqdan4C5hnRQwtxEvov5O3I8VNlUXjgp/BxXtFU8+lDEkapEAjENpKGMY
	mp7Ov+FgPFYusdBOKcy4qW06Vwqnqb/VKY9a2uVjhYb3JGXipQWOp9WjA3wknY3jPkGO0JVNYVOVh
	cNBB4wc0PMtC36ZkJmPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA8Vk-0005cJ-Jp; Fri, 06 Mar 2020 08:39:12 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA8Vh-0005ac-Cv; Fri, 06 Mar 2020 08:39:10 +0000
Received: by mail-oi1-x242.google.com with SMTP id a22so1741836oid.13;
 Fri, 06 Mar 2020 00:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0YCzrMdqSOCLtIegMTpdezODLLacO22ik9gMI/OohA=;
 b=TTLiPTzKpN1qWN3EEFTC/u8fB+61JOECJD8HcEHhufaX9NawgXNP+CtoO70w1n7/rT
 gbuiAvBLa7ov+c7HyMDa/2ttOgLylNuZpso5Nq1Evc3IB3CEveDPOKMmpnLMpLzUg/Tz
 F0hvdMD5bfrhjOSGDqDyYvtD06RWhIju2DEzsCbkC/SbhJf6bYn2HY369DIzAVC7TSyA
 FBWXloXfGAfNCdgRp8h805Ik77umoY8tRXYzNbl5RMyAywhRL7u2JUs6i0FKOfttOWKp
 RQMR/yFbrg2cxmXtRtipBXAR8HWBO7yaIqDiYg8MD7UTpGWv72Mixj81Ymqt6+uHkfqu
 HO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0YCzrMdqSOCLtIegMTpdezODLLacO22ik9gMI/OohA=;
 b=nDI4avjiIZqpcED+Bv4F/zsVk2EQRgRqCW9G3ezNyzhAx23VE944ipcbFqUf6dg+KZ
 /N6rXcKRfB8AvISp68ElLiwm9PuXCZyrH/q2MRWvXP3YqPWgClrk5835meBX9nYc0ogJ
 SGFP+vv/ovSvXRXWiyBi+/4DFTPbtqYW/ht+CwalfF0sxR3/hXS8tLbIkvIRlbcbbHRc
 Nqz6ByFb6luLFh1NENUZ5SWVf1Vg53/r8GBI1KR0zm9NANP7DNqCFb2RxTLHenTjPNxm
 FFoAhuI/qahKdhrSuNbcq5WwfDUORh/nlZl0uGhHqn0gzad2b1T+zDCZDS9DgZW/viZv
 Fasw==
X-Gm-Message-State: ANhLgQ0BW59OV9VS19aFqqcEqHDYJno0A2Sf+S7zo0kGN8mxnis+BxMS
 3PE+lc/ZkwTFJzZRgnUIIg91iwjxSUXOYZ/jgU4=
X-Google-Smtp-Source: ADFU+vuScZHY2OPIYB1fCsKFbxTT74N+YFxRuCirOj8v8ukqPreNKXLIN5Ul0y9nHN0b8tlqiERNHVdq1j4ynySyfE0=
X-Received: by 2002:aca:1101:: with SMTP id 1mr1851279oir.30.1583483948255;
 Fri, 06 Mar 2020 00:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20200228043636.559915-1-gch981213@gmail.com>
 <20200228043636.559915-4-gch981213@gmail.com>
 <20200303224706.GA22867@bogus>
In-Reply-To: <20200303224706.GA22867@bogus>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 6 Mar 2020 16:38:57 +0800
Message-ID: <CAJsYDVK62jqkLimdZWbLE2wgEAuVi5HdY231nR_wPj4TiMtX9w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: convert mtk-quadspi binding doc for
 spi-mtk-nor
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_003909_458381_DF076755 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 4, 2020 at 6:47 AM Rob Herring <robh@kernel.org> wrote:
> > 3. replace binding example with a mt7629 one because this is the
> >    only one I know the interrupt assignment.
>
> That doesn't really matter. It would be less churn without that change
> and examples are just examples.
> [...]
> > -
> > -     flash@0 {
> > -             compatible = "jedec,spi-nor";
> > -             reg = <0>;
> > -     };
>
> Better to leave this in the example IMO.
>
> Rob

I'll revert example changes and add a dummy interrupt binding instead in v3.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
