Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E230EB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 06:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6b24NNIMSfMUNZVufuxNIfg2B+jiF3FoZOSM51QtK6U=; b=tu7Nl3sj9xYmbk
	CNS1GcmoorGUO9dwdXZ8+XbCSs9upEzMSpPUvPAWB5bEDqnTst54N7uVYsE6Ksxszveg9FVJBYNrJ
	rRA7bYsV9EpIIQ5csk+S20HzOWsAprfIvqiZRWJIRonjs5BSoetlBdl+dgQYATznjB1kWCklIgaTl
	KUYPmwLuQz3vO5PcpulTsBNI40Ytr7edbhm6AQDqjnzfCz0ARgdMqAVzLKxXYe1iCcJ+nu+Tiv17b
	EctFlL6U1XreDNU2W9n0rBhtdR5+M4qgD4ldeJGwcEHdZe/t72wt931lzKrPu2F48SNeQngU/5sU7
	7Vk3mfWeRv/xQncnAoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQjLS-000VOE-0G;
	Tue, 01 Aug 2023 06:59:02 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQjLP-000VNh-0c
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 06:59:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3561E0007;
	Tue,  1 Aug 2023 06:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690873132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5FAqOX/33n4uDpymzBUG8KgidPfOT4KtVFrkPH1G2o=;
	b=KJtnGFYKCzwPhpLbN7Q4usbgj03CTiHxHRd2Qa56IhSRffPYRSc+P2xepM3msWRxzkJDAD
	ROckkMbzKw6RQiI+JRfRzBrTNkWRvCYWWJLWxhac8jhfhrnyCuQ1xhzqfHRT1pSDijYp1c
	ctquRptT1Qjvb7lsZQXaqZZP8GMRPY83yKayLf8j/2LDFTcsAaf8TTZeYEbNWa9QifvusK
	JsWHaasNQKnZ+4eQTk/NJaBq/QXgE2SyxsxtjRvVjRNvZdNNwQr6v7qSunXuhy/zkB7yDB
	x87Rwv7KenA9+86WdftoZuurdMCdKziUnauhU9hiAoyQ9YZERqlj+XNcAzJegQ==
Date: Tue, 1 Aug 2023 08:58:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheng Zhang <zheng.zhang@email.ucr.edu>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: kernel BUG in __put_mtd_device
Message-ID: <20230801085847.46c7db12@xps-13>
In-Reply-To: <CAC_GQSp7W=MoiWoWo+UFFcZ48JLwsnfL84QWTJm_DNLO7S9AxQ@mail.gmail.com>
References: <CAC_GQSpE5nbj7Lt=8sXu8GoSQTRd+=fpZb_zpVKQOJ4MxRHzsw@mail.gmail.com>
	<89021294.889167.1690781715755.JavaMail.zimbra@nod.at>
	<CAC_GQSp7W=MoiWoWo+UFFcZ48JLwsnfL84QWTJm_DNLO7S9AxQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_235859_514919_7FB6EC51 
X-CRM114-Status: UNSURE (   9.43  )
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

SGkgWmhlbmcsCgp6aGVuZy56aGFuZ0BlbWFpbC51Y3IuZWR1IHdyb3RlIG9uIE1vbiwgMzEgSnVs
IDIwMjMgMTY6NTg6NDkgLTA3MDA6Cgo+IENvdWxkIHlvdSB0ZWxsIG1lIHRoZSBiYXNlIExpbnV4
IHZlcnNpb24gb2YgdGhpcyBwYXRjaD8gSXQgc2VlbXMgdGhhdCB0aGUKPiBjb250ZXh0IGlzIG5v
dCBjb25zaXN0ZW50IHdpdGggNi4yIG9yIG5ld2VzdCB2ZXJzaW9uIHY2LjUucmM0Cj4gVGhhbmtz
CgptdGQvbmV4dCwgd2hlcmUgbmV3IGNoYW5nZXMgaGF2ZSBiZWVuIGJyb3VnaHQgdG8gdGhlc2Ug
ZnVuY3Rpb25zCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0L2xvZy8/aD1tdGQvbmV4dAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
