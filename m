Return-Path: <SRS0=FYfc=VZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EA4C7618F
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 21:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C012070D
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 21:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eBaIoDF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C012070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/f/2DFvagWCbJQ8xJ2rmJFRWK/AMbtVwrNHkB+xGSE=; b=eBaIoDF4zTZ6a1
	MXbXtM4yPyTKiyclrGTmWJqgEIOIZ0xH/le3XyPmlz7KGkQqVWwh1wFlNxsv6E39ZnkucE+Db6Zaq
	tBpX66UIUySEulW1peL84ckj2aQNvdG+kgZVft5TpsylTaYpUBNDmSsrgfwG+Oi8MRqxB7SO4yWFB
	sPoEQHa4WG33EfhGphV/NpoagUEoiofp7/MRj4LwJTIgha/A1tiW/ejTjrIV3CjWZ6Z8JtrrWn4/R
	dAQR27wHkO1LcZPf5oO80on5Q35CYpIUCIn1qEHuc4gJhiziwxYWMztRpFnmkipd00G6ax8xmlhyh
	D8OdsMgq3rIDLZXpES8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrqcp-00071M-8e; Sun, 28 Jul 2019 21:22:39 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrqcl-000713-SO
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2019 21:22:37 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SLMSdP012995
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 17:22:29 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id F22684202F5; Sun, 28 Jul 2019 17:22:26 -0400 (EDT)
Date: Sun, 28 Jul 2019 17:22:26 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v7 11/16] fscrypt: allow unprivileged users to add/remove
 keys for v2 policies
Message-ID: <20190728212226.GL6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-12-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-12-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_142236_087336_24F90F59 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 03:41:36PM -0700, Eric Biggers wrote:
> diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
> index 56e085c2ed8c6..307533d4d7c51 100644
> --- a/fs/crypto/keyring.c
> +++ b/fs/crypto/keyring.c
> +		if (mk->mk_users->keys.nr_leaves_on_tree != 0) {
> +			/*
> +			 * Other users have still added the key too.  We removed
> +			 * the current user's usage of the key if there was one,
> +			 * but we still can't remove the key itself.
> +			 */
> +			err = -EUSERS;
> +			up_write(&key->sem);
> +			goto out_put_key;

I commented about this on an earlier patch, but I'm not convinced we
should be returning EUSERS here.  Returning success might be a better
choice.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
