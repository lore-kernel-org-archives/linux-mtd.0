Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDC3C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2JdoFKYDkykIVwqm7uBsYMLN92FDm34rQB62/eyrnQ=; b=z6fus25SQZGxW8
	wuhoH9w2yCZvF4fvsG0oee3ustMTmUkh3pqexLGk9biJzqphGQ+BJ5a4uC1AV8tY1orD6osMBLP4e
	v7G957SD4dH9OhvEj3PbiFbzwp52eQ+s5QOb8sp9Zc5L7OQ1VeFbUiSw7xPuwYcJNjIIjDEbFeKuL
	M5Q5mGFQ7LP1WegxbjZxKH2cbiI29C5oPkwekVQqow84SS1PqRDAkZlvc7ch6DhWYEZW92VezlqPa
	n1opT+xbuILG2zTCFI6FwGzXdafeRn1D27xbEax8JgjDhIjIRdGgMZeNMDFpAibVr4dLO/h1hRZWM
	L72d6v25jnZK+Q7L+GcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndAJ7-0036ty-9J; Sat, 09 Apr 2022 12:35:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndAJ2-0036tR-SE
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 12:35:11 +0000
Received: by mail-ed1-x532.google.com with SMTP id r3so3309267edi.8
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F3H28syRAW9Yk8B6K22CaQ9bKsRYRwYHM8AZg2nTTg8=;
 b=dOeN0Le7pIzazYF9XMsOEzUATiknJIh/v6KWPn5+gf/98EpS/UojUsMQ3kk+Fz1MbM
 EXlu5YCZIAzDj4ka5vXjMzZB+lLw1yuhjdOPgrtihHNMriZ/lWixLDyGzRxeJpMFdNFP
 15F7jfOEbdX9huyf6i5DBbqgc96KJqxMCk6yrnF0TiZ3H0o52tHzxSs780Lnm+jqC9+J
 yZzq9tVuiWosc/Tvez2WBOUjRe5AN+Tcok6eh+cSO3CXG9TNnbOVj/8fWGlY+QIxhrLZ
 xKSyZiOViOTyt3MFMUVdwPNec02H1KXdiQGBElgvfWKuTqpoGE5My2hcGWfDONyCO00c
 gQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F3H28syRAW9Yk8B6K22CaQ9bKsRYRwYHM8AZg2nTTg8=;
 b=VeQZ4DI97Lj/ekQHNuQDcl6Zklpk5UPPLnO1PVcX4iahp7Ut0abpOJjMUNWb0OvUBV
 EfaYWYE+DV6f6IjGh1lg76MEiFhT5beaV196KUW3EAaXHa8QoqllG5xgl8uoJ1iGYx+t
 1SOjb8syVGeytPOLpZDhkzJ1RNlh0R9N4XJv1NBZxbSiuFGAnaYBfBi73O90wmYRAPJF
 7qNE7IovEOQkiQNT64j9b4ERURPR507ICzg9EY/Sq2KUI51BNaxo9OebS521GPon6jY9
 g5PDy7ZFEAJXG7VNRvCGG72yqcUr2xNE2XFWyBkCa4Z2l2gYvGiENqpzoXZmf+PxwxoI
 u4+Q==
X-Gm-Message-State: AOAM5328Y5EN+/j9QECtVI9xWICcsobvzd/HqoWYIVuVciGipthHBOVV
 YIKfQaACEPGKjqkXE09cW1Y=
X-Google-Smtp-Source: ABdhPJyxfWA6vAGDY6MSvC4xFoAahBQI/WuzWYLCHoffLpzNvCCkGLZhiBGVdaCFKXvPfJ0N5pOH2A==
X-Received: by 2002:a05:6402:4496:b0:41d:715e:6598 with SMTP id
 er22-20020a056402449600b0041d715e6598mr591975edb.407.1649507704858; 
 Sat, 09 Apr 2022 05:35:04 -0700 (PDT)
Received: from ?IPV6:2001:470:9898:9eac:f1cb:6e16:4fc0:c830?
 ([2a09:bac0:79::82a:3425]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1709067d5300b006e8488d9a80sm1866676ejp.59.2022.04.09.05.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 05:35:04 -0700 (PDT)
Message-ID: <9cf4e596-83d7-00cc-afcc-585309cb4852@gmail.com>
Date: Sat, 9 Apr 2022 15:35:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Karim <Karimdplay@gmail.com>, NOGUCHI Hiroshi <drvlabo@gmail.com>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <1649339427.653492.795407.nullmailer@robh.at.kernel.org>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <1649339427.653492.795407.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_053508_979912_C2FBB132 
X-CRM114-Status: UNSURE (   7.74  )
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

Hello Rob,

On 4/7/2022 4:50 PM, Rob Herring wrote:
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.

Thanks for your great explanation how to test! I found and fixed a mistake. 
How I have only one WARNING: 
"added, moved or deleted file(s), does MAINTAINERS need updating?"

I hope it doesn't require additional change. What do you think?


Best regards,
Mikhail


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
