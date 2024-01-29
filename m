Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D94C47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+4le14t5k1CJ+qpdwtF3gcFU+SFO53OF/iCEaj4IBU=; b=rpFC43oETw7khn
	lgdJY/H5zt4OgaUzGe8hrheXdvYa5RSiUSXC20e6Sofbh+d9TKVTrVAaJnHPkxcLxiRVOXv+oL3tv
	mOFZtBgmYVuibs71muAFbgGxLNSTW+UvJ8prxt+2kVo/FcZb+G9VpX4q7bSiJOWZdcfdAo5EQI6eq
	dKHAzino9PKTGrsVvpk96Ao2ew0Vnyaa1cPlr1NhNBAV961N7K3r3DGvtZbkbMaZo8ygY2Os3iaoO
	8q5GrF5jjIFaTD6E5yj8fXXb6IduKyme8wEjF72D9CT01I9VKogz5ARqkray7VEdreCRUv8qWc3ji
	M+BVTLGXcVkJnYfV/bqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURGN-0000000CkSI-32qm;
	Mon, 29 Jan 2024 13:01:23 +0000
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURGL-0000000CkRU-1ybk
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1706533281; x=1738069281;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=FoXKTMBcKJTeRFtsKImJ21zgq29ZECUOkGMc/QWE6nE=;
  b=qmFv2KCaruCIYxdhndyiP6SvwJYSNuPjP+I+xTetDeg6bezJnq0lsBT5
   7SUNr0UMAY0Gyr0nCwm654Qn0C8p6SZfwbIUHXIaQeaVv1rxUkA4npW/h
   nYUgJ75T9gMS7vKW062nG124Q4s7hGIZAGHxNQBIV4Vr5NGpVsuAeh7lV
   s=;
X-IronPort-AV: E=Sophos;i="6.05,227,1701129600"; 
   d="scan'208";a="634192703"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-8a14c045.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 13:01:13 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
	by email-inbound-relay-pdx-2a-m6i4x-8a14c045.us-west-2.amazon.com (Postfix) with ESMTPS id 2366580475;
	Mon, 29 Jan 2024 13:01:12 +0000 (UTC)
Received: from EX19MTAUWB002.ant.amazon.com [10.0.7.35:39020]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.123:2525] with esmtp (Farcaster)
 id 5ac17632-af60-4b82-a785-578a2f68b31f; Mon, 29 Jan 2024 13:01:11 +0000 (UTC)
X-Farcaster-Flow-ID: 5ac17632-af60-4b82-a785-578a2f68b31f
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 13:01:11 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 13:01:11 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 0E7D020D2D; Mon, 29 Jan 2024 14:01:11 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: liao jaime <jaimeliao.tw@gmail.com>
CC: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <leoyu@mxic.com.tw>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
In-Reply-To: <CAAQoYRmYxmD8v20_Q=YShj_xv1vsV7fXnAGPYPBSP=XJmoG2-Q@mail.gmail.com>
 (liao
	jaime's message of "Wed, 13 Dec 2023 10:37:33 +0800")
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
	<f015ef75d6bb0a9f8edba37b40affb60@walle.cc>
	<CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
	<e08b45ea59a0ba96de99a42ddf7b6769@walle.cc>
	<CAAQoYRmYxmD8v20_Q=YShj_xv1vsV7fXnAGPYPBSP=XJmoG2-Q@mail.gmail.com>
Date: Mon, 29 Jan 2024 14:01:11 +0100
Message-ID: <mafs0frygtht4.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_050121_714234_7B3D34E0 
X-CRM114-Status: GOOD (  26.15  )
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

Hi,

On Wed, Dec 13 2023, liao jaime wrote:

> Hi Michael
>
>
>>
>> Hi,
>>
>> >> > Some flashes contains 8D_8D_8D information in SFDP but did not enter
>> >> > octal DTR mode if conditions are not satisfied.
>> >>
>> >> What exactly are these conditions? Rather than "abort" the octal mode,
>> >> the flash shouldn't have that capability in the first place.
>> > "Abort" is not a good word.
>> > Is it better for using "discard"?
>> > 3 conditions should be satisfied before enable octal dtr mode.
>> > 1. function hook in nor->params->set_octal_dtr
>> > 2. nor->read_proto and nor->write_proto are SNOR_PROTO_8_8_8_DTR
>> > 3. nor->flags & SNOR_F_IO_MODE_EN_VOLATILE
>> > Flash driver still bring 8D_8D_8D protocol instructions in 1s-1s-1s
>> > mode if
>> > conditions are not satisfied.
>> > In a case, flash ID didn't include in vendor's ID table.
>> > It will be "spi-nor-generic".
>> > 8D-8D-8D information could be parsed in SFDP but
>> > nor->params->set_octal_dtr
>> > didn't hook vendor specific function for enabling octal dtr mode.
>> > So that it still bring 8D protocol in 1s-1s-1s mode and have no chance
>> > to select 1-1-8 protocol.
>> > I think it may better to re-select a suitable protocol for this case.
>>
>> Just that we are on the same page. You are using the spi-nor-generic
>> driver, but that driver will elect the 8d8d8d protocol but that won't
>> work, because we don't have a .set_octal_dtr. Therefore, the fallback
>> is 1s1s1s. Correct?
> Yes.
> Based on my understanding, typically, flash that support the 1-1-8 feature
> also tends to support 8D-8D-8D feature.
> However, in the case of spi-nor-generic, we don't have a .set_octal_dtr.
> Therefore, I believe that if octal DTR mode cannot be enabled due to
> this, it might be necessary to reconsider and choose a suitable feature.

Can't you parse the SCCR to learn how to enable 8D-8D-8D mode for
generic flash drivers? That way you can set octal_enable() for generic
flashes as well.

To be clear, I still think you should implement Michael's suggestions
about masking out SNOR_HWCAPS_8_8_8. This is an enhancement that you can
add on top to enable Octal DTR for generic flashes via SFDP. You seem to
have a flash capable of doing that so might as well enable its full
powers.

[...]

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
