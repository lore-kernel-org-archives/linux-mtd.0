Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775FDC5AC67
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 02:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1N9+G+8mZ8rMOGKTFat11kINyWj6Rjx1doZR5HMCdc=; b=ykuFGCnHcMA29L
	+BP6OWbelvyIi/EGEEjDTLYnPoHDkrqn9nXgbdMNB0dpVV1wdz9htGAqq6rP3wP/c9uZWkd/VJgET
	q3rkXft/ebLSHmiINWEJGN86DAJtKa4UmfWGitZJeC8O1YeCcIu7QDiSvMNmHCgNLF2l3/31pq+0A
	3Cev+hlGTb6ICOxbVjj92nZ1WeXrWFHaR6Z3DwHh6ZynfXGSD0ne3Qzpl9NRvKIpb54YRo0KKovCy
	kVn0FhMFfdoAYmHfO5Ye3J1Dxf91asbJ51vZnBcxcGkUdQ4aOPTLqTif/x3VNcDWUtRf64Pp93PBr
	AWPvndejUo9K9Ic26J4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz3x-0000000FJNT-1fz6;
	Wed, 12 Aug 2026 02:51:29 +0000
Received: from mx01.bremer-it.com ([85.215.132.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz3q-0000000FJMR-1ycG
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 02:51:25 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id BB9C620A1A;
	Wed, 12 Aug 2026 04:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1786503077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJkPPBKcOCIwqgQ9LIOTikQ9Hgg53r3zpncF6wkuUd8=;
	b=crGUCm0LWkdMD8bhdTmW3PM3zHj/eHGpSEVtDzXzT89kQH43nHBzj4UiyalJL3L5Zw8l4A
	gWqrJKEEAnyaV97hUAPqRSeRJe0J82U4ssupZpQVUTtTNOXV9A6BnnvRpHpf/cM0IuDtvS
	SZfvcuLYMwzEuztWem6wUnQiJ2hooQIjybEbUBGdb0mOHtO6PEPv9B78SMGgKglJq4TM+I
	mXOTUTAtq0b4yaTgxl+liCG+ZQIv4NaRpxOBaGHl8I/wZRFfQznVnsWFVeHKq0yJcUqUfH
	OGF8xZJV+LiRvdL70bBahME8CnOcObZ4Qjxr/jQNMwoXMnjMmqA+HzKHgo2NQg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Tue, 11 Aug 2026 19:51:09 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>,
	joern@lazybastard.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, richard@nod.at,
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
Message-ID: <anvfndFgcs1g52gQ@cashel.logfs.org>
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
 <ankxaiwtTltL0xMj@cashel.logfs.org>
 <29397db9-7db4-4969-bb0e-5bb71f0c0303@kylinos.cn>
 <87se4mqhc3.fsf@bootlin.com>
 <bbbff0ba-09c4-49dc-9aac-371c0c7d6902@kylinos.cn>
 <antnynHuZ2W8JmCc@cashel.logfs.org>
 <29b0eb3f-8d9f-47ba-b0bd-c605a411c0ec@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29b0eb3f-8d9f-47ba-b0bd-c605a411c0ec@kylinos.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.42 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_SPAM(0.02)[50.87%];
	TAGGED_RCPT(0.00)[b320a4d5f65a61dbbf89];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	FROM_EQ_ENVFROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	URIBL_BLOCKED(0.00)[barelysecure.org:from_mime,barelysecure.org:from_smtp];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: BB9C620A1A
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_195122_904402_9544D198 
X-CRM114-Status: UNSURE (   7.87  )
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

On Wed, Aug 12, 2026 at 09:45:44AM +0800, Pei Xiao wrote:
>
> Great test! You're truly professional, and I've learned a lot. I'll send
> the v2 patch. Thank you for your guidance.

The test was actually a failure of sorts. :)

Actual idea was some kind of fuzzing.  Up to 32bit, computers can test
every possibility in a few seconds.  The number space here is 96bit,
which is a bit much.  But we can still test 4B random combinations or
exhaustively test some subset that is equivalent to about 4B
combinations.

While this is not a mathematical proof, a little bit of brute force is
generally quite cheap and catches the vast majority of bugs.  In this
case, the compiler refused to even generate a brute force test.  So I
guess that gave us something similar to a mathematical proof.

J=F6rn

--
The rabbit runs faster than the fox, because the rabbit is running for
his life while the fox is only running for his dinner.
-- Aesop

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
