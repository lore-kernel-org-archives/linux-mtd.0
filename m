Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E070C4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 08:03:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D3E3222C2
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 08:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KcwL8gTj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLG/+sjQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D3E3222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAa0K5ea0puZaXady9WG6wKamdDu0z8V/Blyx6U4Sa0=; b=KcwL8gTjxBdjiA
	88I7K0Jfpxe5GWkpyxzokpQsF3DolDERaMsj15i/mr8qqlon9GqbP69AFt0Nay74quSe3vsU4Cp6g
	vQ4ggpCbThzdHGOzcDP5fr6XCWgK8OP1uOzU6+bNMuUMYiQKqTy5wwfDvtRJui10wU5fndROnYyVr
	d6eEyMQNGNdbiwpE9g3zVhvc6iw6vcwsSt62U2RXKQ9dHqX962KJOyd8qs5vS556JMUi4N8MMBzYm
	GgOMWl2ex3+siTwRfDb5XZHx2QPVZztSJt3UIbzRakNPBhYZcI8xnGFgqVq5kSEWZN1QIcCGBTXB7
	kMQxFOzUPsHml5CPXdHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7E8O-0005DF-TO; Thu, 27 Feb 2020 08:03:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7E8L-0005CZ-V5
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 08:03:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id a141so2244753wme.2
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 00:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fhf3IZugBVe98+oHHcrhDNpWo2kJFqnxZvIwRyl6n/I=;
 b=nLG/+sjQvZ30HToJsz0ktf2+1mdHVXDoQ8pjkYLONTSnDzhIrF7ddYPLBZ61WTi69Q
 vkY5tF5ZIA8Sq3ydaioCQhLvB/KEfcm3GUYWE5l5jzkqWjHHbNzqnQOkzLZ+ya/Hcl5D
 wvpocUEuUHrzfy0f7Yhed86X2h25KItBW6Rttrn34Zlk2excNm6S1X8tFKAe6XXZsSGy
 9BcrN1vj4rTxt2Wih8zYfLg9vKCzXt63z2gVyPCXz+qoF37SLdj65piHowtfP3cLAxy5
 a8NEEwXEN5zHj3VxSLdOGfgE98oODzIo25XEjuLg4vbKh20OVRx2wRXCb1Jc3BZr0jFm
 rRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fhf3IZugBVe98+oHHcrhDNpWo2kJFqnxZvIwRyl6n/I=;
 b=Vzzst6yhHYmNdxY5/PiEIv5C+1Yl5doRtee0RwGCo/opcR1/khXLlugG5zv9kMP8lQ
 1KJoBJcInpaNg6/GUnq6VaEyK7qE+FePoDmSdGLnp89k7n552VDI3quYwi3qUlPDlbe7
 SeBXG9xt04Mm230VbQVsUJyKNNFrNf4Ly8FRaB++hLCjYl6/TpbKXU/8ztExQzSqQqlt
 lSZcXXaBRu72aAeL7T9P9qIijW3YqkMH1Wed5SWUKE3w7XOdPXO7k6wa4QmycTiDKsx2
 zqn8EFA/YGpJHLoq+ZqEw5IpvB6mslQ5BRTw3WOEPiibVIGdKqIf4MJQqlqOgPWyLMDe
 60UA==
X-Gm-Message-State: APjAAAWf/SN2uFeNUTdL9MPvdc/vzBI2dGwsx+Gc96FQ86lvQC4NyFKZ
 Lxv4U+9RIrQyCEmQSCXuYO1Mg9PRGYZXuO69dkk=
X-Google-Smtp-Source: APXvYqweTm401AKoZP/kKB00By44YYoVutaPT3tE793oU6OyKfTtP0P1PhT4p9L4HhnkejDYJ+o890sCmoRYZmGlQxc=
X-Received: by 2002:a1c:208a:: with SMTP id g132mr3452799wmg.143.1582790580583; 
 Thu, 27 Feb 2020 00:03:00 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWSjWZDRcNFj3e4fdaV_u5AVNiksgykcDhqbHXm_aqT5wQ@mail.gmail.com>
 <CAA=hcWS+e_LD-5aS4L3LLgUGnofa1fh96R+24v=Ek_oBhv9L4A@mail.gmail.com>
In-Reply-To: <CAA=hcWS+e_LD-5aS4L3LLgUGnofa1fh96R+24v=Ek_oBhv9L4A@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 27 Feb 2020 09:02:49 +0100
Message-ID: <CAFLxGvzv_QaEmmpM6FsskmVAD_Nrc6b7qgz43Bc=xgVhUtX2yg@mail.gmail.com>
Subject: Re: Cannot mount UBIFS volume rootfs to RO
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_000302_024775_17AF2FF0 
X-CRM114-Status: UNSURE (   9.15  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Feb 16, 2020 at 11:51 PM JH <jupiter.hce@gmail.com> wrote:
>
> Also, the kernel boot and mount the root to RO:
>
> [    5.465303] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2,
> name "rootfs-volume", R/O mode
> [    5.517493] VFS: Mounted root (ubifs filesystem) readonly on device 0:14.
>
> Does the UBIFS have some hard wired to reverse the kernel mount back
> to rw? Could it be some bugs in UBIFS or could I be missing something?
>
> root# mount
> ubi0:rootfs-volume on / type ubifs (rw,relatime,assert=read-only,ubi=0,vol=2)

I'm pretty sure your init (systemd) remounts UBIFS back to RW.
Of course you can mount UBIFS read-only.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
