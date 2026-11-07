Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B545606D80F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nAY7hCe7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bRzhi2PY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=koy77JZIT3HyAcR5zjIA8OswUGZj/MlUbs0QAPOAswQ=; b=nAY7hCe78OWL968FYR4nFED6x3
	zBz3Vl2JQiHXOt/lFnkdpDYfkshRT8gUt/7Pe9RaU0VKvVRdlMgtiiYbMImiZzy8BEkvKgWvWiW6N
	/j28kTP1qYfNe4pGDHI5YsbFj+mopEL3ekOqy7V8mIW4XD2dZsNEDfcfHVfauDReBy0Ghurszodbn
	b6AYiAUxCoBxWpn+ruAMoJUxESoH7gB7wpJTtwqOcZlXxwf2wdszVr34+aK2YBdL0sHI5BjGq2MBA
	jWFXiLHMCPVLPUshbvXrFQEVijDJe17zx4jZXoDG0ivkG3YuZhOXsgSEsbi1Xz5AzxfWWRzXqX9Gv
	p/6uL69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYrA-0000000EDu7-3gxX;
	Sat, 07 Nov 2026 05:20:48 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYr5-0000000EDsm-23kJ
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 05:20:47 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4f55a53898cso683649b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 21:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028842; x=1794633642; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v9Tdiy9REOY1qeQxFjltXsTnBPcqZlFKUcohy8cjEnM=;
        b=bRzhi2PYfyzVGuISWQbF7XvzCz5BJ+wUcSH1W2Kh45Z/VGhiaaiDbHMeorz7x51O+N
         xNGu+7aaIKXTn/6A/pz6+zmCmET8t0J7JDF1DEU09+lBp/Sdqpp9Rtdca4YmvQjrIVki
         nc7ZnvAMOH0XgtgN9xX5iepu9F8wgMLmtNeB825/EbrI5BPM11mn8NCRKCkhdC2qhG/R
         9P4/vXD23AMdpjY40C7NeXczlq/jfUf27a2LsPu6PFmsqO0k6s3NOdo1Cw2GkHCffllz
         nF98OVZ3M+hgT1wCNy2ty1SDj5QaNe0v0LiEp3qWqRfuMiMM0lhuWxTE5oVew1ZaXKDu
         6OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028842; x=1794633642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9Tdiy9REOY1qeQxFjltXsTnBPcqZlFKUcohy8cjEnM=;
        b=EZZ2GtJfG3hAmEoPh+bze1qttunLyWP8Kd03Pk++hZyVxPgcnswC+FdV/WXCrdxMGZ
         75VkvJS/NVkQ6JoY9eK/sG02yFG2fxOvpORmGCrohmYRfs1uAxMZ+DGcFk5nvajrG/rk
         JY1yES2utTwU9Ah4lyY4GZ132COIRK1x2PRa5nG2SY0ozOCQN5K0aLwI3blYVvC0JZAB
         GkX/vOuYWZmQ2CYVdSB7IDrYWuHXUNnA7LP/HlvQ2PxnN9yfqGtEj0BsVum+Z/PY6o0f
         MEhcbjy++6P/6j8Cl3cCvK8iOW9B1LCdmSaud71cPvLunwtypcSu57X6SDE8ofQ+tPc0
         Crfg==
X-Gm-Message-State: APuU4Z93sf4lxeIQlE7wY6LsNkrGASBiJ6SnjBeN9IBuCoqBRWVf3Xgo
	jkYWD+LgLlbZ1BsmYmuCGvnXNqTOm6PgKYnjZwpi8XgXkubCJEghtk0MjkP8ug==
X-Gm-Gg: AYBFou2n9H83mUHfn6o0iNsixp2TZVuj8XdcQgR6a9oygVl0HzMkAi3UDQYLT0XalIK
	MlUPAEWEce+b52vjUWTpslcHwDIwn+zS+9LAj+SCzAIRNFbuqD/9njIvDyC19pGd+Tx/Q+3T1m1
	HKtxWZ6r5tOLpR2G8KZdvv10Tpi8NcollQoJiwmcQ3RS3ZIn1xFzosLEyFAsRw9cMZIGlg539FZ
	wyY+dAK3M1umTOVMm2/cax6yMC0UBl+tupH+ebFaH3FlAcsG+QLxV1UTtTYaF28yxrbnKrcubTA
	MNc5S0d9+DmdxGfCw9VY7khE1wurAPip5HHCfvRqO4vrUMPjINrpTLTftpED/9O9sSStliYfTN2
	9sBMDzSi1wXGUHL84VOEGHu5TanW5cM5jwjaE1xTghUlcHQid9uwzQCA+/PGOa9cahDGXoJep9j
	uggIyT1z2MW99HzfAhX0vCuQxajv7WSeBZ79IYLTmy/4Zc8pxOmX7G7uZymgfdXRkb4EVFYtYTr
	ytiG3L1MNw5z5IHXcAuegjZ/xyWSXSEY3+MzV97RoiwYVMlhTXGjWrvO0m4OlBHri7GfqKxTaIb
	UBxJyW/u/+3yzyFU2Qk8ayOB2UYMuxiRNfnanrXVI0XyQlDFiNbHEz5bauuxRy8ZB4I0p2KTVHu
	y+VVn9FxLwPCxJsLdtzdw2T8oiu0Uv0Pydnvq7UZz1DD2qRjSM9qqhNo+qr79ev3ota8dVknOnp
	Yi4DExPUjlmj/27dy+8RcA0GFZ0fnbzT4IaTmm51cTaD83hKt8S7ns
X-Received: by 2002:a05:6808:10d3:b0:4f5:d873:aaaf with SMTP id 5614622812f47-567e1440dfbmr4090440b6e.14.1794028842361;
        Fri, 06 Nov 2026 21:20:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtdchar: keep data and OOB aligned across ioctl chunks
Date: Fri, 06 Nov 2026 22:20:38 -0700
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QrCMAxFf2Xk2WA7IYi/Ij60XVyjrI62G8LYv
 5u6hzyc5ObcDQpn4QK3boPMqxT5JAV76iBEl0ZGGZShNz1ZawjL4iepONVB7xlnp5EQl/SWNOJ
 qkehKF/LGcxhALXPmp3z/DffHwap4cahN2xLeFUafXQqxrdR8bnN87fsPjK4B3KMAAAA=
X-Change-ID: 20261106-submit-mtdchar-page-chunking-v1-668636b0becd
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_212045_710918_B541CB17 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MEMREAD and MEMWRITE split requests into bounded data and OOB buffers.
Their chunk lengths and flash-address updates must keep both streams
associated with the same pages.

An intermediate read can consume OOB from pages beyond its data chunk.
OOB-only requests do not advance the flash address between chunks, while
a buffer ending within a page's OOB can leave the next operation starting
at the wrong page. When the OOB buffer is the limiting factor, the data
chunk must stop at the same page boundary.

The OOB-limited case was found while testing a proposed BootROM-format
MTD view with 1024 data bytes and 1152 OOB bytes per page. A 64-page
request has 65536 data bytes and 73728 OOB bytes, but the original
65536-byte buffer limit lets the first operation consume all the data
while transferring only part of the OOB.

First simplify the page-capacity calculation, then bound OOB in
intermediate reads to their data pages. Finally keep non-final OOB chunks
page-aligned, limit their accompanying data and advance OOB-only requests
by the pages transferred.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (3):
      mtdchar: calculate OOB capacity from the starting column
      mtdchar: bound OOB reads to the data in intermediate chunks
      mtdchar: keep OOB chunks aligned with their data pages

 drivers/mtd/mtdchar.c | 65 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 11 deletions(-)
---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261106-submit-mtdchar-page-chunking-v1-668636b0becd

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
