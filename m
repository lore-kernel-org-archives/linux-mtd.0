Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFC1CE7A89
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pCPE+PhGxxyP6oAX5Q3jjvJc5yXMriMC9piJCW21ChU=; b=GSSd9NfCpF3eQNEUbpIWByCtUY
	67XAqo5s4ffmk7AV6cegAA0Rwvxz5oYZGkhi0Qtus6sYcEqwsMoSGU1YC8TuRL7jvk4viPpwnljXf
	NnV9QWVsBmmfwtnSsW381CivjbT+LVdru5RJKi/xoEY3IOBFw0cDHWuFGJ6wdzF4qtG5wBaKzJz1u
	U9+xuBXia5/38m/ki3kug5BB0+1bBskCtFXF9oOMat4/xm2svBtV/HamOheCSZZF/w5LfkFy2vMGv
	GMeblDy5xMYQBKNxouy05ER/dd1WvL5UOyPhz+jiYceIfTtUWL2ZJoLaBinZPnlZUlbOLCq7HgEEm
	5848IKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh2U-00DkNM-0h;
	Mon, 25 Sep 2023 08:33:58 +0000
Received: from mail.robart.cc ([81.10.172.252] helo=srv-mta-01.robart.cc)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh2Q-00DkMF-32
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 08:33:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by srv-mta-01.robart.cc (Postfix) with ESMTP id F1C021C021F;
	Mon, 25 Sep 2023 10:33:47 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
	by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WjiWH3vBz9Ob; Mon, 25 Sep 2023 10:33:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by srv-mta-01.robart.cc (Postfix) with ESMTP id B88161C05C6;
	Mon, 25 Sep 2023 10:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc B88161C05C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
	s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1695630827;
	bh=SRAtlIqqxWJdG1nyagKNVWb9MoXYUnxZPSdENH6KcCg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=nBD0MN0GdMERMv6gjUF/QlVt3dJ/3MVbG8Cyz0q/Obj37y+ojBSku6xW3ErU+tEdi
	 ky8Xbr7PgaDrWCk5xjn4Tr6823ongYD3DoC4Q94DtaFqmuz3+nwgJf4bI1CzL28YJQ
	 Qx81HjVB7zqYXWlLBEks5khZOd/eXLp3xJA2t08XLw0FEF3JBP17hOAV/YztOs5We0
	 /TseweE4+rvkj/k5GSZ+YAtBg0DtP0jDBRRsAtaTNnfRYY/Jg9wjoASW4Tt++XG83B
	 YVpO8lOmvEmUu58FzP85EeZbGpd/V7H3ky3HliKBW8UEPyN/h/cut7iDmDn0Pk5qsP
	 tQ+lLdxuwaQBQ==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
	by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6imCyib6HQ-i; Mon, 25 Sep 2023 10:33:47 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.robart.cc [10.0.10.21])
	by srv-mta-01.robart.cc (Postfix) with ESMTP id 98DBB1C021F;
	Mon, 25 Sep 2023 10:33:47 +0200 (CEST)
Date: Mon, 25 Sep 2023 10:33:47 +0200 (CEST)
From: Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <6146269.2964451.1695630827563.JavaMail.zimbra@robart.cc>
In-Reply-To: <20230923032859.3857274-1-chengzhihao1@huawei.com>
References: <20230923032859.3857274-1-chengzhihao1@huawei.com>
Subject: Re: [EXT] [PATCH] ubifs: ubifs_link: Fix wrong name len calculating
 when UBIFS is encrypted
MIME-Version: 1.0
X-Originating-IP: [10.0.20.3]
X-Mailer: Zimbra 9.0.0_GA_4509 (ZimbraWebClient - FF118 (Linux)/9.0.0_GA_4509)
Thread-Topic: ubifs: ubifs_link: Fix wrong name len calculating when UBIFS is encrypted
Thread-Index: 78J2OQdFiyDRyQP5NPjVGStbIWWrHQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_013355_475129_FCEA23D6 
X-CRM114-Status: UNSURE (   5.27  )
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
Reply-To: Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Wow, thanks for the very fast response!

I will backport + test this with the current kernel I am using,
and maybe on upstream if its not too much work to get it going on the device I am using.

Running it over night always produced the corruption, so it should be a good test.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
