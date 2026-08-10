Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6079C5AD5A
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 02:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCB596MBoQ/rcc0heqW0dB0fFfpn2sep2z3JFnWzehM=; b=tDrDsakUakgz85
	aQc3qOs5uOu7I6cJf7p9jBVCJIaYgXvu4rxlwqJcdBtQLZjdj9mtpCQz4A3AKPUTsbdTyFemCoJJU
	i9zADDe62kHr6anMpqp0/GXMGpUf0omNY+OSY1Hubnn2nhCagQ3wLKKR5dBmxyEF9ojx5IKHt0qbn
	i3iAcRdVG+SILF3iN/FF8Saw4mqkh7halNBeHpbtm1BeikQAUT6YXgFhKf4ix+SVFxh4rjcPDNvvt
	9U9kDuk+wkdRnWJVjeo6uT1qsr2YfRvqbXa90EC9OXL9P0NqZxJ+BriWMAGpV5+DHSyWc85nwuLU7
	0yysjhaPDVZ+kGdRWNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFMj-0000000AtrS-43ca;
	Mon, 10 Aug 2026 02:03:49 +0000
Received: from mx01.bremer-it.com ([85.215.132.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFMg-0000000Atqg-2ubO
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 02:03:48 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id 061CA20B86;
	Mon, 10 Aug 2026 04:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1786327408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDIDTuliDDGgOAKpI245cMmyPRVVKxIWKH3GuXafqZA=;
	b=HAaxkQ/6AawUqio6ZtZxsW0LqcdaN10B/vRSFk0TcWRBU45jxR+oipsFDUbLTtUrltNgoq
	SUJTT9FHYYItqxPYvDw94jAGkuvJipWw3nalbM+Kl5az2K2VReh3w5eQsKr6sdoXp2TYzJ
	R/1QaEGzKjPtOIK5qoT0bvc6jV/0DL6pI9DWuc6O6DxxGrPYGtwZo2mUmQAuO9Qnm4Snbc
	xSJC10kazHhQLi5gnGRmMR3oz+JF66HhtQ+ApzYgkv3zty8o4P/Vk4Bj7YXV9UTiPwdcJq
	HVIfjaeb2e+Z+Q1K56IpiPILzHBRAYt0tcFSf+P7vSEEBvoUD2BFobn0ZIvA2Q==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Sun, 9 Aug 2026 19:03:22 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>
Cc: joern@lazybastard.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
	richard@nod.at, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
Message-ID: <ankxaiwtTltL0xMj@cashel.logfs.org>
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[b320a4d5f65a61dbbf89];
	RCVD_COUNT_ZERO(0.00)[0];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	URIBL_BLOCKED(0.00)[cashel.logfs.org:mid,cashel.logfs.org:helo];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: 061CA20B86
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_190347_209352_8FE0C036 
X-CRM114-Status: UNSURE (   7.25  )
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

On Sun, Aug 09, 2026 at 05:34:28PM -0700, syzbot wrote:
> =

> * 2a:	f7 f6                	div    %esi <-- trapping instruction

Best guess would be this:

	if ((long)size % erase_size) {

Someone passing an erase_size of 0 would indeed trigger an exception.
Fix would be something like this:

-	if ((long)size % erase_size) {
+	if (!erase_size || (long)size % erase_size) {

I haven't touched the code is nearly two decades.  If somebody else
feels like sending a patch and gathering all the glory, please be my
guest!

J=F6rn

--
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
