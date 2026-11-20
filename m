Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438F606A331
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=reECyzoX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jCgXs8hG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PGVCZABNMELxMKZHaUvQ/Ir9yycKsjmSVrMXkTXAZ/0=; b=reECyzoX2D0GZtuJkOudhkSUq4
	J7VC5OvwZ0luFeMPhf4rLASl/XTme+2H4w6myXDto2oYFi8bcFEtDrgcbeJmSDmgeSXBXK71L2v34
	PQK+92E1BbMtV1cPu+q2hp8lfKYMif7pqUXyRbwyVV9PqZWzognkI/+B7/wpYE80oEZRbn3GQTe6S
	8JlLa5zyhQBJHvyY5R9fQSDBROMK/4qKf4FbJrN8PCHVXEKUSFQQNojePABhzm0rb4S6mSaRoD9GZ
	uR8sB6FlmNXe7BZyDXG9l+F2iienjnBdRKq++18Y9acVmJgviH7hD5TcF0dc7S4kZe/Cji5hQXPr5
	cStYLngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJvv-0000000EKYH-06J5;
	Fri, 20 Nov 2026 08:25:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJvl-0000000EKW2-00wR
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 08:25:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D913D1A1740
	for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 08:25:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B0D6017D;
	Fri, 20 Nov 2026 08:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D534611BC10CA;
	Fri, 20 Nov 2026 09:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795163108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VFrgg5jZYdLBp2CRTfMvRlGf8xonD5krWYoXoAMfpFQ=;
	b=jCgXs8hGnlyX3AMu1wnowxZy3tkSVgFBsnOQjmsCw+VmVY+tVRhNwf7FYdG1mR5Vum8s/9
	eZiHutJ9xwDdeAL0gCGBHez18Skg2W7uvsUnEmhvGbkPCQq0fGUoNBP+8iMw1Se6TZRhhp
	jJ5iWPmP0ca61D4O68btfV6rejgQn7oRXgvmLgZ4HRcyr4p08vujpk0RrtsUnuk953h32L
	+9FBw55aJKzAUDkxv2ymcIZ7uaBlgKpJCNUixI+r+Rj4SMahCbZs9zCLt/XyIMzOUwxnmr
	syZ0XUKwXUExg3fLCqgfGJS31jp0lDq6hHRddYwIHuYYRm1o5B5vOVtXgVoLoQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Edward Adam Davis" <eadavis@sina.com>,
  sashiko-reviews@lists.linux.dev,  joern@lazybastard.org,
  linux-mtd@lists.infradead.org,  richard@nod.at,
  syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com,
  syzkaller-bugs@googlegroups.com,  vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: Use I/O memory accessors when in an uncached
In-Reply-To: <sashiko-outbox-224492@kernel.org> (sashiko-bot@kernel.org's
	message of "Fri, 20 Nov 2026 05:35:32 +0000")
References: <sashiko-outbox-224471@kernel.org>
	<20261120052434.101613-1-eadavis@sina.com>
	<sashiko-outbox-224492@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 09:25:02 +0100
Message-ID: <87zev3c3kx.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_002513_443844_FE504E51 
X-CRM114-Status: UNSURE (   4.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRWR3YXJkLCAKCk9uIDIwLzExLzIwMjYgYXQgMDU6MzU6MzIgR01ULCBzYXNoaWtvLWJvdEBr
ZXJuZWwub3JnIHdyb3RlOgoKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNo
aWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbAo+IGlzc3VlcyB0byBjb25zaWRlcjoKPiAt
IFtIaWdoXSBtdGQ6IHBocmFtOiB1bmNhY2hlZCBpb3JlbWFwKCkgcG9pbnRlciBleHBvc2VkIHZp
YQo+ICAgcGhyYW1fcG9pbnQoKQo+IC0gW0xvd10gbXRkOiBwaHJhbTogaW5hY2N1cmF0ZSBGaXhl
cyB0cmFpbGVyIGFuZCB0cnVuY2F0ZWQgY29tbWl0Cj4gICBtZXNzYWdlCgpUaGVzZSBpc3N1ZXMg
bG9vayBwbGF1c2libGUsIEknbGwgbGV0IHlvdSBhbnN3ZXIgdGhlbS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
