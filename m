Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BDDC43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmRXiLI5CM7VJYOgWIk4qhPda++CzVUwKIAEar2TcgU=; b=Oj5EDK+FaSgzzV
	72PEhkpZFQxKXGt6htg0ZTm+2HCn2sV8y1p0io1XiHg/dqcs0KZrY351ngULDsp5gfrCPWjFgI5+9
	33qWshXl0b6Q2NVFx+oJICLU19lggyCFExFOAUn3dMI9VaHqvEvciIAZ+XXk4cAgypqgtCyYQGJIw
	WwoI3b7i6doDdBDov2SplRKBfro2zanGBDBZvyUK2tscTDiXw8dVJIqzdJ9HZ7EEnEC/ukIKKd22k
	S1J4qKGL2/+ICyyeH4FZTj9Dtr52MH9adBUNXFwVoZZ7UE3DginO/U/N26bUVmAbXqJerhexoYnYd
	SxaKSr2M98Yv5Mqmgzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO7-00000008BzD-3WgK;
	Sat, 04 Jul 2026 05:58:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO4-00000008Btg-0XTl
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so1196447a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144679; x=1783749479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G71WVzAdPJBBE0mgQ/IIQpuK0upICMjfyPciQ2pRo20=;
        b=TwJCQullb8qdaS5xyDs4INuH7hfsdcRmmPtCIT0StxsBoQChIYI0ufNNjigOFl6g2L
         fDsvx1MRjnPaLxfxCuMvklRz1DT5Dj+SRkKvmFWdre0YKHrRAlMEwgaYld/Ps8dvkX4S
         DLG2aw8EYNPuDdEQ6FcPGF5swvNRobMlmlzqae9vxT6vLoDArsYEbn4hoQH9qyCUfPjF
         lE5ukFSJNfD5biirrHHTFHKf8NQHnX3Yy0zVCvShfF+B7s4kF10rhFb3hkMs/4O5GYIx
         SzOHFumDFWryLHJXqPGPGDES5K2/10HFffKYRdSmqEjIrzlcJ9KERTCOYTvneQYGbpEE
         WADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144679; x=1783749479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G71WVzAdPJBBE0mgQ/IIQpuK0upICMjfyPciQ2pRo20=;
        b=riDtJDs7W3ZoRPvvXZwlyXxIh821uCVxIcrDBS4efCLn8a1jsmhoC60j06rMAdzqa3
         is45ss66Lju7a1VD+lPyOQjBMZdPnFF/ePP5roiIZWjhcTtsPZwBYw/Y0ZI4JN9Qxqg/
         vKmx9QWL71VhXPZT5ha1FZ3F+as51gJoO/MI6rW26rT2VnJFWbICK5rMXV3/uV7z7oCm
         AbtKxzjyXvj61PQk1QFmFbs8gCwy8ZBli1uC7Z7tIU1xk0Rt3jdESwOZQOFg4ZR/5AYQ
         ehJhrcvqdlwIKiMnForblcwS60P6gpDculdzYf/WCviBWyZV+BdHEAZqL3JQW6EJPMg2
         2G4g==
X-Forwarded-Encrypted: i=1; AHgh+Rru4I5bBdFWWPXiGvgFD16AA/mTG8IDcD1G/ulY+/hlEWkwQmJ9dULde96IQYjT4SV9Au0XuZZN9+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIT7PcMq16FOZ8a1+1uKw4UKCM/OFcqtvHqaUFPnuReTOnrdI3
	73q+5JgOaD/AncbryX/OJkDoneAx14eHoMmARp76g3R7z8xZFYT2GEMh
X-Gm-Gg: AfdE7cku4LxFpOuDt8d2yiS1RdzGg5svmMHVtBwUXmjpw+pDJ+Y6giXC3FIGVJbeWZc
	UhsOkLlIoIQz5knEgTgXcVzzMIBC6LOSgPPz3qXy8esISwS5vv1RQ59q5ag7/712yvmgIiURTzP
	kdiec9V49+wUWwPZWluksH5OSHCDhLeYeVhQWPSQvjpI2/k7gB9lmkOE47QpTCeBzFeEB2U9+4G
	/8tZAxiyGF/c0ObWtcbVwWGsJSFvlwHeKBMgw7jrcqJT6837VCbPQcy2B9Z9zb0immyViNYudGq
	Chirag4LKnBzDIuAZttwKf3mDnz8PnByI51Ldmc0NEoQ08J/fQuMo+HcLevvbFnN9nWBvtyikc6
	X8h8xiDPnghk4vmrLggvWHFdN8ZzU1eE8RN8hDhm2aKS+NzMVsPp8OQ4LrqA7CMFBs3fbmgfuXk
	/5Uk/2ZolQJR7cXQQmJSQuW3ss2XJ+WBvV6/ME5DDziwa++H1En52bsktBM8sVKDCnzcVEj/EW8
	QA=
X-Received: by 2002:a17:90b:1810:b0:37f:9ce1:cdaf with SMTP id 98e67ed59e1d1-3829f9deb8fmr2518876a91.29.1783144679425;
        Fri, 03 Jul 2026 22:57:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:39 -0700
Subject: [PATCH 16/26] sh: maple: remove unused driver field from struct
 maple_device
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-16-41e424964da5@gmail.com>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
In-Reply-To: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, 
 Adrian McMenamin <adrianmcmenamin@gmail.com>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_225800_206993_CFAF1C9B 
X-CRM114-Status: GOOD (  10.23  )
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

The driver field in struct maple_device was not really used since
commit 1795cf48b322 ("sh/maple: clean maple bus code") which removed
the reading of this field.

Now that all the writers are gone as well, remove the field from struct
maple_device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/maple.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/maple.h b/include/linux/maple.h
index 22f2930251ed..90c26c86e3ed 100644
--- a/include/linux/maple.h
+++ b/include/linux/maple.h
@@ -64,7 +64,6 @@ struct maple_devinfo {
 };
 
 struct maple_device {
-	struct maple_driver *driver;
 	struct mapleq *mq;
 	void (*callback) (struct mapleq * mq);
 	void (*fileerr_handler)(struct maple_device *mdev, void *recvbuf);

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
