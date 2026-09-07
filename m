Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0554C79F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 03:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM/kOJBLjlg1/EwdWv2qOHRxrKAMBSpa09ZbJUVO/Kw=; b=coM+81iXkmbOSs
	motB+eplWRSuU4lgbSqGcvJ2MoqtDPJ5SKPQueCBFn/OIhbTzbFTDOWm75bQ73QrJrzS8cZnEeisp
	OMYLtfp3SawpXNxkn7YQXMQDMEepLFuEwKVA54fjo70/FXEfE7OjvWs9pov32sgBS/GKJb0+tTMBx
	gFYHIic4keNBY/KtlbO8EmMbGTH4QLCdD8sTYoSUV4u+Kmx/jRXGsqHYhmoL8g1gWVZVyYzaA/w5a
	ZBtumyWCdeCfnPJIDOx24+KBEPqWRYfp12+tLHz0JXy01FfJuf1J7n7w3G55UlQEE3y7zuwlYBiez
	jvlg7nyWysRxZOVw+6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Q3D-00000005lnn-1JRz;
	Mon, 07 Sep 2026 03:29:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Q3A-00000005ln6-3zcN
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 03:29:42 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d6f9e2f681so33674185ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 20:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788751779; x=1789356579; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tp0aJukw+a3PhmBQFaWxFKW7LFV2YBDjGrDn04/gkFg=;
        b=q8F582RTvgyIVNuC1r5CllFoDd28JyObJEDuamCW9QnZXhrX0xEQ4AHpShaiP96k9W
         5oH5B99pT5DYRRfuzB4n1liRBeoxD/E0aQXd9WNCN/UeG7QMudJ6irfG2nmHUCKYMbNu
         kU4516SsajduWsu1++RafPPWRwd65+a+k6DOaZ1uwU70Gh3Ckrrifiiq8n6tEpdh1kaD
         7831iKdkdaEMMAIINmUM/VUaiT6+QHo3qTgZ3pUon/SZoNxW9wYc29uSca1chnOr6upJ
         WVwVBxKj1I9T4YKVmvclcOH0HVKCVdonRrfQgtSpWRagZiYto3KNdl82HNZRjV8BKIdB
         vGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788751779; x=1789356579;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp0aJukw+a3PhmBQFaWxFKW7LFV2YBDjGrDn04/gkFg=;
        b=GxEoeGjXddBkf/ejGgH9VOobfeHpzhCRF1doTeyJzaslFp8yj2jGFnGUCPiuqEFw0h
         7F3m3SYtciFsPlhBuocVlw3C+CXkKu+sacoCgKjQ341Fo73cCBWTeRY9CToILZTCFKQi
         9GZSn4PcdloPJyxJ6b0S7+KL9PmrcdaCqRdA1RdV4I4NAzS69ioCu73SdiVafaON2Dnw
         RjOvfHjw9KP2MUwwK/tjRL0B2EWJ6byTJKnQ3EasqpZe9IjmgLF9ici2PnBB0MffI3a7
         g7NPNkW4TQqfxlH5lX4UghoKqIwXnLMF33sGAeSBYw4r+8v/+RdLLH23OLOgyYuXftTZ
         0WJQ==
X-Forwarded-Encrypted: i=1; AKwUvByJgOt9VB/4G3wYQ84dp+oHCuslQHt8P7U/VG/+0ndtValAI7qrhhR81vUSLr6GVTTQrN2D7/7BGoA=@lists.infradead.org
X-Gm-Message-State: AFuF++m9DvWBqf5eFiBzr5qdK3gqVt6RTRYm5yWMCoJt14QTPegGlnt6
	1qUbszuSAa+XFkBtI2jDcpa8n8V2jPOmY9k3hmsC7m0vayC9hdMGVBwo
X-Gm-Gg: AYBFou0D9YhD8veh+P+3kfLh2Gd4jndIL1nHMvqRJi4m08eDaW3/iIaFc9ehq+eG7mb
	fSBGQ3adRffM/wIHCZppn3BzPfsNvYxSvL6u1XClDOkLPz2cx1QDKGWojOxRcGEEHTssMjJgCbC
	YXJVkM1zqzojlO2OTN81D+ew1UD08sudnwRZg1k0eNaerf/goXsowucizhQkNK15dZKA7GXNHNS
	Z35cgPISWa18iRHCew94f1Stu9ms99Xe+cy0U/3BNp5D+lqpEN49DYr76Zc2voeAYt4Ff5rpXNL
	o9EXtALND52GRudVOJtJku8dLUHl+q53WvOknuaJkPkm2l6GSfVxKwJ430gUIqQGGI7z2+3ctNq
	ospIWRT9IXV9LGagjbvErtjlixBA4+9Lb9E+ZD/LeXtYk1RifMcj8GfOBY9uoode2JIfACnac6v
	Ican6DkrvJZ+SsHIlQS8RTC1NmUp6ej84xNisoqBrIWczEa3/3hEWjuwCIKUENS8qfeM8ifcb9B
	pkkzhfQ7yvBTEPNOBtVTaDyx8X2apfGTdXXqPea2+qZ7g==
X-Received: by 2002:a17:90a:d44b:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39b26203f11mr32745749a91.16.1788751778701;
        Sun, 06 Sep 2026 20:29:38 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm6717453eec.5.2026.09.06.20.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:29:38 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: powernv_flash: fix kernel-doc for powernv_flash_release
In-Reply-To: <20260907004821.225576-1-rosenp@gmail.com>
Date: Mon, 07 Sep 2026 08:58:19 +0530
Message-ID: <ik4h210s.ritesh.list@gmail.com>
References: <20260907004821.225576-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_202940_998122_1DA8B852 
X-CRM114-Status: UNSURE (   9.01  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rosen Penev <rosenp@gmail.com> writes:

> The function is powernv_flash_release, not op_release. Update the
> kernel-doc comment to match.
>
> Fixes W=1 warning:
>
> Warning: drivers/mtd/devices/powernv_flash.c:271 expecting prototype for op_release(). Prototype was for powernv_flash_release() instead
>
> Assisted-by: Opencode:BigPickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
