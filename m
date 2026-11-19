Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F114D606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qR1SANsJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B4cYlQmY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7R1uFBPe9CnGLisozNGrN38n7xobc5i07D5pmh6q46s=; b=qR1SANsJYnDthgHXwBV5LBN/6x
	E49X1pQejLuSUxB4+q6tEAD20+r4TLjZqM5nHJ2QGCTCDZ05/XiUIUec3CQ2rV3GTnpH0Nl1NPpfb
	NejOrLpfqxTUAUnPZ7noC/PbZfjyoeJmV8w2KvdRS6FuEBsWzKYiEkm0kYINu8PCHWzSjvmsMjGnB
	+qXdWulkM/hLSqIpkjpX80tiKnQwTOfVrkxP9pCsQIDlNcjrmUL9VqlgLBR+zCn0A9R+qa5j6VDbH
	1/2egwkADMsZGmnTLAV3O3AEsT7nq8U6iN1nM6YEuJQm+dAj1AlATPtGZxHVvPzYdRTtKpJN7sI0a
	phgayf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzEQ-0000000BWzX-0Tub;
	Thu, 19 Nov 2026 10:19:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzEN-0000000BWyZ-1NaF
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 10:19:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5AEA9C4CBEF;
	Thu, 19 Nov 2026 10:19:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15FF260237;
	Thu, 19 Nov 2026 10:19:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30E9111BC0538;
	Thu, 19 Nov 2026 11:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795083535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=FeryVqud6dMZkNfn8zKXkiXJSGWxThktDfDZczQxMD4=;
	b=B4cYlQmYp/dw6yL3qQZzV7HRlK3dtJqO3Y7qwTTfEZC0XOGuazijPH6AcAEFK9pH2xlImG
	OQIHHyAoXtqULMw4mwWZ02I6/4LLhoFFFU6TDP+QMDG1VSad039YHc/yaFvlHt/iB1oeBD
	Bw96kcsNS4o2phBlg1UTGRhlkcN+Tv5XKJy72FB4sldIglGST5giRTvniJMKbWg9BPDkMs
	PN9gbzwdhwo+HqvqiVNOVXuxuf1XSEG1UVGPf82eubhHsTW5hzuoqwYbWfUequtYbmuqBB
	ARHo1LRbajyFROuC0D/9ZqnjVaqAZ+OpSY8nRMl1O2tg1j9radHQhjB5kSw+/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Gleixner <tglx@kernel.org>,  "Artem B.
 Bityuckiy" <dedekind@infradead.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
In-Reply-To: <CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
	(James Hilliard's message of "Thu, 19 Nov 2026 02:35:26 -0700")
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
	<87fqwyjwvk.fsf@bootlin.com>
	<CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
	<87ld6pfc75.fsf@bootlin.com>
	<CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 11:18:52 +0100
Message-ID: <87tslddsz7.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_021903_964748_107F884E 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


>> >> I would prefer if you could write your own commit logs, giving us more
>> >> confidence on the work that has been asked. You can use an LLM to
>> >> improve/enhance it obviously.
>> >
>> > To be honest I've never been great at writing commit messages in
>> > general and have gotten a lot more complaints about commit messages
>> > missing important details prior to using LLM's. I can barely tell the
>>
>> For me the code is getting better but the commit logs are unclear. Some
>> details which don't need (imo) to be written are there, and the big
>> picture is often missing or not clearly stated before the details.
>>
>> Don't get me wrong, using an LLM to refine/reword/reorganize is fine,
>> but letting the LLM write it entirely is not working well.
>
> I guess the issue is that I often don't have the best understanding
> of what the big picture that needs explanation in the commit messages
> is some of the time, if I did then I would then just instruct the LLM to
> make those edits whenever I review patches before sending them.
>
> I think I just don't have good intuition when it comes to predicting what is
> important to explain in commit messages.

I get it, but for someone submitting this many patches, that lack of
understanding is precisely the problem: delegating the wording to an LLM
when you don't know the rationale doesn't remove the cost, it just
shifts it onto others.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
