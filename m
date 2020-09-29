Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B557FC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 14:06:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB01F20848
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 14:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jC/f/UQm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dZjDvT73";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u3Wa61C4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB01F20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H1NHd7SWCTD80QF5iUbxNeArtS03Q/PoQdlwR/2g8ec=; b=jC/f/UQmWBgBbnsADC37cNkY8
	nH1SeCj2WtZzq2MlgykYTssKfKM/deAdi+o0Gtx5KGQhy5vx0HdCYd+7kR8sEdJOVtxKXVaA706J9
	vEE/md9ybZPgejqp+ocFE2FGbReblKbf7pkPk+5Tll/0zf0ujmh8q5D/TfDW/DX3KsmxWayyMZ0G7
	w1S1SYvSRUsXK4c7mytlCacg4Ni1gUyHxuI9WrTnzKsSbCHq8Pe81dY6p1wy37rCOSe+i+Jqnk6em
	KfRv2ZXsCIbc1iqCWiv9pz/CnhW7IaXuUmHJQkUUgiT9B/31hrcqVLYtMsZd4wepMqvVtLGuSavQR
	5VN4xLJOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNGFo-0004YK-1r; Tue, 29 Sep 2020 14:05:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNGFg-0004St-Dn
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 14:05:09 +0000
Subject: Re: [PATCH] mkfs.ubifs: remove OPENSSL_no_config()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601388303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkWQud+sCE1ggZY4uXbikC4LsSnCVQoNOZ+Srofl/N8=;
 b=dZjDvT73nvaY6+j/6PGiI+L5d5UM9TDsrSHqtXx2Hjgusaxxi3y8xYZA7vAODTnc0nHufW
 lVK8vsTsVYDu3N2B2XnhC+q9JMmUhy0kc6K/70duwcRAXONoOYACF2JV9toXO5jojbsbQk
 dJgICBmwMm6F/hOZBJv2+2w2Yp/yABX0ulb78A4hMNNbizLD9IKhkRAy/hML/qeAvfXZgg
 eoR8EnLbmrDUCojoyHbvrgDVr0vkz1ykKAzu0Q5BH/lrgJ1hXL92SudgfLI/Lm4Vdr9Rbj
 rZq4FWPYkFhdS+IZTRfXeYpkkOrdCkacvsCiZKapjuaTwOoOavlklemXitlu6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601388303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkWQud+sCE1ggZY4uXbikC4LsSnCVQoNOZ+Srofl/N8=;
 b=u3Wa61C4V3+D+T9L4pJ3spPyJoEByHU6cqVox+iW8rEAB6w1cormSoEB4/dyobBXO5bLX9
 DOm6snAxAzS2vIAg==
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <20200724074705.6376-1-bage@linutronix.de>
 <CAFLxGvxwB3Lq6mnTBFyZ4aR+LPS5hwGPCwG+QqLssuT7FRBy_g@mail.gmail.com>
 <64f36cbd-9ab5-1b37-c4b3-c33b5daf6df8@linutronix.de>
 <1bb381ec-1f5f-3844-d904-7dd2af58577d@sigma-star.at>
From: Bastian Germann <bage@linutronix.de>
Message-ID: <5efdb785-cd31-1bb1-b1cb-9d213b4d622f@linutronix.de>
Date: Tue, 29 Sep 2020 16:05:03 +0200
MIME-Version: 1.0
In-Reply-To: <1bb381ec-1f5f-3844-d904-7dd2af58577d@sigma-star.at>
Content-Language: de-DE-frami
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_100508_582290_FFDCA6C4 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 25.09.20 um 05:15 schrieb David Oberhollenzer:
> On 9/24/20 6:40 PM, Bastian Germann wrote:
>> Am 25.07.20 um 10:24 schrieb Richard Weinberger:
>>> On Fri, Jul 24, 2020 at 10:00 AM <bage@linutronix.de> wrote:
>>>>
>>>> From: Torben Hohn <torben.hohn@linutronix.de>
>>>>
>>>> Especially for the pkcs11 engine, a configuration is required
>>>> because the provider has to be configured.
>>>>
>>>> Its not clear why OPENSSL_no_config() is called.
>>>
>>> My best guess is because on old openssl versions it used to work.
>>>
>>>> Remove OPENSSL_no_config() and call OPENSSL_config(NULL)
>>>> instead.
>>>
>>> David, can you please check whether this change works with all openssl versions
>>> we want to support?
>>>
>>
>> Are there any news on this?
>>
> 
> Sorry for the delay. I did some research on this in August but being busy at
> the time eventually forgot about the thread.
> 
> The latest changes that I found in the change log dated back to OpenSSL 0.9.7.
> Walking through the git log for the implementation seems to confirm that.
> 
> However, recent man pages say, that the OPENSSL_config functions are deprecated
> since OpenSSL 1.1.0 and OPENSSL_init_crypto should be used now, so the patch
> might require an extra #if for newer OpenSSL versions.
> 

That would be another patch but does not invalidate this one. mtd-utils
also uses other functions which are deprecated in OpenSSL >= 1.1.0:

OPENSSL_no_config
OpenSSL_add_all_digests
OpenSSL_add_all_algorithms
EVP_cleanup
ERR_free_strings
ERR_load_crypto_strings

You can yield this list via compiling with -DOPENSSL_API_COMPAT=0x10100000L.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
