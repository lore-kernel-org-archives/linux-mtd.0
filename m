Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2DFC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTudh3j9JLZ1MCmM9CA3F8KoEg2uoTduQeQxL1CN2yU=; b=J/eeAaIud2qAgp
	CzZXXA9/1nH2Nh1sHGPp6EJ5p69XGhTLiIFPI/8Z0EY96dJWTxyExVe83fNKLAoGTqjLxsxPQrF4u
	JldPsb0gdr36zZ2g3raLwTHHtzmGEqXZ3kelRWP/KR3iqY0ON/u3IYYKIE6x0G/X7tMV9T7xXsdes
	sDcp0d41UyckgwDwYXh1oESm5Q0HRa0RdvGNUEhHew2V/McBXZ+B4KKb/Ipn/4iczQtFhjuNOQ5UL
	w4YHrBzc3ZIStubdnvLC8p9l+SrQZLNg21Rg3LLiEFj83YE1xDZPIrX/Yke4On6Il1wunH5ml2UOQ
	1XRw/rXM0zCuYlrB2OtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neuBM-004QQf-7r; Thu, 14 Apr 2022 07:46:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neuBJ-004QPH-J7
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 07:46:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id b15so5284757edn.4
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZACf14Zs4ghmlGixfvY80XJb14X/TIhq2Zk1CXUc0Q=;
 b=I0cbF59t7ZCgQYA0kYGOfxw8nnELP/Q6b+FdU3FMQbe/xZxZwQFZ7VUB/O7k+z5KBH
 fYPZBuEhgsM36w+2Epeykb7Jr+LyTR4iOXRi7cj2hiW4b66x/yggUVkERvM2eAKYtZNL
 Yez+IJXTiMQ4HS2qQOAP3ol++6KDw9W3wi1VkZL9gD74j3Xx3dy8XOgob0AHXXt47ud2
 ByfYBlBI/Lpq8PQ5QoJA9ZfHl1TQ6CLY995X1GH5P4ts85S0P8+Ardjs+AfBE6bOviK1
 QDK3qtYOlUeNlx/RVezsf1imLPNGSX9inx/ZAB9i1CwbCtk5GOys+zxfYaFICwlM5b7Z
 ywHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZACf14Zs4ghmlGixfvY80XJb14X/TIhq2Zk1CXUc0Q=;
 b=RpMd7dEFi6hsQpyElMs+/2lN6WTjupzqKlx3yQrNCWJ+U3CF6KntYpblmjRA8h63b5
 WuiaIU9928iJuyLSGvqFqyGoaHDSEaPjLXA2dAGhk+nqh0LuMwfMWzKMConaUVNMQuMf
 2K5tFiJoM/FtMfZGckMeoR6R8CUGSsrlJQZtYmdsJc28YLF2osPX9tLVMRWW40Uke4jh
 b+q6jBiZXINe7YlQP0Od2kAGMiOsdZ1Buc4yWVUMIVKzbsD/njBeQSpUHI42renjs1RT
 3Bx1D5s2m+Q5Vk2VVxkRe6mrcvL3o9gTamoyNUR4w1+WwuzAsgn4oza8ZqMuOZfkq/fc
 N1bw==
X-Gm-Message-State: AOAM533Q/un+G5l0gJ7qFSYkIjaLTiRUpzLHlc54FLYIThrdxdeYGUV8
 TnxL9q/Z5jCrUHPiR5G+8GIl7J2IcxG8q5Ui
X-Google-Smtp-Source: ABdhPJxyI8NKQhnAT+jqKW9ekCZzczQuBZwb175SSCOVY7zS38N987C/oKEs+Y+lRdq0VCGCzW2r5A==
X-Received: by 2002:aa7:c793:0:b0:408:4a69:90b4 with SMTP id
 n19-20020aa7c793000000b004084a6990b4mr1606455eds.58.1649922379386; 
 Thu, 14 Apr 2022 00:46:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 10-20020a170906310a00b006e834953b55sm375111ejx.27.2022.04.14.00.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 00:46:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mtd@lists.infradead.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-kernel@vger.kernel.org, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] memory: renesas-rpc-if: Simplify single/double data
 register access
Date: Thu, 14 Apr 2022 09:46:17 +0200
Message-Id: <164992231509.17172.5871980426499229486.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
References: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_004621_674267_2FD8D4BF 
X-CRM114-Status: UNSURE (   7.40  )
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

On Wed, 13 Apr 2022 15:49:21 +0200, Geert Uytterhoeven wrote:
> For manual write and read, factor out the common access to the first
> data register by keeping track of the current data pointer.
> 
> 

Applied, thanks!

[1/1] memory: renesas-rpc-if: Simplify single/double data register access
      commit: 1f26a60b55aa654c73b5b9eb9eab8a7d687d429d


You can double check if hunks matched correctly:

https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git/commit/?h=mem-ctrl-next&id=1f26a60b55aa654c73b5b9eb9eab8a7d687d429d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
