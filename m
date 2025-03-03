Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF6DC282C5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpyJ6ofQHQhmYljhlxgyiwfwkVSrCACZ5RzfHtWhYtQ=; b=MNLNAkgBkyL5WT
	+ybx0lX8ufn403GwE2KPQLKVLF4HOpjqgRaInTYqQy1mpoHItbrlQPFD9tKCg4NG2R0V87OAWOXDf
	ACsl4Oquiux2/rUVyr/9pI2315dYMR4NE5c5gh7HgG3PVOILput7E08V0OjSPTpk/3tzjG60wH9eH
	tCGx7BXXsp+LNhettOTwBwJE4Z21CkmvOPDtNrC+Nw+yHp+TbaGNAwoInfKhRoVKQsB+GFCK8MQr8
	AIBEp8AIf3H61FRde9hz5m34JVf772IbnLAyKWfXy1hi8R4Xq+tsHZ90FgeSBRJaDGkhKDY8SCKca
	Dee31aaNVf6QKPng5iCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Ut-00000000QYe-0C7M;
	Mon, 03 Mar 2025 10:58:07 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3T1-00000000Q6l-1393
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 10:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740999351; x=1741604151; i=markus.elfring@web.de;
	bh=27Xfm2szNcVPGdaV+AvjRGIZQra8NDa1xE51q3tnc0c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=xCtcY2W15t/CLVk26dzklV2eCVer80egCefL/fUIV2wx4QdhRrg4oOQe3FRb6KcW
	 LvU4QP442D+ZwsRfG1pIS47gCY1klL4dBJg51rBqrBwJTqUCguPE5+TyN5+g70Ls6
	 22HFMGK6kUbaQ5LlEuxvIC2eNfpYDAoFTEIsjQKUkhXS+IxiHJUBJ3Ufycpq02RBh
	 +87ZBZrM0h18zODGxZt9tbnXIUJZftq7H/pZ+HoTMch//N05tRjT15kMLU275nBbx
	 GVNEwDV+VPOzax6mMpMo6e85bZZzI24bCT5EKekTF8o7O0LS/ioPLXnJvTgiukTO/
	 FOc7bCukc8s3h9Nz9w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9431-1tAcNM0uCl-00xRN5; Mon, 03
 Mar 2025 11:55:51 +0100
Message-ID: <0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de>
Date: Mon, 3 Mar 2025 11:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: tegra: Simplify maximum determination in
 tegra_nand_setup_timing()
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>,
 Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Qasim Ijaz <qasdev00@gmail.com>,
 Natalie Vock <natalie.vock@gmx.de>
References: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
 <87pliy9yyv.fsf@bootlin.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87pliy9yyv.fsf@bootlin.com>
X-Provags-ID: V03:K1:Wr8t/rf8kDyQbUAB23eYrBcTdp7zAiyaAsPFXa6sJC3K5UfvK8C
 a7ievt+qpohXG+NyGGuCKYWMcDs16VuaRGzm3w+k9mjG4hjieQ9hgX/FgaHUpN/UlsDceeQ
 anlOSPDmsx3S+mDKz1KD/4vXHjYr9r0huaRAEu7Cg4O8MIrZZeQDJ0I2WW6K9unNYYt5Zfi
 9QymYDu3N70lGrEb3oLIQ==
UI-OutboundReport: notjunk:1;M01:P0:lFy4vFRmfeU=;B/ycTgtncXwBkYgLSABhyNZnMAK
 j/RlJzECcJzdvzsQz8yjBmntc7XWrQZ9sXZo2XZBu2ZBWxGPne/l8ebM/Qnv4zADLmlWdvVvA
 RAYEmbDc4kXr0GAh16w6mSzg8SWrImH2vkAKQt7a0s0DxihRWxsJAnpzL18EEwj9BkL/EHERE
 PpfXT3yzb46J8oeBXzqjUIu4GXaYBW1b5PoLcMKwRNTpk6bIrQWtl9iE2plsoJTRFpTLAPaI/
 xXEaP0j/Z/1lFJbs7Ntffwg28B1k1A/5cIrxy1soEBdjYdMbywH/l+KdwVzVDAUK5c8qgTaSA
 FAXo8SWk22al7EWl9Wp7QF2nK8ncTZ5OQdhgSGfJM3W5d7EtrcUYF+nb+eWv8Llul0a0Ky8co
 j8ZWE7j11dddu/ip8e2Y8zRFjGPYz93a8RW9ZttfwO8Mpu89GI82d4xG4YXloX7kRdpV5N1BA
 uv6+WhAlR/ros3YEPIlX14cdnuOlZH5Tu1QT1WFQ7a4AtqekLy1b5ism8fvIkh7UgZBavsSdY
 FUqzjfqvZO1qLDw9VDToCW/U8njv31rfj4DFWEXKqRcztuDmXtjg6narK/9fkOhyUVAeoJ8hP
 mCfG8P28nvnfFDq/JnPdhSC/G2HbedcZYU43onqwGYm4QQ1IiooQdI/jCBcRtCfCsCmInqkij
 EDNp9D0qXcm9B1PqrckdjWN3A2UtnvMhVTnEcvSlV6jLV4KqMBCXyzCKZ8o6rBg6eGfNlQPtx
 p1v//peu7N0y9p4RlWtbAjV+c5DY30oe/JhBTvJjGFlfwkr+n3gVzXBbkZQd/fnQos6C1bpoR
 4m9Zd83lnU7Sze9DapIQ8Gw64jNoVctGprwqbepXi0vnsM82KqoYt8Br+i4xekpO0pEuVk/1R
 rTQyd3Ljhc+z19urihw1U6yatR40NuZwrf1VE5DdLq6Vd+5INPu4XFspbKIIlFFNA+bF8/VC4
 zO1JS/Orir/w6zJLfqPYq43zjmR0eTV5Em3fO5q1uXC1TTGTtL240njSQJgkOxN6T+CUXS37n
 ZyVGMf+OKFvEUDsO1lNFGQMqwt2R+Bj64C+3dz6Yk0OyPpvDm2d0lSEBr3hYSI49RXGrMBMhe
 52Yvqpssjyl6AniEfF582XkoCXAkE7VzBCdLuHteA5S0l/ApQhAyPxZ0znDPseMUJ2KwBu8wf
 8h1TR+iDoPIDBwhgFHx+o8O9yTlkIsoslczSzFe8TKUmlX9R0KMwjPXTSe8YFsgZPJf+MT0QQ
 PjPKebE2xJHg/yModKyDn3KYOGHkE+w0zjvOY84Nga/RrZAfeTzByeiw5G+BRLGkgPvCOiBVG
 5Pt3mWoRo08d3YV2iGU/7FCAtxcgK6x6UGSaK+nTZEHRXzkRv+TFSvked46fQf1RqucU/9ayf
 /xSqBkI6wRUL/k4mMYwf17O5cFJLHm/hbPTuxqXI93DFIyqaOTYQcKAmyuOdWngAl2xQ09brm
 q8l+j+zCcM9F8CAMNMcpGw/85Ngk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_025611_605247_84257CFF 
X-CRM114-Status: UNSURE (   5.03  )
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

> I am sorry, I do not see what gets simplified. max(max(a,b),max(c,d))
> looks simpler than max3(a,b,max(c,d)).

You would eventually like to express that a maximum should be determined
from three (or even four?) values.
https://elixir.bootlin.com/linux/v6.14-rc4/source/include/linux/minmax.h#L147


>                                        Does it bring something in terms
> of optimization?
Corresponding effects depend on various factors, don't they?

Regards,
Markus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
