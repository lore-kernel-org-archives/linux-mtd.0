Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C53C4828D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Feb 2024 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MSIaG0rqj0387ZJ51IBlzq9TV0YJqiXswpzODfqZlJE=; b=BPay3hTRzmPPR5
	a0Li9LOyJkELKa/Lj19mW6U5vWQsQ3VcKWd3ZuE7qN2fgnqE7zzIGpqEJYdecB6GesGNN0PT46jMZ
	HIDoG7Lt5TL16gclWe1e4kycV0X856HnAT3NZwWhdRaa9SxJ4GkYmHqvnC7aSqqmdOtWwH2/QcI3f
	9vkxcD7EqxLycJAHUSHVGZlBONp+ZFgA91t3x4dYSGhVmfhB7c4VsLzz/WzUnw6fVHLS4naECr/fg
	/J3ljBh3XjR4y3N9InTW0JGMa0gQPn7pjjoHqKYLPMxc1Vx4yuHXKf9f6bvXBczOKNl8GJ2PAzOtw
	9QBgnDTyGuw9zj2svXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXm3l-0000000BMIo-0kol;
	Wed, 07 Feb 2024 17:50:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXm3i-0000000BMI2-43MH
	for linux-mtd@lists.infradead.org;
	Wed, 07 Feb 2024 17:50:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-55fbbfbc0f5so144753a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 07 Feb 2024 09:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707328204; x=1707933004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z2FSP0AMac+5+E+PTkV33ahdwTRCUgCpOnh1itA8xHg=;
        b=hT9Fjy/87SvNbU0wY0rBW6OYuUnbvM+uUqyuHagcxvCznHYn+tWhuq/lCx7a5l5owC
         4qcOnZZxBNwRoVJ6GR2a0eleCs249ITM/4WIBuhhOyoLjEBIzmhjt8GTbISUwy0WAony
         zxnDhbj7hN9lhskRdxij9nLIDz79IleyDfYIWSRFH9Xg/dBagdH18N5tXC3vodVpQl0M
         23zrbwcKswi3t/R7TE1O2VG5QeqW8wlBbIrWsJ2PP7vA7TKmz5euiZ2+RJqdVHSNidzq
         daBgYc5Ynoa+q/VUqY4oGfXJpHeNQ/b3kQ9V95Kbrjtm8bFfo6wrcNbtzMpcWgiCkkm6
         oV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707328204; x=1707933004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2FSP0AMac+5+E+PTkV33ahdwTRCUgCpOnh1itA8xHg=;
        b=KNVgVYROkz1Vu7Vd4l/eN3SiYvLCZUQCwTvjVwVZ+5jKqGqfQlOkx3+CUg6IeRvU5z
         0tHMPSrGGSUlSj/VT3/D6E0sXZhJ0hJ7I+ILlhvFF+dTvJnvK/9J9ahB5XxivPtZkwaw
         OcjPaaXSbl9eckBHWFjwbLVmlQRhXK5NWKBNhasqpZ3Eoumh5gTJK+V/iie+5nOjSPHp
         4mbEPjliezA+HdPTOoO7bmTVQeCAnxdJmImrAmK68aYBSgUQuxO9kGFrqy2izHLqV1cR
         FCnsOz1BVPY69oM1ApkT9b/Pg0k9CbMj8LoOhQ5tzK1Si082D5cgFEkXP8DrDKIjFhok
         T3mg==
X-Gm-Message-State: AOJu0YwTTDODA7UDHMjiyptfpDUk7njqWRL1Lb9HwnV9+fPoRPdWelfe
	mvHPTtHnhjydGgzj6TbwOUN714bfLQ/tvJ+qlaaM00Near21IiQY
X-Google-Smtp-Source: AGHT+IEtzxtSoyL4zD0Jt8OZkZVEeLRJGCIq291CR/YkwkGPSz+ePtZ9DA9Nnme/DYNmlXmz/b00oQ==
X-Received: by 2002:a50:f688:0:b0:55f:ecdb:bcd5 with SMTP id d8-20020a50f688000000b0055fecdbbcd5mr277034edn.2.1707328203906;
        Wed, 07 Feb 2024 09:50:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXqyUnvdgxWOzQY/RwNTPGsjWaINK5My8em0zcGkd0Kqvnzv546crHfgdz0M+9z7P7MYE9pgGqMhf/0ky1S5mP8UXI5q5F6zqNq+TOT0cZNtkkrq21YiTJ3vImEHKGz7ZV+/CUhZQVw5OKnuvu5sLMXOwSXimkeep0rcROwrwg5Jb5xdGQSLCWiWc+cMSY+994ZrJK33/773HNVlOkkkt1WAPIcQHxUR0cifxzpHGlMTWykWyRuKZ/ZAuud07P49uOl8c5+TyKz0O4OYSJ1fPDtd4ZA/15g6rjBfsJQ7owj3R3RNl9mNI1RMm6nJUJetA==
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id c18-20020aa7df12000000b00560f3954ffdsm180992edy.24.2024.02.07.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 09:50:03 -0800 (PST)
From: max.oss.09@gmail.com
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	patches@lists.linux.dev,
	s.hauer@pengutronix.de,
	han.xu@nxp.com,
	tomasz.mon@camlingroup.com,
	richard@nod.at,
	tharvey@gateworks.com,
	linux-mtd@lists.infradead.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [regression 5.4.y][RFC][PATCH 0/1]  mtd: rawnand: gpmi: busy_timeout_cycles
Date: Wed,  7 Feb 2024 18:49:10 +0100
Message-ID: <20240207174911.870822-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_095007_034708_69EC0062 
X-CRM114-Status: UNSURE (   9.10  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

Hello

With the backported commit e09ff743e30b ("mtd: rawnand: gpmi: Set
WAIT_FOR_READY timeout based on program/erase times") in kernel 5.4.y
I see corruption of the NAND content during kernel boot.
Reverting said commit on top of current 5.4.y fixes the issue.

It seems that the commit relies on commit 71c76f56b97c ("mtd:
rawnand: gpmi: Fix setting busy timeout setting"), but its
backport got reverted.
One should either backport both commits or none, having only one
results in potential bugs.

I've seen it in 5.4.y, however in 5.10.y and 5.15.y there one of
the two backports is also reverted and likely the same regression
exists.

Any comments?

Max

Max Krummenacher (1):
  Revert "Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting""

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.42.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
