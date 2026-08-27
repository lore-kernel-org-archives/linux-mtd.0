Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75498C61DB9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=m/nunGji6Tfc6osqcu6Lha4sFwjzE7GSYrV1akVe5Qo=; b=PqC
	Jv0iKzwWGFqJRszf6A/qyZTUAlTZJwoh85sHMAoMw2rpWdgXeJwU5yV6NAlqo3/NwNQNRS9M0ZWkE
	aICS4hPoZYR7fw7eKxphCt1har6Ch+K3ybF8whrZOwWijbCjj/GjIzKGQqap+qBY98wxIABnoQpIW
	0x+tfftk2mnR4O0uwl+bMPxYsJuJQwn7MucQ8Uel3y52xGR4nzdddrKKfjv4fcBAXy22aQSWIVzeo
	+L5aDK8C//QOzpvRid8zeQUUG/OVqBiXetRXYdK9gdZuICFJAmUzNotXlQAsTSFZcDw3Vg+mpf/JH
	JpL0lE1PXn94g9X3LKe1CcJgY1hR3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzimM-00000004sDl-0sLh;
	Thu, 27 Aug 2026 22:41:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzimF-00000004sCe-1wwN
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 22:40:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d71e253c90so3701325ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Aug 2026 15:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870454; cv=none;
        d=google.com; s=arc-20260327;
        b=rQOrCGPlOhYFd4xib6wZtIzhP5hkyp3/98ayQ697eDowGE7qHb+UDt2T7dTG8vO8Uh
         1Qap1sf+n33r8tQJhXKnvKTz295D0bABk5WasaVTcG4DGTzRDeqRD50V97tKku/HiEkh
         qwazsOY/gLP+zwLMutkbnrlHa3WSdLxHLQEzr9utZyQEuFlFfr7COONBjTxRC92Ue2yh
         jwYXdc4vNoWTyJ4+ZiKznBwzrohFniPMVUt/4nXMeB+5fG8e/DUIdCa4QsZ7mhFbUk74
         bB0DWlVm1ir6cJvWnzy4rwJiluUm0CUN7KURXCL4EQFqRJnUhqZvvP47ebX/frDzjxHh
         9lTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=CIDB50lueAj+PFqBN214GYxWeBOWs/vjCjjQsf4ZfY4=;
        fh=G6uWNGOas+LeopmXRqnvA/+KDPy2ZGXY1narKvkPz3c=;
        b=XJJgI4QHKI+JD/rAxxFKf0CEKkuzWdN0MFVZp6Dw5ExQbpiE7D6EYCd+l4Ca6JnP0b
         U2CByaQQtI8zsfV2pWCbAKzP4evxcban0z6u6Cgfbud2alkb9BeXYhNQzP22vf8Na7eN
         AHiO7KJmKw4IhnxovESn1F9qzT6kT2evRrYeZZNtHYPqLEN8QRfsFGzfvbiUovQ88v93
         CCfG2sBkcpkKR05M88TpBa+qeyHtqSuTGTVCdV5QmW1eJBQmEaugWBOf4K60HKM9BWqI
         SGHchGvz5rjaoeP4FwMO3mz6hXNqrKUW36a8DOxNsFtU8EJWwmWDxHqK2tIp9tY0hrWb
         DuTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870454; x=1788475254; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIDB50lueAj+PFqBN214GYxWeBOWs/vjCjjQsf4ZfY4=;
        b=JU0W26x9UumfBWVSSbGbAtlBNTrMT+t2PPv1kzXW2IhXljQRia3wjPiBX4008cMMjd
         eO8wVmzhDCLlMvGQKrBI0r7hAPZkDKHWrL7evRAiHp8PO0hX3Xn+6CvRAc1920zlSJoG
         vuuRz0VO2eAsAwrU8OEoeBCQzWdW92wUFXjoK0rh4Wx06BhMRA469h0byarDCE9kNJfh
         7jx0Ypbf6e3+XAJShR+R873uMekCx4Rsq6VyfFcEF2tkW/9TzEUXqGz8k97M82kzRVtp
         qcVwcA8M4uPNh5kJHAbZFlT0CqjZUxFhwF9gGrsebJV7ES/bbtz7VwQrI4WnR/DLqoTt
         sRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870454; x=1788475254;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CIDB50lueAj+PFqBN214GYxWeBOWs/vjCjjQsf4ZfY4=;
        b=c4I/C6FRlIfdTQwO1y0KmnEwf0AGQAoxdvbQNpitqgPLTLdj8iwf86px0/olfrnOhh
         Ndm3CbdbXqH1IgFddoi+8OLPPcjMmaQTCDP9VhpJkR37yDX/16KrUZ1lFOOKz0sp78Kr
         idqUaYsy1d0Zno8sB+++hKSctaYwg76LOYCBzZUoq3w5h3Rnd58IHbNYAXWci7qBPmuJ
         WFrMcvh1KZQtgOd6DUf4qX+YMqZBSH0dCbACPb8V3SgX1ntbzLKJHOLb4tYyU8+jHwlG
         v+6Um0fbwqNObwpk/tWaS2k7qs/v1ChocfbKA1xRBVWBqSO0bY4mkMTYDxBOoRZwsFEF
         ag6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp7dUm+73nSMOs0Z/Mp29WElDWWxPM2tGboeul4y2J8abd6XkZhqtLBa4D2MnikiTXzc3WlGU2oddI=@lists.infradead.org
X-Gm-Message-State: AFuF++mltyptK1GJIQXgjLDm+gm06DzcApgsYvzGTOPLUKTI2jMFeVRp
	tvRf3I/ISqAU9qNtEujF1I7bj799/C5621llhDIuliBA5SQoVxdZCO2CCL7cXzr8ZbKWotXvngy
	Wbo7vUVzOPmw5F4h+KrVGP0GHvACka4/I3OeuY9mG
X-Gm-Gg: AR+sD10qJzz7ObxYtuDzereeHFqJxgywtQfCFcSzH3mvEZO6NGkf+SWIzEE2eO0mPrB
	GB5yD06H/Sa8vKJHaaEJ/iNAsp/Im3OkGvcC76xdab/p0SB/ayXt3J/fbvFgK/nY4WSIEhRqB8Z
	o/QiBP4KkiJAc/Jio2gYehwN8Jr2A8CijacWfu0SAqvgho65Hozvk4PEAXDKIliS3+ZIqDOq+5H
	b0tZLdCC8bx1RkFrNeVn8vWawvwUk6FT0oNS4L5catuWuN+42NHuUQQQyvDpzNt49nVkgZ8+8m/
	zSYa1crvh5FQnzaOIb93OGWN+2snK4J4i0CNh7N9nETkmtALwhDP7H07T0lFkuu/2W8dpvoxPsH
	HdilOq8GJEq/+lvBBnLVzZ2ons5bvktMh
X-Received: by 2002:a17:903:32c4:b0:2ca:2079:91cc with SMTP id
 d9443c01a7336-2d74ddd6755mr30757195ad.5.1787870453225; Thu, 27 Aug 2026
 15:40:53 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:40:52 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:40:52 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:40:52 +0000
X-Gm-Features: AcwNN1WXhFsG_EgHVDcHVZ0DL16H_NxHubEG11xu328J6Gx5EpXW73V67Xs83UA
Message-ID: <CA+0ovCghX57DY5b2R0RcSQOzqwS7uz32KoSyMJ0P+mL0xmev6Q@mail.gmail.com>
Subject: [BUG] mtd: use-after-free in blktrans_notify_remove()
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: falemi@asu.edu, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_154055_509451_F63E8E07 
X-CRM114-Status: UNSURE (   3.65  )
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

Hello Miquel Raynal, Richard Weinberger,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/112-mtd-uaf-blktrans_notify_remove/

  ==================================================================
  BUG: KASAN: slab-use-after-free in blktrans_notify_remove+0x8a/0x160
drivers/mtd/mtd_blkdevs.c:451
  Read of size 8 at addr ffff888121a4a208 by task syz.0.894/19075
  CPU: 0 UID: 0 PID: 19075 Comm: syz.0.894 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Call Trace:
  <TASK>
  dump_stack_lvl+0x94/0xd0 lib/dump_stack.c:120
  print_address_description+0x55/0x1e0 mm/kasan/report.c:378

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
