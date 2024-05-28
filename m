Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD55C25B78
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hVmp6ap+YQiekuvpkGU2NdtZmJKqZPCeBAw6QO3z6A=; b=fR6XNGml/jWEZn
	y1HjPBsvRk9rlT3y/8KtIwsqptn53wpaLQRatAt587lWF6YGwo9810CrbFsjg9kDa36njPq10SgKi
	zZFg7dXhvgAT254ZuND2B2qfTVeFcdhjhlJ+nafTV5XlKRlYFbrY24SQXmq2/xdxp9LduuHPRa441
	FgZu3+h7BG9RH7cjHuBwpK4yRsVGGfXjwAMJSRljUvbngzJKJ+NMK1M4RtP8wgPa9QyZhtFWqsxIt
	cBicTfWhsWoESugMkYOj1upvGskBBwpNGS8QdedGyUZqvjYxFzdJy3D9XuiwypiwNYExoalmr8nfV
	4GhjQ0e1RQFIfCLOgaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtgX-000000008xm-2o0f;
	Tue, 28 May 2024 10:04:01 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtgT-000000008tx-2a6k
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 10:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3vkqjShmVbfcAxEtVWL2j8Hci5pLGBTVlar7XdZHH0Y=; b=muSwFo9xnIVZK82AFfhTbeHPvZ
	2Pjtjzc29ioK5O4DlNZXIXuVCh1zZs5OPxszNAiktQ1SFMmjAXd4p4oMPF8afmIuD35HHB2fpAWhq
	jE+wV19X785cC32ycJ2vGctRMaLWorWFMoitfK4a3TYGS3ddAdRF9+aHV2AK39c1MCR4v4Jc2HHKE
	L+QluObx6e9gvMZLDECEzsUuEGVrQpzFCz5ce11B1aYq8bk8lxhW+3Slpwi3vDRBzYkNMCTv3NZaw
	74WuPAtMvo2qE1bRjgNKoir9oYWrI2ZB1XWsRXng2NDQycYpjNeBOtJNTLE5zV0Yq4Z+QpSfKJzqs
	5t3gRqBQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBtgL-000FNN-GX; Tue, 28 May 2024 12:03:49 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBtgK-000P2X-2B;
	Tue, 28 May 2024 12:03:48 +0200
From: Esben Haabendal <esben@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
In-Reply-To: <e3aa72af-c824-4b71-a99d-c0b9294bfd8a@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 28 May 2024 08:53:26 +0200")
References: <20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com>
	<979fd913-050b-445d-9ca8-0ec6906ce3ea@kernel.org>
	<87cypc38gu.fsf@geanix.com>
	<9a7f73f4-f5dc-4342-855b-08df6a839bb5@kernel.org>
	<87le3zoatn.fsf@geanix.com>
	<6c166ad5-8004-4bc4-9107-a47ba9a72161@kernel.org>
	<87ttijaglp.fsf@geanix.com>
	<c045f1a4-9ddf-4c53-a69b-22ceb68a1ce8@kernel.org>
	<87msobaes6.fsf@geanix.com> <87ikyzae7v.fsf@geanix.com>
	<e3aa72af-c824-4b71-a99d-c0b9294bfd8a@kernel.org>
Date: Tue, 28 May 2024 12:03:48 +0200
Message-ID: <87y17ul0cb.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27289/Tue May 28 10:30:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_030358_442517_851994BE 
X-CRM114-Status: GOOD (  11.73  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 27/05/2024 09:47, Esben Haabendal wrote:
>> 
>> Ok, I seem to still be confused as to what you want from me. If you are
>> saying that the kernel is not supposed to care about out-of-tree DTS
>> (and thereby any bootloader provided DTB), I would like to bring your
>> attention to arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts in upstream:
>> 
>> &ifc {
>>         #address-cells = <2>;
>>         #size-cells = <1>;
>>         /* NOR Flash on board */
>>         ranges = <0x0 0x0 0x0 0x60000000 0x08000000>;
>>         status = "okay";
>> 
>>         nor@0,0 {
>>                 #address-cells = <1>;
>>                 #size-cells = <1>;
>>                 compatible = "cfi-flash";
>>                 reg = <0x0 0x0 0x8000000>;
>>                 big-endian;
>>                 bank-width = <2>;
>>                 device-width = <1>;
>>         };
>> };
>> 
>
> I don't understand why it took so many emails to answer that (my first)
> question...

Because I did not understand the question. Primarely because I was (and
is) surprised that out-of-tree DTS is not supported. I was convinced
that out-of-tree DTS was the right way for hardware which is not
commonly available.

> Sounds good, however you did not update the existing select.
> Drivers are not supposed to select user-visible symbols (leads to
> issues), so you need to change it to depends and update defconfigs.

Do you wan this split into multiple commits, or a single commit changing
the Kconfig to make FSL_IFC user-visible, and changing select of it to
DEPENDS, and updating the related defconfig(s)?

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
