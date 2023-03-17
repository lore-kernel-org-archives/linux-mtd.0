Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A3CC6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fjRQpZHzAlmAuW+EIEcF4fncPNnZa5XIvBVZh9c+bfI=; b=SPq7rqeABul0QF08O1Xc3Spszf
	/tYSuuLWOlYDfA61mEDLWGHkJQ4RLktrcuTYhPIxCTkYn9sQxCX+002IO28i9hiTVydKC4/piiAFC
	jpz6j9x8xSwSDlKHKD9p5KHrriXqeJw9gJlWb64dztipmeK7oDjvG+IfBvqCG+d8nYM2lvfFk/s59
	E19pC/vg9tDjQv/D8s1NL06XOYqN3lZtiVLzz66BSgB8vqc76yqZAFuERBwx/eVL1wSCWoupU2l3p
	+jac2W5KTGHB2GExo1oShs/OIiITuHVOsw4kdzHXY+7oB0UBBjFgDkpq7qXlRHNsoQ5GjZ1+MKBKP
	KwNgOtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd87b-0021fr-3C;
	Fri, 17 Mar 2023 11:19:43 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd87Z-0021fH-1w
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 11:19:42 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id by13so4183496vsb.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679051979;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cFGw0u2n8KUD7BLlUXmazMizht5nMVZl6kSY6hio1Q=;
        b=nxtxSikDDAG8XEtAosNM++fPa5RqD9NA4jqriO7+7M04XoME9Q8LiDk+9JC+w82cbY
         ZSnLEwsYWb41RRo788qjdcNs2WJPzMMxQkL+icN+E2BhWr5pSMhv9j434zDKTP6FpWWS
         82TZGEJUBq8nFjbYlOXd2BU1exsx7NSwsvY2pmmY81mQaciVeOtJ530qK3hnzNrXk2m2
         HRMWJd7aVXD3/vPIifjK5IEm+ZOM7BpqOZD4Cj2WE7Vh+jA7/9kEWvYFkSNwhlk/RTPv
         fe93EngbXK4DEFzXRmxu6hprKSaKohEcSd0xE9DJGZdwJSSwf9cXocxJWifT3SCd09Oq
         Pnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679051979;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cFGw0u2n8KUD7BLlUXmazMizht5nMVZl6kSY6hio1Q=;
        b=BEpIYHil+HTHETTpP1lPI9P3CdYAlpUwPg27EO9v8Aewi8N3ee/RuYGYa0Ev9DmoE0
         a+rVNFFVQZk+JlXPAu+d08K/kPibZczk3eIaxDYzT9Lz1PwAj6mPVaWL609dOneRsexy
         M5S+ShSQ8bCJxrydvKFVdxVo+VfojhFIejz5dQXowiM7M+5FFrU80GvxjtHK02OYHmkh
         ZZGDendlits3RA2Tl7w1mGTjV5iEqoTm2/H8NQugGLV7EegxxHuANwjM+nVtHlw3jQgw
         vCvgZ2Kf8Qnb4dU5yMxeUhmgppuk5IQYQHWTJ3njSlgb5C3cinjDKDrZ1VHiJhyJe0W8
         CwjQ==
X-Gm-Message-State: AO0yUKUrarVVp3yo2SWRhPEb4/mKid1/Xdd9X9r543VAndtX74XBVimK
	OovITR9GVNJWhXfagvjrGrRKA8B0RBRce7Z7+vQ=
X-Google-Smtp-Source: AK7set8QGmUVwCOtUEUCGDdAs69bISaDfQEqCIXK1AvR7kjBaoVZn+CQXQViIunUGG3FWkg/h39jV3w1ao9Y12xI+OE=
X-Received: by 2002:a67:d709:0:b0:425:de7e:3dce with SMTP id
 p9-20020a67d709000000b00425de7e3dcemr2664979vsj.6.1679051979549; Fri, 17 Mar
 2023 04:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgTWNMSaZmE4UzOq8UhsLWnBzyt0xwsO=dS9NpQxh-h_g@mail.gmail.com>
In-Reply-To: <CAOuPNLgTWNMSaZmE4UzOq8UhsLWnBzyt0xwsO=dS9NpQxh-h_g@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 17 Mar 2023 16:49:28 +0530
Message-ID: <CAOuPNLiu+40HREtXFL_yMaXiaRtnZSbW9VvZRZmEpNXvZWzaQw@mail.gmail.com>
Subject: Re: ubi0 error: ubi_open_volume: cannot open device 0, volume 6,
 error -16
To: open list <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_041941_634124_18D2B9DC 
X-CRM114-Status: GOOD (  15.07  )
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

Hi,

Sorry, for missing the subject last time.

On Wed, 15 Feb 2023 at 23:06, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi,
>
> We are seeing below "ubi errors" during booting.
> Although this does not cause any functionality break, I am wondering
> if there is any way to fix it ?
> We are using Kernel 4.14 with UBI and squashfs (ubiblock) as volumes,
> and with systemd.
>
> Anybody have experienced the similar logs with ubi/squashfs and
> figured out a way to avoid it ?
> It seems like these open volumes are called twice, thus error -16
> indicates (device or resource busy).
> Or, are these logs expected because of squashfs or ubiblock ?
> Or, do we need to add anything related to udev-rules ?
>
> {
> ....
> [  129.394789] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 6, error -16
> [  129.486498] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 7, error -16
> [  129.546582] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 8, error -16
> [  129.645014] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 9, error -16
> [  129.676456] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 6, error -16
> [  129.706655] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 10, error -16
> [  129.732740] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 7, error -16
> [  129.811111] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 8, error -16
> [  129.852308] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 9, error -16
> [  129.923429] ubi0 error: ubi_open_volume: cannot open device 0,
> volume 10, error -16
>
> }
>

I see that the errors are reported by systemd-udevd and other processes.
Is there a way to fix it by some means ?
These logs actually consume lots of boot up time...

[   54.300726] ubi0 error: ubi_open_volume: comm: systemd-udevd, pid:
1460, cannot open device 0, volume 4, error -16
[   54.507095] ubi0 error: ubi_open_volume: comm: systemd-udevd, pid:
1469, cannot open device 0, volume 5, error -16
[   54.509816] ubi0 error: ubi_open_volume: comm: systemd-udevd, pid:
1465, cannot open device 0, volume 6, error -16
[   54.650627] ubi0 error: ubi_open_volume: comm: systemd-udevd, pid:
1469, cannot open device 0, volume 7, error -16
[   54.680203] ubi0 error: ubi_open_volume: comm: systemd-udevd, pid:
1445, cannot open device 0, volume 8, error -16
[   56.311902] ubi0 error: ubi_open_volume: comm: mtd_probe, pid:
2042, cannot open device 0, volume 4, error -16
[   56.795532] ubi0 error: ubi_open_volume: comm: mtd_probe, pid:
2043, cannot open device 0, volume 5, error -16
[   57.087962] ubi0 error: ubi_open_volume: comm: mtd_probe, pid:
2044, cannot open device 0, volume 6, error -16
[   57.130853] ubi0 error: ubi_open_volume: comm: mtd_probe, pid:
2047, cannot open device 0, volume 8, error -16
[   57.345761] ubi0 error: ubi_open_volume: comm: mtd_probe, pid:
2046, cannot open device 0, volume 7, error -16


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
