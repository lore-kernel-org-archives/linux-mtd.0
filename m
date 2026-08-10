Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470EEC5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfZBkrzRvIpuw7gGy+8HHmVotb46wIzUWyAHcmMF1t4=; b=ScVQXBENrY8Obv
	vkDlvIAidLDo0UbQP/F1NGcLC/0BKFeEf04OoqCkkXR2qVSWpHyxKGU5W+P8TEy0RlVAL5LdhKN2i
	dUCVfcFOitp/ZUZbMhz6qS7h9LYODEtDYl7r4XhRqq4VelKX4eDAEpGpqNNzUeRQ12AWzbSKhddab
	mKwe+ShhgjFSegUti6xAsf0VO+lnDsZmpyGfj7Yb+UXD1QD0uVfp/889AUviSu0Qzn4J3TU0NVCBG
	6dZq/DxDG0yeCJuI58YG/5ky51NFZSi/8ybpz7XSbj92GVfFxx/KXLmQpUcvTI06BlNDRP4KhngnS
	3RfRg57g2Hx0bBDWuDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSqM-0000000COBX-3uEq;
	Mon, 10 Aug 2026 16:27:18 +0000
Received: from mx01.bremer-it.com ([85.215.132.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSqJ-0000000CO9v-1wSM
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 16:27:17 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id 36C262CEED;
	Mon, 10 Aug 2026 18:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1786379230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LO13ef2TxdO/styNqou6d7A1gNqNOKIeD9RlfWxP/ic=;
	b=ij4wMgzBD8dgGbE7KRAuQge0Q64I8oSLDT/+ZNmU3Hk4e6RKEZ3FePoPdqLLHWxMHcP+QH
	juBF/MlYTPVzh4r+vg2dxcg3m+r6wTKI0yRi88aMwgoQmJlQ4IG8MArwmaJ4jC7Q6Z8Ltq
	A8HxUpaBO8lSsHkH3JS3AfP3uYZAEEpGePnzJ6peyDonRQFFyXVAIphwJVKxdRPpHr5geX
	DXzZLAsPE7ALDJVTId0M17ryNfBDS4MtzREP9n9yOfkpBP1m1gJK1r24+z3aKWTJIHMwA7
	fiNbg0kzQRFJqtwGkYpsvQMNy2CtP/sKB2oEGslf4gnFiXZGfYGbrAyr4ZfPQg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Mon, 10 Aug 2026 09:27:03 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com, richard@nod.at,
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com,
	Fabian Frederick <fabf@skynet.be>
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
Message-ID: <ann719YIqopUBCv5@cashel.logfs.org>
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
 <ankxaiwtTltL0xMj@cashel.logfs.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ankxaiwtTltL0xMj@cashel.logfs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[b320a4d5f65a61dbbf89];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: 36C262CEED
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_092715_647166_E35A5D77 
X-CRM114-Status: UNSURE (   7.41  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 09, 2026 at 07:03:22PM -0700, J=F6rn Engel wrote:
> =

> Best guess would be this:
> =

> 	if ((long)size % erase_size) {

While at it, what purpose does the cast to (long) serve?

As far as I can see, it is useless and should be removed.  Fabian, do
you remember why it was necessary?

J=F6rn

--
The real voyage of discovery consists not in seeking new landscapes,
but in having new eyes.
-- Marcel Proust

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
