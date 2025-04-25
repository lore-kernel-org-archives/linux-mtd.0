Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD442C369C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lwO+rFRPc0/RYBh/EbpakyqGlIgaHCJif0J9nPeRLs=; b=qEOHaTkseGZlNT
	AUHAZcpSWEhlaNPNwa272sv+C1Y96HTIRHM2pEdSsmdadyGbsjyN4kNyJ/OG97lCvhY5DdbYFWNff
	phWEYKrSxQ876NumSneEE5TGNolXIaxj1rtwD2XPGTTS7y2NFZEWtrKIu6VtFFVyagIOwV5Qc0Ywi
	SuNwg663Tj8cKT7BsASK/NJth+fd+YRcEsLUVTS+iV0U0OzZCcDcNtk11qoQRFA5g+c4va8iHMRON
	hBFkmhsaPjoygDDVd+CR6ny26xpTeEEGLMCAhuCbCecJkX0/taG6+lrzpNypEP2KL4Ti4YBfgSggW
	rRGha7VgfHz1+n9adWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IsG-0000000HEde-2lMC;
	Fri, 25 Apr 2025 13:13:48 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HuK-0000000H4jz-1BrA
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 12:11:54 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8ED622540202;
	Fri, 25 Apr 2025 08:11:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 25 Apr 2025 08:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1745583108; x=
	1745669508; bh=EB/sg/VgUNtrfCqfzNTqoSG/O7x/uW7lya+Nhl3Jdqo=; b=Z
	AkWblRTxeLrtZL4lsbHJBVc2FQyyO8F5wSZgMYj7q1amHSUMvgmdcyEvQ0C8zlUM
	Ym2iGmY4NEHN2R5T5rEc+W2lcx4pRqZdX1yCYzHzUUIm4I9T82QGbt5w4DxggNZP
	cm9deS7r22Pyf2xNG8dxMHeaTxSsYqb/ckRWHnxhe5U8MITEdkNKxJBXQgsOUBAx
	GIqKFy0aDZudSiGM8qD8I+6kU0IPEdeeaY/fqN8zwfZca61ICLLkOX412w5I/aHA
	hBTgM0zbg9zQl1ZrhYTiUn8lSNdvzEt/Dq44gceehCCi5r/Sdwf0eEZhgEjUnX8a
	OD2zLt5UlctDAt0n/HTsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1745583108; x=1745669508; bh=EB/sg/VgUNtrfCqfzNTqoSG/O7x/uW7lya+
	Nhl3Jdqo=; b=KeQvJ6PtaInmK6r+lAsb2Uir6eNKSJP73Vcb92/tLIwqTvODuRh
	bbgqcF4t0mm/TI8SMXls4mMrfbSJl6HqD8sQ7i5U1j7w5YFE+CRtS353uU1ByOyx
	5v97UGKKpFPRLDmVSc65LTjuHv3qMOh+dMJmGt9EP8k6TTua90f1qkW0a8IOIbMe
	lmPkQIUyI1v83xt2m9DUcmbiLxkJTD1180Kfs+Jmo7iN6KTPgZL2qqsW/DlCtHW9
	f5ZYKr86GXjOo00LVb4I2q5AwAV7y7ihEIoDt8Tx0fUe3Fa2Dw06zVh4W4vB+qG/
	zBikZxIi2t+Xm6bv3hDNNQkcKYeZW9dIueg==
X-ME-Sender: <xms:A3wLaEialxA_l_fysmZHryF4fDebLkiMD8kaIQizLEXMKW6e_OiQow>
    <xme:A3wLaNB8fzc0JBBamWUWL3tTnc4E5etbeFca-XxU1BKEx3KaArArirXuU7WR6gW-Y
    q4QpZQDYjZgBn9amrk>
X-ME-Received: <xmr:A3wLaMFci5J-y-AKyghueCGS3s05O47r8dxM9mV7vTtvYSk4MwKgOnzgfmxn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    jeenucfhrhhomhepufgrsghrihhnrgcuffhusghrohgtrgcuoehsugesqhhuvggrshihsh
    hnrghilhdrnhgvtheqnecuggftrfgrthhtvghrnhepuefhhfffgfffhfefueeiudegtdef
    hfekgeetheegheeifffguedvuefffefgudffnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgusehquhgvrghshihsnhgrihhlrdhnvghtpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgvrh
    gsvghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehlihhn
    uhigqdgtrhihphhtohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrih
    gthhgrrhgusehnohgurdgrthdprhgtphhtthhopegthhgvnhhgiihhihhhrghoudeshhhu
    rgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgrvhgvlhesuhgtfidrtgiipdhrtghpthhtoheplhhinhhugidqph
    hmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtvghffhgvnhdrkhhl
    rghsshgvrhhtsehsvggtuhhnvghtrdgtohhm
X-ME-Proxy: <xmx:A3wLaFRQe7_guGjIwgkZymX2ZHd4S5z9BR4_hu7TXBEwNaOfcpPXZg>
    <xmx:A3wLaBxwYHM1NMGFrVSv-o4fcyyChZVMb6OCsmZ4w9o7RHEv1Liv6g>
    <xmx:A3wLaD6Af-espcLvZj-OjQF2WhxwdJNc1vJVrrzkS8tL_2O1onIcMw>
    <xmx:A3wLaOzfRo6hNLYY4qWOotzFSj6yWMVw--gedv7_a0t8b3t07HW1nA>
    <xmx:BHwLaP7eu4lWYrHeZg_N_X7zSzUkCuNnUJ_g2mKpOuSEqwSza19zu1Wd>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Apr 2025 08:11:46 -0400 (EDT)
Date: Fri, 25 Apr 2025 14:11:44 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v5 PATCH 11/14] xfrm: ipcomp: Use crypto_acomp interface
Message-ID: <aAt8AIiFWZZwgCyj@krikkit>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
 <d7bccafdf38259c2b820be79763f66bfaad1497e.1742034499.git.herbert@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7bccafdf38259c2b820be79763f66bfaad1497e.1742034499.git.herbert@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051153_244033_6E5E32D6 
X-CRM114-Status: GOOD (  10.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Herbert,

2025-03-15, 18:30:43 +0800, Herbert Xu wrote:
> +static int ipcomp_post_acomp(struct sk_buff *skb, int err, int hlen)
> +{
> +	struct acomp_req *req = ipcomp_cb(skb)->req;
> +	struct ipcomp_req_extra *extra;
> +	const int plen = skb->data_len;
> +	struct scatterlist *dsg;
> +	int len, dlen;
>  
> -	len = dlen - plen;
> -	if (len > skb_tailroom(skb))
> -		len = skb_tailroom(skb);
> +	if (unlikely(err))
> +		goto out_free_req;
>  
> -	__skb_put(skb, len);
> +	extra = acomp_request_extra(req);
> +	dsg = extra->sg;
> +	dlen = req->dlen;
>  
> -	len += plen;
> -	skb_copy_to_linear_data(skb, scratch, len);
> +	pskb_trim_unique(skb, 0);
> +	__skb_put(skb, hlen);
>  
> -	while ((scratch += len, dlen -= len) > 0) {
> +	/* Only update truesize on input. */
> +	if (!hlen)
> +		skb->truesize += dlen - plen;

Are you sure we need to subtract plen here? When I run fragmented
traffic with ipcomp, I'm hitting the WARN from skb_try_coalesce during
reassembly, ie truesize is too small:

    delta = from->truesize - SKB_TRUESIZE(skb_end_offset(from));
    WARN_ON_ONCE(delta < len);

The splat goes away with

 	/* Only update truesize on input. */
 	if (!hlen)
-		skb->truesize += dlen - plen;
+		skb->truesize += dlen;
 	skb->data_len = dlen;
 	skb->len += dlen;

pskb_trim_unique ends up calling skb_condense, which seems to adjust
the truesize to account for all frags being dropped.

Does that look like the right fix to you?

-- 
Sabrina

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
