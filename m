Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B29D111A8
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Nov 2025 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TahxOnLqrUEziDBJQwObxnWBVrJAFd3bLZVk2dgyNVs=; b=uU/lmL2y52mrvW
	zInKana4bX0gQAgSQnk6zNhasJ746ccp41sEd+Ww7qKuiAwtEtKl8BDJlrOpYIEYBDe3fjG6onR1s
	fAxlgR+NgOZnTciauPmsEx6NDWgYrlatUWPQyBNB4H1y7Tyy7wG6a47wFcXwsZdsTFPD46UW4bWQK
	peOQH7fjFy9B3W3RQXaqwv9o6Q6Xfry3aSuXhFEqCq0hbPx8Q0Hb2ockyXqjiBGzNhjPWDrJ0I7PD
	KIYoc3FCu6/KT1bqRsUDLfNpKnB7r2poqFE6jyIgEowrAsrnGgzDH3Rp/QIgpJaZK0+PyiJ7DSEqA
	3EzUARled4IcMZjnn5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOiGo-0000000HBKW-2lIv;
	Thu, 27 Nov 2025 20:07:14 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOiGm-0000000HBJz-3iLq
	for linux-mtd@lists.infradead.org;
	Thu, 27 Nov 2025 20:07:14 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-37b9552618aso859091fa.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2025 12:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764274031; x=1764878831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UgsGyEmzjD3zZqRcsR9R8lzA7lCFWx5G8khkdgaryE=;
        b=fpdKFgRAaQh++k/93d8iNSeqAVs0Nu99ao0FBAptt65Gb1rifg9RfCMAmGvn1jc7r3
         JoDF+RN/8M1QKrM46bhQ5NoQpASsmOiBL92RH2EqpSgWkefxaUqjy/qaCgIikshkdxxW
         1jdN8AId/v9YP+kJzzF16Q9tEY82FEPciVy+cqX3iosknfKmzEdFw7GygmmdZ+7PVJst
         9Jz0Qo5DEuUgZzpgL26JBWWA/EnVhnd5bwPIxmkn29BAzKycDyXzldXasAU7C8RTiiv1
         08cYofgEcXD31efw/McbpMOrRvwZV5OAxJjL0hrEjxZNx5qOogXB5Hm47n6O9sj3To4k
         zUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764274031; x=1764878831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UgsGyEmzjD3zZqRcsR9R8lzA7lCFWx5G8khkdgaryE=;
        b=Rr3V0R+pc2+dftD770gE+tDj8nxM/gVRn/2BUXYdcWXHjf29XOXWL+iUd99f7NmJ2D
         13KzHfZw+s+yp8rjegBYzlbxN06N+X+PwdENUWUrk/9nKPzmeeIfG/Afeh9Jwt9RVwlv
         zvBG5LMTNEz9wqs27KsFOEQdWWUOfUtpNYWdajNVTgTC07zZxNbnOeO0nKy9RMAuAktL
         iR2Jer0raYi+VxuW/CTCLOH8oB2qurGlRdg18wvJPk88d9l64fzZjqZWY2dVhJbLDmK7
         lXT6Ks5HHdUyzn9uh8D1Aw5p8NvB4DzBUvbJW7HgexlhsUP4BMkksq23bVwU4uRwrTSU
         0tLg==
X-Forwarded-Encrypted: i=1; AJvYcCVqN/7+dx/BrvLauQ9LfBvgB9XEVcaNiJUNXbXsFjmxwJ26BhzI9KHiJqJ0bZICWbAH42OnVe59ABY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQOePoOEGdnlEyre5gCjD6ROYkR8zAdEvT7WYHu+rSJJ88Ldte
	IKwDKZW7ByxURUqvGZRP99xiGVF/tG/NvVYUu9BGc6m22bR5Ob8x9iB7
X-Gm-Gg: ASbGncumLObUz3R4/9Ioo7KmY4J3iwd8TjB6WaM5T6qa93wACpNZfEkKPf3HCTQMc0k
	EWQqMOel1WQjMiVqoqXjCeymEJY1kc6MkAGLXO8IQwxxjDD57NHoY2iFdx2TQLz+PdQTQffQzqF
	rjLpeT33MdRitsYz+dNZQy3dQ49hGLJ/J4p6dyO9MYBYwZUHXNI8BhHkj8Bj/DUNNWE35OOh6hB
	xWQSyVr8GaO4AxwSksY8+MWVz5j3xLnAUG45/zGgWr23HUdJmwsV3eM4w0c4bp89ige4MVvx2C1
	c064S4BwaH78a+olfUtrhm44/T9QMtuTpFABgoPUg6gNgOsqpyWbShNiWQP5nE2TkfCgdycy4ti
	YVxD3BbXhRmSzP2CQ63q7wBZ5ql24fOdGTSzAXnWnSWzq7Lk1aNX2bFSmVWmGk5gFuS5o9kr6a9
	DMe/DPr8IhOyBvV9P6vChi5NzghKCFwkzt
X-Google-Smtp-Source: AGHT+IF/44ITaswa6rozZNEwQl6xaBJ3UNk3ke9A4XGy43wr6AalhiPDUIHzjZYcf8j29Qi6jji1IQ==
X-Received: by 2002:a05:6512:39cc:b0:595:834a:b1f0 with SMTP id 2adb3069b0e04-596a52a9215mr4638447e87.7.1764274030551;
        Thu, 27 Nov 2025 12:07:10 -0800 (PST)
Received: from OpenwrtBuild.lan ([178.207.14.215])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596c2c243a2sm14408e87.31.2025.11.27.12.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 12:07:10 -0800 (PST)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: miquel.raynal@bootlin.com
Cc: broonie@kernel.org,
	csharper2005@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH] mtd: spinand: add support for FudanMicro FM25S01BI3
Date: Thu, 27 Nov 2025 23:07:08 +0300
Message-Id: <20251127200708.2689-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <87v7ivs7y9.fsf@bootlin.com>
References: <87v7ivs7y9.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_120712_933983_AEBDB69D 
X-CRM114-Status: UNSURE (   8.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWlxdcOobCwKCk9uIDExLzI3LzIwMjUgODoyNiBQTSwgTWlxdWVsIFJheW5hbCB3cm90
ZToKCj4gSXQgbm8gbG9uZ2VyIGFwcGxpZXMgb24gbmFuZC9uZXh0LCBjYW4geW91IHBsZWFzZSBy
ZWJhc2UgYW5kIHJlc2VuZD8gRWl0aGVyIHRvbW9ycm93IG9yIG90aGVyd2lzZSBhdCAtcmMxLgoK
RG9uZS4gVGhhbmsgeW91IQoKPiBUaGFua3MhCj4gTWlxdcOobAoKLS0gCkJlc3QgcmVnYXJkcywK
TWlraGFpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
