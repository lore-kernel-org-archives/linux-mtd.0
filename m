Return-Path: <SRS0=Kb5f=GC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A7DC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:41:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C5BF207A6
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C5BF207A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2dbQAar0SbBJV/uKluqDfQZoCz4jzK16+jV+AAstChA=; b=Vcbid0VdN3FcWRqjHkUBAHn8f
	B9lYxWYietKwN9cEPxEyyMXQWzWZqehGsLgT6fJ1DJG8JIgIpjTrsmQNX2zHyZ4+Km32WG3qMp/Ky
	GdUnRlYeNTCnAaI8podYnVZAo51NTjbdoysouMtTRc2DQ0ufCfDeh+1Pl7NRCKjGuxcHflavo4F50
	fc6TlV+AhLI6lRM1BOPKMNM7PLHr5x5QCo/fNbsCQ4zTT7u42apfI5EjOZDHOfsTZAL8WiHt9CN/J
	8hFKnrvusbDL7NA75swqKCZ7MtoH5BaOcgPw0fDaK7tfwM51uefaKPeohrhi+MqcbQvCZsUrziWtH
	k0/+ijg0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kudaz-0004GD-1i; Wed, 30 Dec 2020 15:41:05 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kudao-0004D0-Bj
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2020 15:40:56 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DDA835C0050;
 Wed, 30 Dec 2020 10:40:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 30 Dec 2020 10:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TUh6I4m1JvbyJsLFtp/BvpmkKzt
 UH2S21H/iXrSq0fM=; b=fC2b8kuGxkYN25j38l4T1hM7YfsaWsYYnMdSd3YzAxh
 E+oK9iXfq7gSmAr0jUL9mXRC7ifw/CTSpgvS4ezzfuXC8B0W2kie/oF+Zpz5j2LC
 8fPuWEKibQWRTGIDU8FCJwbZa3erXonHicXVqU87mn3t3powtNWag+OG4KH7CmaS
 1Agl2p/ncBC7u4zOmvTsbse6j3vjaNSZpoOQf1txMc/az9zZGvIvpwmMPeef3ygz
 6mSa2pdf4cvAMMiLjwtH4SMZnsIj0GA0AUWL8qFaXKMRWLlE8cNVImC/iJC/j9S+
 Ht6Ed2l+m2mlxx7lHzcLA2oyin7xwkSFblLYPviypAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TUh6I4
 m1JvbyJsLFtp/BvpmkKztUH2S21H/iXrSq0fM=; b=HDUL2fOmiQDsI4ICwphH0r
 DuJBTY23LWvMzlF5ovC+UXhajqxYu4Z2FrS3t0BPOCa+/6FcUX3T8zZdFdoknMZ6
 ZeY0HRMsHAnYVbOCIhs/DrisKleu7Jg4jVilcgYYDs5IwevNLCXgzg6MgXfQV3aY
 OFRn4nmiYav9USHAn6yYl9uv5IRHl+QqY1WHUXi4urzVodcBYJ87hp7AZPm41ZvD
 rZOpA2tVKSX3tnSqrYsrm2SvLOHzvQssJGokWyUP3jpm+LYLRJxG7vmc6N086c5u
 r2FFwLYGC5ZnR2N5e4XeLE5eFZ4XBapQd7Qs6LBkW7NW5bEPPKDdTrJNteJbhTwA
 ==
X-ME-Sender: <xms:hZ_sXwHJUNPS0i4kHsH_QK8k8dgXc3pLL1vaMxUXpp2s82YD9luk_w>
 <xme:hZ_sX5WX3gDMQll5DiZPlFwVNLWpqS7IMzzU9uXKxQ_JFchrNjAzqFc_KkvN1QKm1
 NonB2jU2s3ALw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:hZ_sX6LAskXaoKj4_vWCT_zBHoHsqIVU9VuHXVjL3p8DruujsfiIEA>
 <xmx:hZ_sXyH9aJw6NwnByZ266ILSTOuNylj6hEioPI-tJ_M__RuydFP9zQ>
 <xmx:hZ_sX2UxzyBJ03q7cqxEpEqYIHQhZLCIAPWhepxWG-T4GIS2R-kXuA>
 <xmx:hZ_sX1SfwLxtUsOueKFlLfxpnBexUpfVVeCxIrRkMMn5OSmMOaD37Q>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF6AE24005B;
 Wed, 30 Dec 2020 10:40:52 -0500 (EST)
Date: Wed, 30 Dec 2020 16:42:15 +0100
From: Greg KH <greg@kroah.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 4.19 0/4] fscrypt: prevent creating duplicate encrypted
 filenames
Message-ID: <X+yf12YbaUciBwwf@kroah.com>
References: <20201228191211.138300-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228191211.138300-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_104054_495751_4508CBEB 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 28, 2020 at 11:12:07AM -0800, Eric Biggers wrote:
> Backport four commits from v5.11-rc1.  I resolved conflicts in the first
> two.
> 
> Eric Biggers (4):
>   fscrypt: add fscrypt_is_nokey_name()
>   ext4: prevent creating duplicate encrypted filenames
>   f2fs: prevent creating duplicate encrypted filenames
>   ubifs: prevent creating duplicate encrypted filenames
> 
>  fs/crypto/hooks.c               | 10 +++++-----
>  fs/ext4/namei.c                 |  3 +++
>  fs/f2fs/f2fs.h                  |  2 ++
>  fs/ubifs/dir.c                  | 17 +++++++++++++----
>  include/linux/fscrypt_notsupp.h |  5 +++++
>  include/linux/fscrypt_supp.h    | 29 +++++++++++++++++++++++++++++
>  6 files changed, 57 insertions(+), 9 deletions(-)
> 
> -- 
> 2.29.2
> 

All now queued up, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
