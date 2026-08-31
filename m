Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E6FC61DE2
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBdZcZ1HFcWCjXbvdPq5r1qsDdQJLAVmNl7rqpnOzS0=; b=Z1LzcjgwQtUVVm
	lapoXaa5ERxbrvMPrrdLqGCr3NejTiw9DeHGkthHAP2ADRvoIcm4ABAVDpQWbnv9YsmCH0PNzEYro
	gsqVEbLScGjwBFt631bEdb9TNMHTnC+GyXKTo2FL0HAYvMSo7Vh6Xj/Y/uEqhffUVbQwoNbt4yFS2
	Tu6PCRjtDuxhW8uthji6lwjh0bq4Nsz1rg0KBHy84HgQNRNWnLUNr9SlcOtCCOFXYQ/vvAQrz4w4I
	y60pF8BnTzZunFoqvd61BC5sG/9EquYlzx/hg5N/JC2uXy4WilovYHhC750hWfIasCDLU8dHETVEE
	ePr9BXpp9uEQC/PNLZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10My-00000009DtB-1pOM;
	Mon, 31 Aug 2026 11:40:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Mw-00000009Drv-00RA
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 11:40:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-482e067e908so2464585f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2026 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176404; x=1788781204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjNwViL96dqHXrSeA1TtrBU5nHsWdSZF/XzqoG1GBAA=;
        b=AZISElnoeEDD1ys0tEZTOzXX/Z5CdoAGhjHjxJAAg7hhH10OVU88C3MexzeWOui6Zg
         qOlTsD/h1BR1DNx+3WolsdW+GWLAQ6J03uu94g5w6iAK/wOMy3gCEYFBTVO+kMgzWCgn
         ToDrs05hmpFamlx4QHtwWoIb/MnkoNVOR2/Cj7FbEYpjymDxI1gYgy8g0Q9nKR7dTP81
         WIiIRX7/QyuE3FOPqNtfRZT7VGUoiLuAaiuSjMXlFQh8ThY1hjztCSiIM+K9Eu2CLMhC
         +/H5DhpPMyIvbCj5ul6QhZZSXn0kvPrKHHSFYZUXnAOZhiPiKh0r4FqJIyi/msOvPvzi
         lUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176404; x=1788781204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjNwViL96dqHXrSeA1TtrBU5nHsWdSZF/XzqoG1GBAA=;
        b=Io2zTcXUqfe3J7bOtD1FCbTMU3IvOo+06WQcTCB22H0an5r0ODL7rJWTUv4P0LFwNJ
         Luj1OdC80FfXtmF0cB4hIONBuHTqB2szEKF3kP6bds7fyvq3c9txY97M6svWDYzGDUzL
         zHVrZZiGbfpEgNXRn5qm2Z37C4J3CbGZNGsBIVcvpnHBTuCqLbPBdIdeMq5t2DGkk3KF
         ha2e2Ph4Yc9BpvO0Y7shYW+m8Tl0xDzhV1wO90Kk/8G9gY13BJI3S07ez8IGmXztpDDF
         GUY1U/GefMOgg+3lC8PvcWLeoDm/uqPhL5vjlFbj1DIztgjOatmpxsfDHUZhT0ntCP/q
         spaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy0TRPCWrXumW0goR3qDpN7DkcdYGMK5OzFBxUBYumG8scdDsvZc0HFF4zFDXb0hYQOvH+IZ8L3/4=@lists.infradead.org
X-Gm-Message-State: AFuF++m1XEmaqPSRLQBnB0xrQoK+mDx9XsUPE/q0/l3q+cVMUTYr5hj8
	bz3D6yuQiHPj2NeuHOLZpxlWK2eKKY92x9lBdw4Mo4U+RJ8CJx3fujNf
X-Gm-Gg: AYBFou0OJoRiOaLdsSl8+ypq7jkGeljnRNNKgedQSnQVqvNyp/IaakE0CtbqkiQjmxk
	fP/asowNea7NbOigaD4zCrMl0f6a8OActYuM079WIe35GKMIVCUCHkauzMe7XW4jf/hrfXF6OzD
	LZFV+lKQZG1t+zAdFrf1i/LGAaxaf+r7yZnl+pe1CO/2OqAhz4xEw7HfpVWgmdVn5/rI9wMnGwd
	4rZQv7O26URUQ0/7xFXbYiJsh7LzS9Pu3jNYm8fETD8Q/EzPLyVLd/HKztNmJwlzIAuzBs2FXr2
	qFo1SefCi4akVpUyqh2eY0+KrybRuhWXRAWwwMrm9EPogFBWf9TJVOXessJ/UAVbBHQHA7u49MV
	WIfpcAEQOl7MGehpfWqhHkvwS/nCZWqiJYkz9k4XiXWYBs61Ex8dJOis1No2Bu2bYYzZGSqg68d
	JIwHbqzHyWy769Hdt/x5C3xO410VghREXHJPwwlIxdn73j9VgsmNfixZG9HStmb7CFEA==
X-Received: by 2002:a05:6000:27c1:b0:482:e968:86d2 with SMTP id ffacd0b85a97d-482f79b20c9mr35297160f8f.9.1788176404281;
        Mon, 31 Aug 2026 04:40:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm11201044f8f.37.2026.08.31.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:40:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
Date: Mon, 31 Aug 2026 13:40:00 +0200
Message-ID: <20260831114000.1844796-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <871pbed8mc.fsf@bootlin.com>
References: <20260828085337.3916199-3-mehmet.fide@gmail.com> <871pbed8mc.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_044006_052470_4D60056F 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Miquel,

> chip.ecc.size is not covering the whole data buffer. You should be
> reading mtd->writesize + mtd->oobsize, no? Otherwise you only overwrite
> the first ECC step (out of 2/4/8 depending on the configuration of
> the ECC engine).

On this controller there is only ever one step: attach_chip() rejects
any hwecc setup where ecc.size differs from the page size ("Step size
needs to be page size") and the engine protects the whole page in one
go, so ecc.size always equals the full data area here. But you are
right that mtd->writesize says that much more clearly, so I will use it
in v3.

> Unrelated, but this comment is wrong, we accept up to <strength>
> bitflips. Not a big deal though, the impact is very limited.

I will reword that comment in v3 to match what the code actually passes
(the driver's historic threshold of half the strength). If you would
rather see the threshold itself aligned to <strength>, I can send that
as a separate cleanup so it does not hide in a fix.

Thanks,
Mehmet

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
