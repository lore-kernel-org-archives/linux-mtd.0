Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF64CCA468
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUXOQEB6RV/rqx/PVsxxuADkiWuvdFeonBoH1+YS3yY=; b=mepxrFt2b2qhBL
	+POLr1iMJ8wyd1/qTRxwXjffKFbq99E/S9Petje5wMX4Us8robuITdquOIfjdpt0tlgPtPCbMsJhM
	/cNQi80LzBPqwEiCXdHLZbLOYGrPwE2tdT32y2uFy2GvY0ZdcmHah2Y4IQI6rkN+hJUtcjSwsQsBX
	msaEI/NmbFZpRJ+8p7/wSsyj1Ja1tFnuOWMnStj922AwDdLHCCiIRCNReRpM+VMkwqaQwO7S0zfxo
	5G85n2uSBdYrvYYjTi1WSeDhN3NZfbP2yuYKIr6lb2PvDofe6SsZ3uyXAdTEf5C+CUKkDIDBmmyDh
	lna56/fhtwnB9otSPrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aSx-00000005PRE-1ulQ;
	Tue, 30 Sep 2025 13:32:27 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aSv-00000005PQ9-19eS
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 13:32:26 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1C101F83B;
	Tue, 30 Sep 2025 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1759239141;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Getj9FPGP+Bzf+xHlVzE0JepEsiLzYSmV09bhXiYYc=;
	b=nuFUKD1CYq3mTKKtqgyBgPKg0MVwK/5bUyIcBe57nupAzoexJH80GY286eDGMtYXtkzZLh
	Zrfm9m0yoEOwhBaIJHHY5Ci6bEXXuwxx/Q83UIFXFtIHb8TeFrCk3+HKsFQSLlUl+mmjfP
	BYAAT2/3dXr1IB05GIVdYatN3yexyMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1759239141;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Getj9FPGP+Bzf+xHlVzE0JepEsiLzYSmV09bhXiYYc=;
	b=ACxfrnUxl0GN76Oc7ofUgkni/+dUC7XTFaNWYMXz+O+5ULF5MNqfsxB8irEf4jE32o1Wv0
	xGs/b/4YTZgZnlCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1759239141;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Getj9FPGP+Bzf+xHlVzE0JepEsiLzYSmV09bhXiYYc=;
	b=nuFUKD1CYq3mTKKtqgyBgPKg0MVwK/5bUyIcBe57nupAzoexJH80GY286eDGMtYXtkzZLh
	Zrfm9m0yoEOwhBaIJHHY5Ci6bEXXuwxx/Q83UIFXFtIHb8TeFrCk3+HKsFQSLlUl+mmjfP
	BYAAT2/3dXr1IB05GIVdYatN3yexyMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1759239141;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Getj9FPGP+Bzf+xHlVzE0JepEsiLzYSmV09bhXiYYc=;
	b=ACxfrnUxl0GN76Oc7ofUgkni/+dUC7XTFaNWYMXz+O+5ULF5MNqfsxB8irEf4jE32o1Wv0
	xGs/b/4YTZgZnlCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 805961342D;
	Tue, 30 Sep 2025 13:32:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id me4xH+Xb22hRRQAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Tue, 30 Sep 2025 13:32:21 +0000
Date: Tue, 30 Sep 2025 15:32:20 +0200
From: David Sterba <dsterba@suse.cz>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Han Xu <han.xu@nxp.com>,
	"suman.kumar.chakraborty@intel.com" <suman.kumar.chakraborty@intel.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"terrelln@fb.com" <terrelln@fb.com>,
	"dsterba@suse.com" <dsterba@suse.com>,
	Richard Weinberger <richard@nod.at>,
	"chengzhihao1@huawei.com" <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH] crypto: zstd - Fix compression bug caused by truncation
Message-ID: <20250930133220.GB4052@suse.cz>
References: <GV1PR04MB9071B5AC95DBD48B67FACF44971BA@GV1PR04MB9071.eurprd04.prod.outlook.com>
 <aNuQAr79Hdky3WII@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNuQAr79Hdky3WII@gondor.apana.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_063225_467289_F44E160F 
X-CRM114-Status: GOOD (  21.26  )
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 30, 2025 at 04:08:34PM +0800, Herbert Xu wrote:
> On Mon, Sep 29, 2025 at 11:51:36PM +0000, Han Xu wrote:
> > Hi Suman,
> > 
> > The patch f5ad93ffb5411 "crypto: zstd - convert to acomp"
> > leads to the following kernel dump during UBIFS write back.
> 
> Thanks for the detailed report and instructions!
> 
> Please let me know if you still get the crash with this patch:
> 
> ---8<---
> Use size_t for the return value of zstd_compress_cctx as otherwise
> negative errors will be truncated to a positive value.
> 
> Reported-by: Han Xu <han.xu@nxp.com>
> Fixes: f5ad93ffb541 ("crypto: zstd - convert to acomp")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Reviewed-by: David Sterba <dsterba@suse.com>

> 
> diff --git a/crypto/zstd.c b/crypto/zstd.c
> index c2a19cb0879d..ac318d333b68 100644
> --- a/crypto/zstd.c
> +++ b/crypto/zstd.c
> @@ -83,7 +83,7 @@ static void zstd_exit(struct crypto_acomp *acomp_tfm)
>  static int zstd_compress_one(struct acomp_req *req, struct zstd_ctx *ctx,
>  			     const void *src, void *dst, unsigned int *dlen)
>  {
> -	unsigned int out_len;
> +	size_t out_len;
>  
>  	ctx->cctx = zstd_init_cctx(ctx->wksp, ctx->wksp_size);
>  	if (!ctx->cctx)
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
