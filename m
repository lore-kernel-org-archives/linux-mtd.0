Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6E7C10F00
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 07:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2D0218AC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 07:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ny8GvhNH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE2D0218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hehcAgnR6YPUa8xqv0vplPR69lKZgFoRO8fmaw7lJw=; b=ny8GvhNHOUcbM+
	PV7Ie3xzseNcs/NwFyY/RvlgqmF5kPAK8CiOHPe3sBeFER42oxl/6cRYwUkDC5BSABNYyKjACPFUJ
	fFKHCSq5lqt7ExkulaPlABNoutmJr5T32dX9r6TZln3D1R9+/+UCdg2Eaf2U6yci+ly2Tmu1TNf/1
	FB0t8gI3fM8nW5gJjJGzaBTg0wOKuvohADNFG7THJmnkykeun1OwltmbYNV3EQygzZaVUYVYBTxeo
	kesnEjDJFcWnW6qQyRMVUQNdrAFsbnGFe217GlY/3dKPYZJGztOXXmCczneq/MaJ4ARuPzPRBJIhv
	wFXhJ/OfuLUVhXz8CurQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4hZi-0001uY-Cg; Fri, 15 Mar 2019 07:48:18 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4hZf-0001ip-Bb
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 07:48:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B1B2660B6295;
 Fri, 15 Mar 2019 08:48:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xBV_RisgZVGt; Fri, 15 Mar 2019 08:48:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5E0B460ED8C8;
 Fri, 15 Mar 2019 08:48:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id l45P225PbTaX; Fri, 15 Mar 2019 08:48:12 +0100 (CET)
Received: from blindfold.localnet (089144193070.atnat0002.highway.a1.net
 [89.144.193.70])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 2783A60B6295;
 Fri, 15 Mar 2019 08:48:11 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
Date: Fri, 15 Mar 2019 08:48:10 +0100
Message-ID: <3651600.xvQHXhhOD0@blindfold>
In-Reply-To: <20190314230702.GE6482@mit.edu>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <1957441.Hty6t2mpXG@blindfold> <20190314230702.GE6482@mit.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_004815_543868_D8F52B72 
X-CRM114-Status: GOOD (  11.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: paullawrence@google.com, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ted,

Am Freitag, 15. M=E4rz 2019, 00:07:02 CET schrieb Theodore Ts'o:
> Richard --- stepping back for a moment, in your use case, are you
> assuming that the encryption key is always going to be present while
> the system is running?

it is not a hard requirement, it is something what is common on embedded
systems that utilize UBIFS and fscrypt.

> Ubifs can't use dm-crypt, since it doesn't have a block device, but if
> you could, is much more like dm-crypt, in that you have the key
> *before* the file system is mounted, and you don't really expect the
> key to ever be expunged from the system while it is mounted?
> =

> If that's true, maybe the real mismatch is in using fscrypt in the
> first place --- and in fact, something where you encrypt everything,
> including the file system metadata (ala dm-crypt), would actually give
> you much better security properties.

Well, fscrypt was chosen as UBIFS encryption backend because per-file encry=
ption
with derived keys makes a lot of sense.
Also the implementation was not super hard, David and I weren't keen to rei=
nvent
dm-crypt f=FCr UBI/MTD.

That said, I'm happy with fscrypt, it works well in production.
But being not able to use UBIFS as lower dir on overlayfs hurts.
On embedded systems where the key is always present the proposed hack works
fine. If we can get overlayfs work without that I'll be more than happy.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
