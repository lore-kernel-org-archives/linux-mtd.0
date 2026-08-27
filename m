Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD8EC61DB9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 22:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5Ehy5C0SMbLJBi0oBt2eawABtSN5eT9NCpnp+8p+rZ0=; b=UEX
	tFY3Lh0xgFVeV1JFm2iDxEsHaod2ySxfQIDSeCN3CQD8ITDwYIZtpyHR1I+L09u4ZXlsA2pacjnO5
	s8K91USdCnKvDDd4oRvkQvU7/n9wywtnzufrCrfADfT8y1CJ0HaeYu2i6F3oUzlHl089tmyCpJnkl
	LrVTdOmj6FTttIcdT++BGY6Anw/8h7Z6fKz3MKtN9+EnqV+5Beg+gjgrC2UkPE0oS9oNedC9QDlS/
	EVGcDBFszWMlK+nVBCuFBxgHQgxOUOlGmWnjZrE8Ij6CMocjVv7II/YcMbqM1QObD7epY09lmYC/v
	8fefu4sJHA+2Y8d2Mg+cYDAsJ0kLAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzikw-00000004s2l-3aqH;
	Thu, 27 Aug 2026 22:39:34 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wziku-00000004s2D-0yjb
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 22:39:33 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc147d86bebso421572a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Aug 2026 15:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870371; cv=none;
        d=google.com; s=arc-20260327;
        b=OiN+IETl2cxg04GkOxf+uHHcWbNbv6aD8jkoKvWrdHlC1Sb6Pc0zXxzI9qnd3zHvOJ
         Tv+9oKhM4+UIPiZyolgGZoRym85JL2v7ccrcRNDkcEOrVwCgF8zNOoKEZzZwELJpyydM
         mYYpiKlgsEQYDOgMG3XCtMWm4o90cwiSmJep4ZR/4Lt758uo7zC4Zq2hAU4WtV0UzM6h
         W0kgEiec9Mhg20hCnc5W0p/5n2qoRWKGORP1uvhfr21ofD3Ilitp30xGjB0uMmN8dQjS
         zFiI2CRqjAE2puQrODU2mVwazli+zPobfhCfJpp5yHzoiT+EJp30OgK+CpD5r3AfYRdf
         uNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=aUgC6U0Ri042MH9ckfeZORUhqjWsZjHuRBdl9sus2/8=;
        fh=t8c8fgVjxGxdgFw0gEx/cjZ343ksDo5o7aWL1TBYsnI=;
        b=QjxcHgAYIN1un3vRgjep4QtiCriutJDZb4FqQTPOeTe08fZx+B7NRf+ER50V0Jh6Nr
         3yHV80wvSTPR+dHCa4ci/4tZ/3Uc8jQtlvDJkJ0Fy62s/sLMUZl3Cyq1Sl3qOhEmMrwi
         VZu84P1nKUn4u9zoYaqYFrREJdaK0sPI0SaCgmQ7z+aWvWhuqP4pCXX3htai1kDYGEno
         3wMYx4Ld5gfsjF5+VPL8YZwu2kTgU4oiAsNaQliu9kzhRz6FfEkuciUCMch39/e8FEeQ
         wUpTJLAWfTIOCsNYmV+Fzymm73o3kwxj1jPT7MP3cGOHbx5laaNTicCt1UnQmEdSP4XL
         yscw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870371; x=1788475171; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUgC6U0Ri042MH9ckfeZORUhqjWsZjHuRBdl9sus2/8=;
        b=QLByJ1itmqE2FG6GMTcLGDeAURN/k7sz6UIbhj5QMuZuJB0SwiuHnVIchKGm11h5jA
         OtFEZ8yt9sb4nwN+0/18dR3clSeKjgd9GtEEUC6iTpGvDQclc2Vp6WDYN49W3+l9roin
         s1Hskw3TRvONZY4+QbRDnev+MY3Jm6joSD1rmpFMV1qwtXVgVdVv4pyWM3z/VFfYbBI6
         ROcwnL7DGq5ipqXV7C+05Pibk8NG+PYEVxSvdwY0VW+l6FfNfEwWAkJEszzGKtyuYDiF
         aluDGGXbdqYK8FosLJPdIIc1om78o2Xmjdx1ayBtpPVRRR4JQNVckodMqPrUDLIknrYk
         641A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870371; x=1788475171;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aUgC6U0Ri042MH9ckfeZORUhqjWsZjHuRBdl9sus2/8=;
        b=GkAVwTJd0jeOfO1mzmlQ2QVJDwEt0LeaO+n+7HRXT9C/ysmLJzUvX2Cop53LgWdF3A
         Xvi5hhaYv+H2P92Y5JdGznGIrn44/JdXcQ5rv60bcQ3hkheOTBONTacJAK8O22pgFK7T
         LYhNVNF5bBdkJB3TtnZVuyQ3Z4JgmhRmZrL+TpzBjR1s36ZXoYAGxFM06smsF3tthkEq
         +7ZvA6Gr+f2Cfco/4gB7JTDH5pLxwE9NiqPlulHwnwpbr1tWFHZLUxluZEERDqLH+jAc
         804o2s1a5givQFLtjyq/t8iCt0PpvVQgT7ZCqVscjcEs8ZeDPG7l5Gy2kOgOXzWy9znQ
         WWVg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7s9ReJf/+S9smbcn52MDxf88FMi2chO4twF14G4HGqdoDf8DL42nrLaPnvXZ84mFu/DHF5p2am1k=@lists.infradead.org
X-Gm-Message-State: AFuF++mnCxOnBZUtsi9/EeS4ajUXFP9QV2PEbG+fo+j1oZ9oZ36wM5EV
	yLYqbOp56nRpD6A6ka7V95quAQgDvXlly9ao4U/E9YHdSE97e07DvRrJPDH7EQoEFt3UzAMjhd1
	Fm+DtGDnXzx3wqYIxKxYUm8P7X56mmAXj3UEu81eJ
X-Gm-Gg: AR+sD109xXOg4q55xoTLbXkutLNk9+stputTijfFdnRsM5BrgzRdk4uJVFMVjT3AgnW
	FyHrBNpeOarn5rdgd1ueygcAGdK4UOhu+badv7Ff9g139niwyKM6ceX91AUlDdLz2N0gdA6iSng
	2CECv4UeFe8xLKrFj68Hgs3uX0mm55E6wrRRjTSeRYLuJh8Fc6pxwPColAvZBAgaJSF1ubpg7zb
	7rJ6FDxCHDs8GOGC66oJQY6A6w4GoXa96/jUcHdUiiw4jVw57psQT21DO0BCYt80lm2Ggy6gk+y
	u9tZb1tI6yF4R2wlJD7k0R+T2QpjBO98qP04WYv6HpnCerruxxLHHXnC8/cIRvR3jSc3J9eMfNr
	yj26Z8WfMbV9r721yrFDWCBmJV5zpECQ8dQ==
X-Received: by 2002:a17:90b:4d11:b0:38e:7297:a92e with SMTP id
 98e67ed59e1d1-396d0f6486amr2117646a91.9.1787870370120; Thu, 27 Aug 2026
 15:39:30 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:39:29 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:39:29 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 15:39:29 -0700
X-Gm-Features: AcwNN1WPmhEDwxbrpltfK-UsN5SmqLvSNmNta_ia13t7ApSIc0SOkNKwBfo9p1I
Message-ID: <CA+0ovCh-bPqXn8L5AY8=c4B2L0n3ixXKHFExwGtMOouBYGuXDQ@mail.gmail.com>
Subject: [BUG] jffs2: BUG_ON in jffs2_get_parent() on a crafted image
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, linux-mtd@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_153932_279094_4745D7EA 
X-CRM114-Status: UNSURE (   6.58  )
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

Hello David Woodhouse, Richard Weinberger,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/110-jffs2-bug_on-jffs2_get_parent/

  jffs2: notice: (20910) jffs2_build_xattr_subsystem: complete
building xattr subsystem, 2 of xdatum (0 unchecked, 2 orphan) and 2 of
xref (0 dead, 2 orphan) found.
  jffs2: notice: (20910) jffs2_build_xattr_subsystem: complete
building xattr subsystem, 2 of xdatum (0 unchecked, 2 orphan) and 2 of
xref (0 dead, 2 orphan) found.
  ------------[ cut here ]------------
  kernel BUG at fs/jffs2/super.c:141!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 0 UID: 0 PID: 20910 Comm: syz.6.1218 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  RIP: 0010:jffs2_get_parent+0x1bd/0x1c0 fs/jffs2/super.c:141
  Code: ff ff 44 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c 46 ff ff ff 4c 89
ff 89 f5 e8 40 e7 01 ff 89 ee e9 35 ff ff ff e8 64 7d 9a fe 90 <0f> 0b
90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
