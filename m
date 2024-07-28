Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA61C3DA49
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2024 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OafzBP7fj5BJULhq6o0uGUkRhPz3iITY52/KdIFnQPk=; b=WD0A1CZfLiRZ3L
	weSJ4mi1E5ar8B2z3Z3gDplt3N1AIgKFHVAAlHm1kNs0nD1b3b5F4t0ukhP6n0yhC7Y/YNfnFxBzf
	WIiivvuuRulxDv7GGj7mPatTSJk+FOqNeBpXN3l3FjoegyCzE6oBtzeOPvYOEPaIbYv9K0neln6nh
	VMpSYgrGfTR50FZbnCZQQfhltLianuejmalHWpgQ9lDBv3wr0SblTN+npOYygYAEyWphsGTOA/w+l
	Imz4Dj7nF/JvrvBvpKgtNSdnGpXq5Lxv2Ne4vIq2eDXe6Jku5rJ9MpJ9bGCbfmnHDxtQ6NwHI2tyM
	jqMfGu9OLVJLl79Y7Y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sY8GR-00000008z2a-1ohk;
	Sun, 28 Jul 2024 18:04:59 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sY8GO-00000008z29-1JjL
	for linux-mtd@lists.infradead.org;
	Sun, 28 Jul 2024 18:04:57 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52efd8807aaso4341293e87.3
        for <linux-mtd@lists.infradead.org>; Sun, 28 Jul 2024 11:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722189894; x=1722794694; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xx+JcWmCLFNs3uFPu/ZR/9mBRzN/vwNYIcCoPtFGjmk=;
        b=gTCzYcvFPKxdT1UOHM1bggJn19phMUQttyKTh+wt395ZW4uSRTRg3n+w8vigWRHbwG
         Qk/0dMny0hQJ+iwmqM09DCiI0A4kGhKJu7SOjjyMR8wgInOJniQFMqFdzavXIe+Dr+L3
         M91TXI6vZixJCcuIJPWgW9/zdxC3JzVnXKXFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722189894; x=1722794694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xx+JcWmCLFNs3uFPu/ZR/9mBRzN/vwNYIcCoPtFGjmk=;
        b=YSJWc96nJCiUULTVRxq3sapMckcX0PuSJsJrhfRZ8D10O0koWCxyz/awQLnatELZ6h
         nDTHMnTMq1Rbj7jR/wdx4ju/PvzDVyLynKkMJNCZTDeAfevODZZb0FcHXGFZ65n01gFw
         ILyrjEzjCwLtm5Xb+X4ikUeVfH4rrEYydtW54W1A2vb6RKS0lZMNomomUXUOzk6yZXNJ
         OuEsCP0rTSX8sB9/qCj4BqbJdONo3GgeCfNbhMV42Wg3g3EL93+Dwqv34ybuxOfK2Fv6
         oYjsOD5JueqVnddFUv5BS2CRoCxmqIef6tJeCn0Kv90pQeOEzINrVDlfAmaT6FT4vR08
         Y/ug==
X-Gm-Message-State: AOJu0YxemODw2XoXqsIbZmC1GpzZGPiZxZp/jxJeG7b1nyekVQBLfRiX
	iukZPAJMoBMLxsq4eKkGGbidJU2Ry8SgjoSYBPFgt6xsmAN3Doq0VhWKgRfRyhsojCeBoU8diup
	H17LsAA==
X-Google-Smtp-Source: AGHT+IEJS6Ink8ZixoBfVljOI+hVLfrys4Ut4wstPdf6qX8iIiJu+U6haokvGXxayC+Z/6Tq3tup2Q==
X-Received: by 2002:a05:6512:3d1e:b0:52f:244:206f with SMTP id 2adb3069b0e04-5309b2e0603mr3918735e87.53.1722189893599;
        Sun, 28 Jul 2024 11:04:53 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c09088sm1186555e87.120.2024.07.28.11.04.52
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 11:04:52 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso33912611fa.1
        for <linux-mtd@lists.infradead.org>; Sun, 28 Jul 2024 11:04:52 -0700 (PDT)
X-Received: by 2002:a2e:81c7:0:b0:2ef:24e8:fd83 with SMTP id
 38308e7fff4ca-2f12ee47096mr39079221fa.38.1722189892347; Sun, 28 Jul 2024
 11:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at>
 <CAHk-=wjK1ZLk8TjejsRfDUH2Jp4=FPfD_GQU9z-m=bm75+jBMw@mail.gmail.com> <2116767413.129257.1722150789677.JavaMail.zimbra@nod.at>
In-Reply-To: <2116767413.129257.1722150789677.JavaMail.zimbra@nod.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Jul 2024 11:04:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjOQVJjX9YL08cbeLFMm_EW_NdZ8mHb9i3+=y=6sGK6mQ@mail.gmail.com>
Message-ID: <CAHk-=wjOQVJjX9YL08cbeLFMm_EW_NdZ8mHb9i3+=y=6sGK6mQ@mail.gmail.com>
Subject: Re: [GIT PULL] UBI and UBIFS updates for v6.11-rc1
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_110456_388732_D8FFB014 
X-CRM114-Status: UNSURE (   9.02  )
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

On Sun, 28 Jul 2024 at 00:13, Richard Weinberger <richard@nod.at> wrote:
>
> The issue was detected and fixed two weeks ago:
> https://lore.kernel.org/linux-mtd/20240713073519.25325-1-richard@nod.at/
>
> But I forgot to include my very own patch.
> So, the failure is totally on my side, I'm sorry for that.
>
> Do you allow me sending an updated pull requested?

If  you do it quickly. The rc1 goes out in a couple of hours.

               Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
