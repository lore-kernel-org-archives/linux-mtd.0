Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF19C46CD2
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jan 2024 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:From:References:To:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BflWof1SX+d+/IHCoPJ5QwcOhjglNpcWFs5Zc/Uu8j4=; b=YDrIyJ6bnaBO5p
	kTTvKSbS2c1dWhe7vnR9+1lD4GcB9dQHAN2/y+zigFk4ijhNHBHQkADp9kenVFzDSauDSRC3J4GY+
	ZPVqne7m9Ob8bjmN+nEEcnYy/dA09mNlzcSAgjCjqQwSWPOneNoxckE1c9p8E87o8GNuP0eMO450s
	WdScvAdkIEKObGnDGDEXaApoQa+K1MnVmbSIWQsw7r1cr/zF8roMOWtM7+cd9af0EZ/+UDJCZGnhB
	VJQ5Mo7XqXFXzreJ3mg/sQ0r2yjTKk6IK03PUQnN0iygnkIP+ZDU7jFPeQvbpJmpgjl4PexKD4dJl
	clwGRV+KHLJu4juqsTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rM7wx-001SM4-36;
	Sat, 06 Jan 2024 14:46:59 +0000
Received: from mailserv1.kapsi.fi ([2001:67c:1be8::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rM7ws-001SLZ-2h
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jan 2024 14:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Cc:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hcZ0gqw5aA8V63ozgypLt5AC7yZvXFuVB7do5VX+kmc=; b=LUNvFJSnwC3WHaxzqSvFflxWp5
	r9HqRE6fBSZolyWHqknHxH2g5S3dqRcLL4A+3qZSq077w0zn/BnAKknQhca1jeiC+s8R2AjBbLV7X
	iMRXZVWkZWZdGN6iP24Bj0kVAX4K/VmBJKhQNIXO955IJsKpB3x4qH++C3kZeBoG04IWbR+Whwshf
	Samy5yNLxLhQPdv5p8nJMI9hiOfbdcwN+gRhrgrEI3yEM24Wx0OWAeBoDtIdD5kPiPa1AncicISAi
	phvjLUv2eLphj6ISY7CEMaLvncKgAm3NoFMsKK7xiwPWNhRtz4zdvyxHrVHPpLuGyw66tHtafllab
	tWWyEugg==;
Received: from 89-166-32-214.bb.dnainternet.fi ([89.166.32.214]:65120 helo=[192.168.3.116])
	by mailserv1.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1rM7wB-006z2M-1r;
	Sat, 06 Jan 2024 16:46:11 +0200
Message-ID: <022816c4-7afd-4bd9-80a7-6bd5e9e0edd0@ext.kapsi.fi>
Date: Sat, 6 Jan 2024 16:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: maukka@ext.kapsi.fi,
 david oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
To: Richard Weinberger <richard@nod.at>
References: <20231229135653.4764-1-maukka@ext.kapsi.fi>
 <fbce5a93-c3b8-45f4-9698-c76838ac5fea@ext.kapsi.fi>
 <1214686551.202632.1704536161145.JavaMail.zimbra@nod.at>
Content-Language: en-GB
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <1214686551.202632.1704536161145.JavaMail.zimbra@nod.at>
X-SA-Exim-Connect-IP: 89.166.32.214
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [PATCH] mkfs.ubifs: Add option to minimize the amount of LEBs
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_064655_372870_1D12CFD8 
X-CRM114-Status: UNSURE (   7.95  )
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

Thanks for your propmpt response, Richard.

On 6.1.2024 12.16, Richard Weinberger wrote:
> But what will happen if somebody tries to
> use a minimized UBIFS in rw-mode?
> I fear then UBIFS will fail because it has not enough log LEBs or such?

First off I would assume it would mount the filesystem writable with
very little free space available. Here I am assuming the mininum LEB
count mkfs.ubifs calculates is legit and that the same goes for the
journal and log sizes.

Also, my current understanding is that the LEB calculation is based on
uncompressed size. If ubi uses compression runtime then the amount of
LEBs actually used is smaller, no?

I'll have to do some tests on the topic and see how it behaves. I'll get
back to you.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
