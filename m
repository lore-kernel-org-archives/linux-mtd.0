Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5A1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U6rETUFTWwoLOI5zA+ec0DkSiaeCImgSn9Y+pjB4ndM=; b=ocpyO/g2au1gJD
	QIK/ZopiWl2j4+G9M/Nn1qE91YBTrYqVYV+SwMhGUxJFYtJZPovup1FZFER/myBczCoQsgDQk7QDg
	tA7xTDq0R1xo9hNBap9NM/+1I5hCcWmxFemFnTN5pCIV4pKTzFH96LuCCbo80QWmpCtNMRXtx1j/A
	kTBQiw9bu5v6HA/dNKBM+JeMr8fl8h9yfB0OOKkWFDe9wywsVqdj0gKUy7xknLIjCA5kE6wllx+5Q
	L79FFqs5vdWvylMbhWB17JHOZ2AEuqL1ZHHX9N3HEz2SRbA+60g646+Z1hUc4b7rga5z8lL/06ZDg
	m2rRUIDifvtPEoVzhk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiby-0092B4-Kl; Mon, 13 Dec 2021 10:31:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwiPG-008x8l-5j
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 10:18:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t18so26064553wrg.11
 for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2021 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=LDYCcCtjwel9nUP69aAG7MiwAOgxmgNMH8mzNFN+0nk=;
 b=P8UdRb6w1thbFdPvNy9DlxrRnId18cCzL13fEj4nOp/gHJEpWZYWqEpz4BWsV1qtAT
 HCnqP6YpiIJS+6xaNp6gT2riGB0CGUBa3BQidlKJFYWCmaYik/rMphHX7LFfNE2bMdjW
 J22ivo+a3V5J88c/WPT8QbBDpJbKSjoMW1j0FNY8IofX67drlIMvHsd7BvYNUwjLed/z
 duR94qAzXDSpD7pNFtDQTHWXYj7RxXcvl+gKXwXS6wBQX7tvV7VD3Sc0CypQxU8JE0ZX
 M5PPPGUuzTT9+YrcbMUFjx9uY7HtNtk6IQDFv7z8qPrnMAv9iLZ0FU0drjQlffle1a0H
 kj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=LDYCcCtjwel9nUP69aAG7MiwAOgxmgNMH8mzNFN+0nk=;
 b=TlWbNwXswfTvsSjBUw42MBwUkKln/ua9qg9LbnWojgLOXxgRkoswOunsyYeBng2YHH
 iLmdc/avbsQvm6Bjhl2kjFHYxDpB0PmBWvBfFcmaeFlqupCbCBvODS/1DZLuWAtinMPP
 uU/N0SY1VRnb1TEdZ6Qf/skMiUOi8ovl2m38mdef4y4wWNprDq76rCucQ0Sw+cLXasnm
 0F4jQTe2EhZ2FTODMqfSly4BJsotA9G4J12+w3d+YdoAqrmjte/Sj8a8nNbDlVizgSs/
 jePFCPnIKEGEmFDITb07K7/xjLrTPfhe/zDPoWeYHvX8CLxV/G5EzQGqVyOASFxAyirq
 uaqw==
X-Gm-Message-State: AOAM530e5Q6IT+42Kzi2RFpzuhB2KxA4Cw/tbPVjH3l2cE4Z1AMQfm4U
 IyeQpZ+NIEVN+Frpwwgeqd6MIJZsBMDrqg==
X-Google-Smtp-Source: ABdhPJxsTttHCkAdq4axqRz4vhQamOggOYj/BmKBIkqDLVaDvlDK80blzxPyWlcdh/x8Uo4Mti1L2A==
X-Received: by 2002:a05:6000:18a5:: with SMTP id
 b5mr31792772wri.604.1639390684167; 
 Mon, 13 Dec 2021 02:18:04 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id ay29sm6676137wmb.44.2021.12.13.02.18.03
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:18:03 -0800 (PST)
Message-ID: <fb71fa47-a59f-9434-a16a-6b59da9e2646@smile.fr>
Date: Mon, 13 Dec 2021 11:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: linux-mtd@lists.infradead.org
From: Romain Naour <romain.naour@smile.fr>
Subject: GPMC omap nand using CS1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_021806_277275_92C39783 
X-CRM114-Status: UNSURE (   6.33  )
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

Hello,

I'm using an AM3505 cpu with two nand device, nand0 use CS0 and nand1 use CS1.

The nand0 is ok but nand1 is not detected.
I get "nand: No NAND device found"

Regarding the devicetree for nand1, I did something similar to omap3430-sdp.dts
where the nand is on CS1.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm/boot/dts/omap3430-sdp.dts?h=v5.15.6#n102

I'm not sure this dts actually works since in nand_base.c nand_detect() call
nand_reset(chip, 0) with cs = 0.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/mtd/nand/raw/nand_base.c?h=v5.15.6#n4945

It seems it was possible to use two nand on gpmc (kernel 3.16):

https://e2e.ti.com/support/processors-group/processors/f/processors-forum/343017/am335x-gpmc-with-two-nand-flash-in-device-tree

Best regards,
Romain

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
