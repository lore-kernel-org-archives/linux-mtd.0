Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3420CC001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAOKlNrPnCx+2M4xthJWLMdiaN+VSQV7tVuXad09lNg=; b=LIhuzb9VijnPv8
	XP3CrACpVeaerTnGrNRboYIAaSQoVIyuhpjKRTJiOBk1QbCSJKN5HMgMhV7EmJdmZ3nj735HpW9nA
	TqI3NvadP6UpRj9S9HPbpPG2PQxIlJjo5qDo/uNJfMh6hDxViJEBmCv096ndGun8HCw03sAVcp2Go
	+04wq/kI2uUnJ47A8ZcvyPyoS+eMfyUXwLcC9DDyrS7gwF1TNsZldpcT0WoupZCIW1tPyl8IgeCit
	wlqcdz0lym9xaziCJUE7rgzT/bCGtHH4/YWVWd7si/6Nw6FiKQhoi51yZ01r8OYzdnXp0sMquMdrR
	gGTynpmIulrccZQVZgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quwKO-007dHw-2q;
	Mon, 23 Oct 2023 14:54:48 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quwKK-007dGX-1J
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 14:54:46 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7B2DE120005;
	Mon, 23 Oct 2023 17:54:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7B2DE120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1698072874;
	bh=xOCUtAXX6+TUytIqANgyBYP5UyxgzoCas0tmcIMHWrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=KdtIlp3kcbU6tFd1fXLXPH4TD7crI4X98cmKMRMBTvTJZj6anIpI0+gjWKe10UmqE
	 /llSw9ox6ddLGfRLA2V1JWhgoZziCJlk7MGa1mtTxHEIFrIsYWcR/mzen5hx7X9VvS
	 PCdSEpfrF0m8TXmleHBFxPfaydbek6mDdpiqU4xsgVgbEaoehBXpSMSPdgEWU1V67T
	 YCzNtiug2JUam9xkpsBR9kDtxXlvNDpLAFzciMp2ixJIg+7ejTheXzi4hOY4E4iBHY
	 hqc8EDSM2L14FmJzmjuD1BpfwOhtCEYDY+rRSko8I4tbomhGou87yuOlImexFiCMjJ
	 //6cxudualiEg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 23 Oct 2023 17:54:34 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Mon, 23 Oct 2023 17:54:33 +0300
Message-ID: <3951ac21-a0a4-47b5-be94-edb0140c69a5@salutedevices.com>
Date: Mon, 23 Oct 2023 17:54:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] jffs2: make cleanmarker support option
To: Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, Christian Brauner
	<brauner@kernel.org>, Dave Chinner <dchinner@redhat.com>, Yu Zhe
	<yuzhe@nfschina.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
References: <20231019073838.17586-1-mmkurbanov@salutedevices.com>
 <20231019073838.17586-3-mmkurbanov@salutedevices.com>
 <1258129392.18842.1697703134703.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
In-Reply-To: <1258129392.18842.1697703134703.JavaMail.zimbra@nod.at>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180810 [Oct 23 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 542 542 3d23828e213bab96daa5e52f9cef518f74e40214, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/23 12:16:00 #22264656
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_075444_794646_9B93668B 
X-CRM114-Status: GOOD (  15.67  )
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

Hello Richard,

On 19.10.2023 11:12, Richard Weinberger wrote:
>> This patch support for disable cleanmarker option. This is useful on
>> some NAND devices which entire OOB area is protected by ECC. Problem
>> fires when JFFS2 driver writes cleanmarker to some page and later it
>> tries to write to this page - write will be done successfully, but after
>> that such page becomes unreadable due to invalid ECC codes. This occurs
>> because the second write necessitates an update to ECC, but it is
>> impossible to do it correctly without block erase.
> Hmm, I miss an explanation why this change is correct and safe.
> You explain why the OOB area can't be used, okay. But you need to
> add more details on why you change is safe in terms of filesystem
> consistency.
 
If you disable the cleanmarker, the found clean block (filled with 0xff)
will be erased again (see fs/jffs2/scan.c#L162).
In my opinion, it is better to perform the block erasure again than to
not work with such a nand flash at all.


> Beside of that, I don't think this should be kernel config option.
> Why not a mount option?

Agreed

-- 
Best Regards,
Martin Kurbanov

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
