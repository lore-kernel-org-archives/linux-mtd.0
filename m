Return-Path: <SRS0=p36e=VS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3611C76195
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jul 2019 20:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE9792147A
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jul 2019 20:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FzlJiD7W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajmWzmJ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE9792147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrXTTOvRVGwQqws52dS9yGalMzo22GuOPVvdj0vM4QQ=; b=FzlJiD7WGRw0s/
	LOigiVOwyGCGJo46eTkj/DI9POL8lLCbeg0hNHbDDS+eZdGQb+M2Hoon8QNDGBTiWwHf7gLn+P7ZS
	oCeHrUa+lyH1N7Os8GQOssWNgZzRFJTSCUkAuaOuuqQ0G9xBIh3phk0WiXO/5uqyhCac8b32j/eOp
	JidpN72fE/F/m0OkONFYJoh9LmuFtLsbQIuQ85SOuk/fJqzeQEhprfjN+9kvfAsYypFZKOuR3m57r
	56thC8EVArqZUl87P9SiDotRRoXtvXVMLQ+F1l/rXIMVBSyBS4Ci0Lb+VKRH7gtxEGHwops6BhGTt
	bciih91XEVgpO4dyakwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpIFi-0005Jv-Sn; Sun, 21 Jul 2019 20:16:14 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpIFf-0005JH-9I; Sun, 21 Jul 2019 20:16:13 +0000
Received: by mail-wm1-x341.google.com with SMTP id s3so33176235wms.2;
 Sun, 21 Jul 2019 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5mQURU8XMwBF9h8OyYB1FlQtcwcpgbnQ5NpLm9894DM=;
 b=ajmWzmJ2BZN67FkDAqc/2VVH+HZwyx7YqJkrdYmLSAR+31FdDgla9oyBcD5z0NdIaf
 oXJ7ojT34P5AXnhnJqqtZq/Rth8ClcZyN+fcUzozo3C4Wnz2+mDDdOfw5ls4licNsrFm
 anH1ywRXm/kz3Zz5WAfEgL388SZtjqvIJzo+y3Q7BzTzA+OLVQFXZgL31OseO3hnY3cU
 f8qJWMFKVdH057pZkcFxYwzGvTFiIJNWKcRaVU/Hn+z1eQcTXltLSyRZW6Yi3/j1ReJn
 z16QxpItA85gY9BxRpKp5RgNHG9XpJTDC4rV/ejUHNezCm7S0UuHZW5awX9wrifhaCGy
 TbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5mQURU8XMwBF9h8OyYB1FlQtcwcpgbnQ5NpLm9894DM=;
 b=pqzd5BQBdLglw4dxey6/OinUSSRV2Yuux6JcPBcgIy9kjt98r2l7jBPXgV9r+c97iS
 /hPZOY/Pwpkb5dmSLdnZm8N9nqrLJhXo780hujPM2hNsu+33U6BhUv7eSRFTtapdJBDW
 zZDXZRGOnq6P5f3QMy9wtCKaqTI89lkOBBssVBsSGlZJsfr7p5KaY3/onzXVSzM5MSwR
 jjrzKtg28Kpap5q4/U4Lgw8ox9l5NIO+rle4T++4XRNbDSKKQq2AfhJrTQfrq7ZcO542
 TEA0sFzmNRUiebzICjECO4O3UP4NqkAnP6R1VoaMw+r39XMbsvLFnEEmznh81mD9dfgT
 uQ3A==
X-Gm-Message-State: APjAAAVCFzG5jJ9esrNyYwct/icXLb1qBoctNgC9p7T7INZHUEGOHKMf
 KTnBUZU51ZqDa0jYuaVRfM1nKMALnx2x65mK3go=
X-Google-Smtp-Source: APXvYqzU1ipDd7z11gYlgbmMIrcaaVPCBINgAjXEUbNhWnpzSlGLMdHtlVTzwYZLvYGsn7Wr+rXtxlWkSm9DOzIIv5k=
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr61089998wmf.176.1563740166737; 
 Sun, 21 Jul 2019 13:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <1563451437-15725-1-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1563451437-15725-1-git-send-email-stanley.chu@mediatek.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 21 Jul 2019 22:15:55 +0200
Message-ID: <CAFLxGvwLTTN+S=Bd0gZWKJbjvanCe_HV_dfmoZzyb1hzWkkGpQ@mail.gmail.com>
Subject: Re: [PATCH v1] ubifs: support page statistics in vmstat
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_131611_350994_CADF4AF6 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: linger.lee@mediatek.com, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, kuohong.wang@mediatek.com,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 chienwei.chang@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 18, 2019 at 2:04 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Currently PGPGIN and PGPGOUT statistics in vmstat is only
> hooked in submit_bio() for block device I/O path.
>
> This patch adds this feature for ubifs as well.

While I think updating these counter for raw flash makes sense,
I wonder whether UBIFS is the right layer.
Why not directly in MTD or at least UBI?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
