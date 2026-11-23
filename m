Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7E4606A333
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nO1g9H2h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RIjnvKM9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=He/RxwCnhWG/9a4Pya/XiYcsssXjHzNY4kwlshE8JiU=; b=nO1g9H2hscEDQBE0EA0gyGP75p
	8N/VLzot7wWLdlFSu7eo+91PfGwE4TTp5nO1tVbADEPkvDvqDeJtuwBvvU3MC1zh7YH+f9rQ+zcQs
	XoEr8IENoOrRWH1fkZZEoPLrr12YT7r5CxGj8Z4bUdnfRtbGg/aMRWV4836lZcZ9zwerJbzqf2gm8
	RYlgLdILn9zV/3ssMQnzZfbxpjh4S7yQhB+XuXUVW0KwX6TC9XhAI/NhSty7xzZwQSwd8oT2ROoc8
	zlUK76s9esIR2HAHKvTNtr7xfTDXdDmgYzRb+Pv6or/tYtT5U+Xp9fzB6o/cm/QwvbPOekZa05ncr
	1HFGrkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRY9-000000031YD-3hBK;
	Mon, 23 Nov 2026 10:45:29 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRY7-000000031Wo-0Kba
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 10:45:28 +0000
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 93A692004F5;
	Mon, 23 Nov 2026 11:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795430723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/zmpz0TamTPeoYCPc5+PhM53Ju6/rNyQtIdD9TkNvA=;
	b=RIjnvKM9/sml5/I68OAzMHquglOuil1ZFv5/SHYRYteoKPjt5jlein8W/0w6/xjhzHCIIV
	refavobv5KFomJ6Ba4iHhyh6SjQ6xbZlX5sDk0XDWfSr8hzgso98vkBnvKmzwMd2fZdbXJ
	v/E3lIpYJL4uCX3xbZ05DAZLbZZVXCEiitJgT4+PNAboGlOYHu8wUH7Pt4XprEqQl+XM34
	dpk8OIBiP3Zrlebe66/UmGwdBS+rot5LXN8OoZt9R98G+e91u/REn6HBsHk4NFvzerzbhY
	/+ZsEYaRF7xE6CpUd/dcqfDdcHOvtHiSOOT3RVbyJl5Yr6DsE4OE2hbFPpsXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795430723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/zmpz0TamTPeoYCPc5+PhM53Ju6/rNyQtIdD9TkNvA=;
	b=UsAr9rh0cp2RkRVjU7JO1PGEJ33tH8u91Ls8m2nIOHuOfFv3XgI0DEC3I/KWFCPqNmQ8Vb
	P1EOhWWZo6LGvrMggy/O0HXR/u3pwwP2qdYEO8wPhad1pgkfx189DBD53pcpyVE7YQtCoi
	YgTEqmMhWpTqzOTDDswRQOQh5B4qX1FPUeh481U8w4hbWXSLkICnFkyOJruD6bC9N3gfMs
	ahrQMQf0OQ66HmQhkE7gmD3hBmAFWn4YPipGJcpKe+L0TyVMiqK1OziLnAonLqBT/a8+vU
	SU8L5b7HkwsrHwsHi3Zia3Dk8qEUu1IMf4fvP/xhq9ky55akqxb6eqplbrc3MA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795430723; a=rsa-sha256;
	cv=none;
	b=frP32e+r/gQjOr9s3T9UeKlTnbzy2SaEoU40sY+pC6uGpdlGzL7W6XTGipl6L+ukqLMML1
	3/RKB4L8fDLOsaThmAwit53GKeSELhDhbdpP2sHk+O6vdLdNLWN7wwW4df0XTWAdE7Bneb
	ugyf6eg2H2ZdnxuiWAmgI+J+M3vCJ/FzsdSgLdwQaJkB0oLs9g32/LrCIiLkv6AYmMQwy8
	rFfSZOJAkczbgPKihbzDuk4+cN04AHM8paOJYKz3wMuIz1EZ/cAWb9w+mCWpTmMhONf0K1
	IBUap/dN5Zr9htDPpXKHgymQFt5CXLcHOYBZqzi0yw/fbQNRdfQXnIbPSZWOeQ==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 723791BF694; Mon, 23 Nov 2026 11:45:23 +0100 (CET)
Date: Mon, 23 Nov 2026 11:45:23 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: =?utf-8?B?VsOtdCBLYXrDrWs=?= <vitkazik@vitkazik.cz>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <34hku3cwz5tgpz4l7jtcsupictopwpwv6dmbkyhwvi2husszfo@5pufgrbxligl>
References: <20261121234125.16093-1-vitkazik@vitkazik.cz>
 <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024527_271765_3BA859A7 
X-CRM114-Status: GOOD (  12.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey,

On 26-11-22 00:26, V=EDt Kaz=EDk wrote:
> Hi,
> I found Marco Felsch's earlier submission for this chip (2019/2020)

Uhh that's an old series ^^ Can you send me a link so I can check it
quickly please?

Regards,
  Marco


> only after sending this patch, and have read that discussion now. My patc=
h was written independently from the datasheet, and it already uses
> 4-bit/512-byte ECC as agreed there.
> =

> One difference is the free OOB area. I expose bytes 2-7 of each
> section, following Table 11, while Marco's version
> exposed bytes 4-7 so that the free area is always ECC-protected. I'm
> happy to switch to 4-7 if that is preferred.
> =

> Marco, if you still plan to send an updated version, please say so and I =
will happily step aside.


> =

> Thanks,
> V=EDt
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
