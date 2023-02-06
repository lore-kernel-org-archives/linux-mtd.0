Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE50C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+Ml/ejDygRdBiqd6trLPpb1ineX1Lfx+b/H0t/tO8o=; b=iUiO7r1zwfF39/
	mCPKXV1XdikcfUB0JPym+g6VEyZuCnssOgTsQD7V+HT5NWtLCrcW+BSWkgoWWrIZ66JDqOT+KHHrB
	0cHNw+dEb8TK0fAYYzUEnN0TbhdVwFEsJ7617xiTECP6grbuCvsbpIZsQAEjVUmLOWeku+ZO/Y/r6
	xWPRZWPyR26PBJq+60S9q+ZLtULehcq4iKJhfBs1m+qYEuLHidUOQMmimTsgRUwCQVaHRD481Enec
	HGbY0xkYZ385AM5j8I5Lc9ZXF5Clsa4dnRmn2n/SqZc5y1vxfC8uS1ZBP7H5m04l7cOQSOvjuW6M0
	6X3VJ1CuLsUpdmyDEr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx56-007jl1-LD; Mon, 06 Feb 2023 08:42:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx52-007jiw-OR
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 08:42:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id o36so8089955wms.1
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 00:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE327sjgKmScy+1bnD3WKWCENrHEfYM/F8714Ak6Hu4=;
        b=xI7JhiS1vmRN3KOSmYpBb27mCSKrdjiBahpnOGUXRNx3XDw6ekzEcICbEcmn9K43vN
         jcDp4fpbaCJzF7xesezNnlz/WCol73gCl9OjN0V75E3XyJ4Df09mY45/ubYWASSz7NHZ
         IMvFnhytQVEOM+UDT4g5w3Iea9XstH+HDP76JnStIyBGh1Xg7FtD5IJ5ragIqBS8xIWw
         JG+v4CTQDhTwBSCJ1kFQYM6WUYdu/7qBbK5nddG0a3YV4//MyvqUtIUAuvqBjEN8wO7L
         O6+EighIMxUNj2LAZ2W9xOMgp3zdvrBLEZc0qEv4I9WoSNkBYSKYNXg8pUecH4yBPF0j
         M6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AE327sjgKmScy+1bnD3WKWCENrHEfYM/F8714Ak6Hu4=;
        b=ktsHn2XN+T46nyujpulQNR7sU7/YTBl+1XUxcsM4h+vVSmIbrIhS8ci78lrN8GWeCT
         bcSOO5GL12097kAMFnABykF7bQBqzb9p8DtEH2Nc289Eba9b4W4HgkAAL9yO9wPnyVQj
         YO5+F4NlZQS/kGpWtAwTInTQBzllCXPTrPEIpHmYtqXzqO4Zh6JcWOZpgDOPsvIUPG0X
         s7+8ZbpZ2CWT58P3i10K+UiDpZUeiSvUeXXop30ddTOB5U6txs3XaAuH5A3AIVPaurQm
         aGqYqGNoJok3QH4fLSDUZxw76dTyBHqN2f/LdxwyX1UYB1uj3yCMaqTsE4Tk6ZMz510C
         vYlw==
X-Gm-Message-State: AO0yUKUd8s0csbRc9XyoQwmmic2lPUYRyuGThaCrlluUCBltd9FOZk8B
	zSjS9msqOutIvX5Irx6xcTIkcg==
X-Google-Smtp-Source: AK7set/k3iebp56HtRvylh1Q5s6xc+VIaCiBCNBL3n1tsYWIT76P5hrK/RK/edVEFgPVh59+a3YyXw==
X-Received: by 2002:a05:600c:1e89:b0:3dc:5b48:ee5 with SMTP id be9-20020a05600c1e8900b003dc5b480ee5mr18287612wmb.2.1675672945695;
        Mon, 06 Feb 2023 00:42:25 -0800 (PST)
Received: from 1.. ([82.77.80.113])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm11225960wmc.4.2023.02.06.00.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 00:42:25 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Sort headers alphabetically
Date: Mon,  6 Feb 2023 10:42:21 +0200
Message-Id: <167567282461.10447.10704477322040146991.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202144628.14443-1-tudor.ambarus@linaro.org>
References: <20230202144628.14443-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=516; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=1+8qw4rrsbhFfDsWmnoxHPmexlC53wUEVJGKbUiiZRM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBj4L1skQGkBouWgdqmuA4EK+YsgRBDnZenLXEVu rppEBSnEkyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY+C9bAAKCRBLVU9HpY0U 6R9GB/94MWry0wf01KfEgc/gOwxg0QnJ19izMA0XmxnGjLOq8ajIpFB7O/Vy1Ox+StEhp3pBFu9 v8q+3yGN46K/SLBwAxVnGW6Fo2smPUeqLjX9J2vmhTrSrs8Jw9Hj9suokEe77z6aI3CTG+W1y9H uCy4FfXwH9QjJdSUTvJkFgZQekgrCdv/iDOKeQcRPwQ6ijRSmtnqJEUElni6SzUf1oB0Y9C9psL uSBV8WrHxUP67jeQkmA+JhtsM6GvCf9ucD1U3vPO61bstgGIp3+vTZkUSFzaEKEI0NA9zEtiFkM 4DqZdFyNthEv6F3tThznuMbhLeranRTtv9GRZmcyyUxkY9YV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_004228_817089_8B6E2EA1 
X-CRM114-Status: UNSURE (   8.06  )
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

On Thu, 02 Feb 2023 16:46:28 +0200, Tudor Ambarus wrote:
> Sort headers alphabetically - it helps locating duplicates, and makes it
> easier to figure out where to insert new headers. Alphabetic order should
> also prove that each header is self-contained, i.e. can be included without
> prerequisites.
> 
> 

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: Sort headers alphabetically
      https://git.kernel.org/mtd/c/893fd950c89d

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
