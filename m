Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053EF606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 03:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iRS5XyzC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNKonRyk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4aeJR5JkPTfvAGmytDWPAo+ehrgKLs1xliAl0BdViqY=; b=iRS5XyzCLQiSY9yRDeqppi4ouO
	cf/lWVdAanYc6XBIPkvxlRacvco8I5vZkKr+4q0D/h+7dDOeGxIEszf5i0xuBqGqMgHX3fa1AyCVw
	j0k3SgcLxnUYbOv3022/L6El+KMHoConK7fyNX+laAa/jlQHoXcOywTV9ZSaJHAgwtY4CjKTHoMnm
	lak8jwL4EuUlU37ZiIZQCb1rKGAoQiSm73okzDdE63OB2wC8Mg5eP/wAyRWNsfoimGo+nzylPlMpE
	B1GUOnB1bDg4VyV7Q9pvEzGbanP2ZbNmjcLMWplRZuNIDsSVZgkvU4uRR2cxzKKwotg+YxxUNr7ON
	QnIg4ZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGxs-00000008Fi0-28lN;
	Thu, 29 Oct 2026 03:38:08 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGxn-00000008Fhf-2RKg
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 03:38:05 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3550c917fd3so2419081eec.0
        for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 20:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245082; x=1793849882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xO9Nyz7qNv6/W8x13yiKzl4aUpp1maF5hp5hkOon6bI=;
        b=fNKonRykVhFSwvCEEAIaJGBex30y/efpTIjaKqUeuS+4K+sm72kbCVD76RDA0VcjWm
         E/cXMa/Za/SegwvzPvaAKhVLGu/tdr0zyp2A9eRA7OuJtyMavgHREUIqQjpAQSaGT5oH
         T3S2K27Lbf59QXqpcKxCb6kNymTgw2oJ5u1oIzuG8+Xv2wfPjkl1MpYgrMx0wZ4mKglQ
         GOhkroSV1Zz4KEu9Oe+/5faQnMyEERkgRYgtX0UzFb766aveI1JhPu/SnydnkymLE9k6
         kW1gy0vkx6+LDeyjnGYHFR6yFSJ+v9h4it63OgAvb9kvi6eWhgLmpsAszLmLe4aFwGdq
         fhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245082; x=1793849882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xO9Nyz7qNv6/W8x13yiKzl4aUpp1maF5hp5hkOon6bI=;
        b=0T5pFbp/Wowjn2lTGll98UfDahCJAo1KSKu1kBV4lk9FjJWxwuktjIat7pBNZal26a
         P2MBdD3XyIFIoRhjl17qUf2gDVlMrSxwZoQzRaCr5dXby9H3dSQQ4QjiIlVtkJpItYsR
         Y0BVX4K4twfPrSvq0evGVaXYgRsu2+pMYZpqX1O8iPcAJFaCusac/7ZDlnX+XC/af2eN
         QlAbPuTehCmR6iZMojlC4CXL9O1Xb7HFc1I2GJrgEbvnthlte/dXPVIfMcxMNQo8KEAE
         aIPQ2J+UMtwinVkenlDB8zRRUa8PvMuNAgZyNrKGyniyXSq6HbN6nR+sKk5IRhYvYMUw
         igtQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2Jn6+3uT9bLi9cxFLsB0WRPVkLgQnSJP8xqz1MA0vZQ5sbey+xvUqPPhMrqATspYAdzPjtiFulWM=@lists.infradead.org
X-Gm-Message-State: AFq9FYIOIKJsESAo4z5RiCxItr0EhbRQlIAyoR/OlZ6nF6ikPVHidCSl
	D+8GohcEwv2PBHrOIVde15vSQlets9j5TKldMQTp8QwRa6AJah1GvDuQ
X-Gm-Gg: AYBFou0TErYlmxq00ozk58lyM12f3a/RoPImnr23aRpPsAsUTPO/z2Gko2XoCokH7CQ
	ECr3jKlYgWI3IPgNLwSBnnvNUpIChw/DUnlt0sZASJjY7TzbC8+Y/dVin597bWL4ZEBrE/HeTeR
	gCQ2m7B4+3XcKy/xDxjdFw17hxrIFWv7H6dra0Oe6anuGv4rxHnjpSUtWU86R3OA/JSRlEnJL0A
	xlpdMNvRPmZ4TRq83HNrq5eTrOGeIltZGj6vHHnQnLS+IId62PoZKZERgjskax9bAoBz8SwZmiI
	tf04kW8e/JzA4EQ6fogISx1rR7wZn2vvAjf+yUhR3LiNrlA9pYXPJ6woZdcdnHcPLop7ZYbmbIB
	yRVlWgcXa/TZdZVXL7/ZRaZQPkkB0dkjMXIUNVR+/1VRMz4+turFuVAj++9CP0m0sWgy+GqVEP8
	f59MpRpERqPFvwt/W+eKwdAY7aQ+As8qtE9w73igToHWIEKgbe6CSInXtBdw1O690mOt7LWq1N7
	YZwIqpQcaydziZKg0JF8eg7JjdNhKuJriq1ZPb+PuGE1p5FJAsnS/KL0nX6y/jCQjUEG8256/3w
	fX/etiJGW4qAzxPekEnUzNtO3IQ121wwL+l61JDIr2ZNYg==
X-Received: by 2002:a05:701b:4288:10b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1a6ce9bba59mr5791183c88.21.1793245081698;
        Wed, 28 Oct 2026 20:38:01 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e0098basm10196922c88.12.2026.10.28.20.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:38:01 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: wdhh6@aliyun.com
Cc: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com,
	dwmw2@infradead.org,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	syzkaller-bugs@googlegroups.com,
	brauner@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] jffs2: don't start the GC thread on a read-only superblock
Date: Thu, 29 Oct 2026 11:37:56 +0800
Message-ID: <20261029033756.3959915-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028080955.290774-1-wdhh6@aliyun.com>
References: <20261028080955.290774-1-wdhh6@aliyun.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_203803_644080_D76AB32D 
X-CRM114-Status: UNSURE (   8.43  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaohai,

On Wed, Oct 28, 2026 at 04:09:55PM +0800, Chaohai Chen wrote:
> fspick() builds its fs_context with sb_flags=0 and sb_flags_mask=0,
> which means "leave every superblock flag alone"; JFFS2 misreads that
> as "the filesystem is becoming read-write" and starts jffs2_gcd_mtdX
> although the superblock stays read-only, and reconfigure_super()
> then leaves sb->s_flags untouched.

This is fixed for all filesystems by fa6c71988168 ("super: keep the
read-only state if a reconfiguration doesn't change it") in
vfs-7.5.super, tagged for stable.  With it, the steps from the syzbot
log (read-only mount, fspick(), FSCONFIG_CMD_RECONFIGURE, umount) no
longer start the GC thread; on mainline they hit the use-after-free.

Thanks,
Zhan Xusheng

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
