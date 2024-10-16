Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA992D1AD50
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFj4nrPT6NJQf/qyMCFzFSyEDljbWGMwd4ow8D7CoKk=; b=aWj0L3PSaPA5Zr
	bOk/4GWULp5mOkqTaY1KQVOiqpnSZG3c28gGTKLM89Rezwi7Ea+xuehstSIdi0Imj8e2ySREBGv/f
	YPLtWFC4aBms8UZRcdHufPhgheXAXI6+DHpfnAuwqhpCyQssr6/bzCQbO4NJLP9Lh0WtFXRnWlpIg
	spluNr92jelS4tTo+QAah3DluX3jXp88HxKK5qI8KZHAOAz+39QSHoli72q1C/ImmYALG6bqH09MH
	6NWTkVVXftJ5XKYPjf79aYU/5JPLP/Fe6ckVcFU+5H/ieWqpzdM7UdE8z77UCje7OoISyf81gHxlf
	HtGq1GqXTT6n+DmCDO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t13Kt-0000000BmER-1Vjr;
	Wed, 16 Oct 2024 12:41:07 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t13Jn-0000000BmAj-3cgF
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 12:40:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AE5C20008;
	Wed, 16 Oct 2024 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729082396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwCLWg+RLvZ1CazX84WO0lBv6IP5vanGGdAexVe8kqo=;
	b=GM2OhyQdXgsftdngqhuGrez6uwrzyhaZms8F5aCPa5OJwVR9/S25ywkmzf+tn3I65oT7o9
	sVLqW7NnDOufPyhotCEJYJqp3/r79lYrQx3Hj0KZ8DxXfHouQScFq1s58UrC4EilYvzsF1
	o7TADG43n+zI2Nineu/XKmQEHNYvsYZEMHUrp51mjPkFXeWTxISQ1M3I3yzQpArpgw279C
	2BrNyeSuq7NtODH1BZqawR123HiN4EfC+eIREKFQ/abYB1iXM5xgWD0boSUtHqb1rTkAuY
	Va5UPhQvbMsofpBYXYzt4j1MdftHQAKTcYtuEtg+bu8vKxr5nnnn24+HmzRTVw==
Date: Wed, 16 Oct 2024 14:39:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: tkuw584924@gmail.com, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, mwalle@kernel.org, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Use nor->addr_nbytes in octal
 DTR mode in RD_ANY_REG_OP
Message-ID: <20241016143953.32b66612@xps-13>
In-Reply-To: <mafs0y12ocl7n.fsf@kernel.org>
References: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com>
	<mafs0y12ocl7n.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_054000_071796_1DF4ADE9 
X-CRM114-Status: UNSURE (   5.84  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMTYgT2N0IDIw
MjQgMTM6NTk6MjQgKzAyMDA6Cgo+IFNpZGUgbm90ZTogaG9uZXN0bHksIHRoaXMgd2hvbGUgdGhp
bmcgd2l0aCBwYXJhbXMtPmFkZHJfbmJ5dGVzLAo+IHBhcmFtcy0+YWRkcl9tb2RlX25ieXRlcywg
YW5kIG5vci0+YWRkcl9uYnl0ZXMgaXMgcXVpdGUgY29uZnVzaW5nLiBJCj4gaG9wZSB0byBmaW5k
IHNvbWUgdGltZSB0byBjbGVhbiBpdCB1cCBzb21lIGRheS4KCkkgYW0gY3VycmVudGx5IGxvb2tp
bmcgaW50byBkdHIgZm9yIHNwaS1uYW5kcywgd291bGQgeW91IG1pbmQgcXVpY2tseQpnb2luZyB0
aHJvdWdoIHRoZSBhcHByb2FjaGVzIHlvdSB0aGluayBkb24ndCB3b3JrIHdlbGwvd291bGQgYmUg
YmV0dGVyPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
