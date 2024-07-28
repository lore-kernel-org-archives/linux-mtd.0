Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0B7C3DA61
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2024 03:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTzyDnVgaUDSbXKtP/UiWjPRmPbkzubWrQ4Ok0qA11o=; b=BYLsfmaTUEuBC8
	2Doq7zeqVykOqaWvRmI7zpqMqejYlaqs+Y+/bYaa/4bLlKi1aKBoveDjrNMT8FdLnG23PcE16Y6Op
	bCcFLZdKJJB5l1YYHms+wE0CELkewfMVnioZ0ShSF+Cx00m0LDqUgTU6WwG5q2iGtSnRDnLIDyJAv
	tq8IIR1EeqJhMNckjjC9rp5BJ3srNdbyJjbdRhpgNpIrNB+iJdiw4gqG5GS7Yg9jF40ma0Cw1j7Pk
	gs4M5Jp6Dvt51UP1ALNtrm/Zu79VMYZy/wtDSqKupEHdT9tur9osskS03d9X/xJD/2kBq/qYWh0O6
	9NhMajMW8yukAZUJrwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXuFF-00000007pWB-2LeL;
	Sun, 28 Jul 2024 03:06:49 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXuFA-00000007pVb-1eGG
	for linux-mtd@lists.infradead.org;
	Sun, 28 Jul 2024 03:06:45 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso29799171fa.1
        for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2024 20:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722136002; x=1722740802; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ClALVvYZ7xtCv1Otg8PivaNpPZc3HM33yqHaJy0R9VM=;
        b=CT5aswtB0eZ5ubtLElSgdC6/xyEbdYs88785HRBuofWvfVmIW1/bu1TGHR0D/NXIdJ
         nl3eMsnC7vR12dBvu7e2CiVrNHKy56srn8XRKkl4u1vwXHdllvSQDpQVnVAmRR0WhDeT
         5zX+sZx+90J74oG/CQjVVGPNFtE8Kus2TToGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722136002; x=1722740802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClALVvYZ7xtCv1Otg8PivaNpPZc3HM33yqHaJy0R9VM=;
        b=f3xH1ltUCXtptMfzQmJ4S5A1JZP45SFp85mlcD8ddO5KeQ6xWLNPFXPZJT+Fyo8uVI
         3nTA3+I6a9PYn5GDN7ectMfQEjeY753Dmmt2jgUCuKhbNVh/wbjosp//jZjAeYDKETl0
         8PCME06DShRvdfBvW+nBrttM2SSymledrkYhO7a2EP6Wg6k9yVIHSWwvgkTspPzK9/iV
         kEhvve4YAyFzrFuvmPMqYwbtaOSJFcI3IijW0GccyYzFhBg/MZbfSctK2A9RZ2Gdbbru
         0FI5n1UvF2cWeMfsPFj5ZT3ajWZHUtkKeoQEsgc69hzxwyxAmEW2o5Q1ooeTPJyxZEQp
         QAyA==
X-Gm-Message-State: AOJu0YwOV4gRIrhj07Noe1hbeHHiJi3Vde6PlbFzOHTVhaaGEuX0uND8
	9MB5NT0jedaGtMsYKdn238aIv3oXmfriG2xDg4d+6qNedULa/bLe6LU9r/WKH940R+X1EUUuYLn
	28454jQ==
X-Google-Smtp-Source: AGHT+IGq/8ENIefqG9QYzwfpoMpW2N8jytCCpVz31id3XzIxBMa3/ganpIuiDntpZys3Dt0C5AToSA==
X-Received: by 2002:a2e:8608:0:b0:2ef:2dfd:15e3 with SMTP id 38308e7fff4ca-2f12ee05e22mr24081081fa.19.1722136001577;
        Sat, 27 Jul 2024 20:06:41 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b145c8320esm714238a12.17.2024.07.27.20.06.40
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jul 2024 20:06:40 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34677so4167034a12.2
        for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2024 20:06:40 -0700 (PDT)
X-Received: by 2002:a50:a6db:0:b0:5a3:3062:36c7 with SMTP id
 4fb4d7f45d1cf-5b021190521mr2579570a12.7.1722136000501; Sat, 27 Jul 2024
 20:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at>
In-Reply-To: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 27 Jul 2024 20:06:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjK1ZLk8TjejsRfDUH2Jp4=FPfD_GQU9z-m=bm75+jBMw@mail.gmail.com>
Message-ID: <CAHk-=wjK1ZLk8TjejsRfDUH2Jp4=FPfD_GQU9z-m=bm75+jBMw@mail.gmail.com>
Subject: Re: [GIT PULL] UBI and UBIFS updates for v6.11-rc1
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_200644_567914_091165BD 
X-CRM114-Status: GOOD (  12.59  )
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

On Fri, 26 Jul 2024 at 13:58, Richard Weinberger <richard@nod.at> wrote:
>
> This pull request contains updates (actually, just fixes) for UBI and UBIFS:

Does nobody actually check the build output?

  WARNING: modpost: drivers/mtd/ubi/ubi: section mismatch in
reference: ubi_init+0x170 (section: .init.text) -> ubiblock_exit
(section: .exit.text)

and yes, this may be harmless on x86 (and several other
architectures), because the exit.text is dropped at runtime because
dropping it at link time will cause problems for altinstructions.

BUT.

The warning is very real, because on *other* architectures, the
EXIT_TEXT sections may never be linked in at all, because something
that is built-in never gets unloaded, so it never has a module exit.

So __exit literally exists so that the code can be thrown away when not used.

And now you're calling it from a non-exit place.

End result: the warning exists for a reason, and it looks like commit
72f3d3daddd7 ("mtd: ubi: Restore missing cleanup on ubi_init() failure
path") is just broken.

I could try to fix this up in the merge, but honestly, the fact that
apparently nobody bothered to even look at the new warning means that
I just consider this whole pull completely buggered.

I refuse to pull garbage that our build system very clearly warns about.

                Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
