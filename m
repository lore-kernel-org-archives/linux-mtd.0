Return-Path: <SRS0=grO6=X2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9880C352AA
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2019 14:47:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E89220815
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2019 14:47:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yp0zu/lX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E89220815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolf-entwicklungen.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:To:From:Subject:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SM7f6f5YrQaUDyN0kbljUfrb3+6gpJ24TJH8Xvk2oV0=; b=Yp0
	zu/lXmgdsCsfj3XcBp+eEaBTB7WveOy8hs4ouBiNYbCST9AYPWbch8niW3A6VRxu5lRBwec8pecHd
	tKQgjAVn7DxbNgiyd54mSKAtyyurlTUYBgEw17xauCw1Z7PTlkJiz7ddC9x3uEFXHpZf+EbODxWFA
	XAjSuim66yDt1W5hFAJ/5+/QUefCyVCx23RiY+Jl8pYwfIkh4fgZsXskhzMeVydZwVn7g7rtmkTx4
	/JmyQ4ArFxbuPGj3vXx2tqu2OsrugajRA/yCLZH1nUrD+E5IU8n6Ipyc4iHQEEQaDy0CbWwBi1BRn
	RMywqYVwbfNgP0jqTq5e5AG0hiNcAsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFJQs-0007Xz-L5; Tue, 01 Oct 2019 14:47:18 +0000
Received: from dd39320.kasserver.com ([85.13.155.146])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFJQl-0007OP-Cv
 for linux-mtd@lists.infradead.org; Tue, 01 Oct 2019 14:47:13 +0000
Received: from dd39320.kasserver.com (dd0802.kasserver.com [85.13.143.1])
 by dd39320.kasserver.com (Postfix) with ESMTPSA id EC8242CE001D
 for <linux-mtd@lists.infradead.org>; Tue,  1 Oct 2019 16:36:59 +0200 (CEST)
MIME-Version: 1.0
X-SenderIP: 24.134.118.173
User-Agent: ALL-INKL Webmail 2.11
Subject: return value of ubinize
From: marcus.wolf@wolf-entwicklungen.de
To: linux-mtd@lists.infradead.org
Message-Id: <20191001143659.EC8242CE001D@dd39320.kasserver.com>
Date: Tue,  1 Oct 2019 16:36:59 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_074711_638743_70D49C59 
X-CRM114-Status: UNSURE (   1.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello everybody,


while using ubinize in a script, I observed return value "0" on error:


marcus@debian:~/kernel/linux-os-build-all$ /usr/sbin/ubinize -vv -o blub.ub=
i -m 2048 -p 128KiB blub
ubinize: LEB size:                  126976
ubinize: PEB size:                  131072
ubinize: min. I/O size:             2048
ubinize: sub-page size:             2048
ubinize: VID offset:                2048
ubinize: data offset:               4096
ubinize: UBI image sequence number: 2119018939
iniparser: cannot open blub
ubinize: error!: cannot load the input ini file "blub"
marcus@debian:~/kernel/linux-os-build-all$ echo $?
0

I would expect non-0.

Hope this information ist interesting for someone.

Cheers,

Marcus Wolf

Wolf-Entwicklungen
Helene-Lange-Weg 23
80637 M=FCnchen


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
