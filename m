Return-Path: <SRS0=Slyc=WO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E565C3A589
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 21:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A002184E
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 21:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vr3m4flm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iM4b2rYQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A002184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r6Ela2nG5PDDiTvJb331pwOuFhZlfjPmpava+Poohg=; b=Vr3m4flmISwwAo
	N4Wx8GN3/uhaPEQM74w3qpF/sUSwnlJ0+XhHbhtQ7NgK4A4UPxjcFPeiD7YynoqDCSvxOgEzLJ/h1
	SRzUZPNTdZjVx8SDGfkFRBbf5TgUJKiKipsuuXDIj07uRCV6Ny0sKB/CRR6xKLj19bJvcQTu1Bncs
	kMWZz9XnklUZMfXf1nj/7k39tVgcuuoiPYCC6jlG2Wrx9IaO1FA5iUYJzzd0qeQ8PXi3728L148ZH
	kepbXecOrTo8vfYwzWE6hePunvRldEFAeMHrFu69hbYcwAs1HHr6hs+UhvncS5zEE361VQYFnKrz5
	OHOHa3PNzDNlgyVus4zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzSLf-0001Dh-78; Sun, 18 Aug 2019 21:04:23 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzSLa-0001DM-B9
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2019 21:04:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id s18so6619775wrn.1
 for <linux-mtd@lists.infradead.org>; Sun, 18 Aug 2019 14:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4sGLAXyj1KO2o1omGMj8ZNA1NRqpSs6V1v+/voWhjg=;
 b=iM4b2rYQFHPw7FI3Vdlj49xTKH8PC27QPUD0P2eP8VhlZojh96BS7/NOmkS1A22GUR
 kCnKdG72NmJ7AnhBPtyvQ4EEHjybfzXPYz76QmIqKQTEBzUYx5TiBkDh5wFtTJRTKDTh
 nlEH4VNtGPc4hxOXZDOUH8G9qZ+mYTK8IYYyLgoy1/zPM7sRe8xw84I6g2vjmRpPAJcc
 1HpVfO0Vg27KodynmbrqUZhlwsK/itGHoc93Y47Ed1+UmCXFofePU5JQyB+3L9COlB7B
 EI8pTXAzXfCEg8nt/M+K8beQp5njupn5gRXG9/x741cVRzUte41Ruzm9BZtF+NFGhtye
 5IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4sGLAXyj1KO2o1omGMj8ZNA1NRqpSs6V1v+/voWhjg=;
 b=V+ZB7cGn8bD8y+zhko7BV+Nx3naPlfwvjrfnXM77ErN5xBRxYStt0QReCAwrkldWIj
 /eT2n0lpDJF3yPvK4ZAW/EKbNzK21F+IVJA4mY6j0uxR23MqAAEk4WTudjA7RWz3aHEK
 yL1G26d/tm+0ubAiYx0NWWEeQmV+ps7n4DyzRmmsKjm3io7uDV5HPN7R0GdaWz4BcuEc
 bH7ZbrBxQXSiaikrt4/o8gn1eQ3Dbo42XsaFPSR6LAAoplNtSXW/tu7vW2+yehWUpwYi
 Z7xd4My8hZTa41lm1sk/vrw5yEof98Yy1dYWIQkqt7QQZVqSHsc8lEQ4tzKFPmqECwX1
 ychw==
X-Gm-Message-State: APjAAAVHSjfeBUzn+BmuZvSUx2YxwO4uYxyc3ljw4h1+DuDriwCoUMta
 eRBCpCvZ1YOIUBlHBHlGjDHixGfyZzjj52nFsY8=
X-Google-Smtp-Source: APXvYqzhxLEW+MItDfdyl4WATneisEf4s0R07O2AlWBvCxvYpkDigxYwBchorobvNFOJ0XQyQF99uJAhXaNbXokU7U8=
X-Received: by 2002:a5d:6a12:: with SMTP id m18mr23233399wru.306.1566162239942; 
 Sun, 18 Aug 2019 14:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
 <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
 <CAF_dkJCg+N+cOM2jCNyJP=+axw5tbM5F-EuPZfBYTZwywODo5Q@mail.gmail.com>
In-Reply-To: <CAF_dkJCg+N+cOM2jCNyJP=+axw5tbM5F-EuPZfBYTZwywODo5Q@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 18 Aug 2019 23:03:48 +0200
Message-ID: <CAFLxGvzBZ=xuSOf6mcp98GdzVme9WHfavu61U-L4JGD=9Ks26Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Patrick Doyle <wpdster@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_140418_411512_580B3DF7 
X-CRM114-Status: UNSURE (   8.08  )
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
 Emil Lenngren <emil.lenngren@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 8:07 PM Patrick Doyle <wpdster@gmail.com> wrote:
> I never saw //richard's response.  I added it so I could use
> root=/dev/ubiblock0_rootfs in my command line.  When I update my
> software, I write the new rootfs to a volume named "rootfs_new", and
> use UBI's fabulous atomic rename facility to swap "rootfs" and
> "rootfs_new", reboot, and I have my new rootfs.

Did your spam filter eat my mail? :-(
Your use case can also be addressed with udev rules.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
