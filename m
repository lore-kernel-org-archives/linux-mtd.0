Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C89D606A31A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 20:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mX0mFZEr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=gw2_bookworm header.b=rRINWOJs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=OQhzSFJv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i8ex/YTBd+u5EwuwYFf9b2g2P3ImhqiDN0008uDBjXA=; b=mX0mFZErkcIdeQyJj5YIUu5mD6
	ewp/rl8CfVgc12qfZoa/TKhpOwLsV7K+alQZHZmFdW6C693iA3m8RYDM370uzRfrva6d5dSfdxViy
	WFLuDox38BrsMaNZV9rUsQdeHYsCTMuTXdANY8Qg/n+R1dl4jdDPsgKcjfVEyz1IPHoSM/+L8w0j1
	DHVQyb7G8JqyoRRCQ6LCUgoVpht8TDxF+eRoNLOSPKZGobMuDyOxo7upGUqzUkm0UYuxir1mcc/cJ
	p48bv8xfNbUt0pzTfJtcKFmvyqsjHTT8h3D3J0mpRJDGLBD7Dkta+dkrzOXH5zHV7n190wAex0Cs7
	S+cvPykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtCd-0000000CXQH-0yOI;
	Fri, 30 Oct 2026 20:27:55 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtCa-0000000CXPV-31TS
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 20:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1793392068;
	bh=60Y9mp/9FBJ5YXY0MpcbRT4JhDkOWUwbs9rLePa8GmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRINWOJsb84x0gSh160o/ofL/FBIBqFQWoU4vrcaaQa8vHMML13sfUhZ8cA5dLsrt
	 wbwj2KKhIU7Gb2ii+7Fw1wKnqU/J9M0aa/0l3wwf/bU8Ey6FmvBTtobTwGOy78Jvvr
	 taBfsDDZRWoUQrKXYZeP4CBaKnmIVVTrtdmqF4yE6IekI0F77l2fRcbHQaUxbDw4OV
	 zsfLxqsKCE+SZwNuI57nW6W0XbzUSPOful1WP3OE3ldLj7v085/PW5prQO/x5Q3vAf
	 y7NvfVz/ULpOaNNukcfWWLUR9bcxbD70i10lRFjdKtP3XxYuk9YVb/8oHbhC58JtRd
	 cRPnmyYp6bQNg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 665046C2
	for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2026 05:27:47 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=OQhzSFJv;
	dkim-atps=neutral
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id B9E296BA
	for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2026 05:27:46 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so2445281a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1793392066; x=1793996866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xXcIDxiVniNGdcbQJ6nFzj4IsHGrxD6GcvvhJ9Jcnc=;
        b=OQhzSFJvHM1X41MF31CNfx3JG6EW5N+Z+qa8D9atK1rZHELF1cd9W5ZkJcs+IciyiH
         FDmFDlZbTqO/On00Ni02pNgF5NKB49FMxTxy7rYFaA7JfSJrzHHI7nY7Il0rM85RQnkB
         S76FRxsOWXnHCKyuwe2VRQfN8RYBCggAYw0+axKp8lcqWo8Ll3/mWuqvF2GlSzgQajDr
         grJeLgqr1Z/KvVdzN38vcDIGd7ZB2i41RGtJMmgDg6J5pI4VW8WV+mKkRXOC2cyyDv+a
         hOPgcH4+8M5SpS+HSdBATtuJC5z0rHjT62yoiRp6ob4ghZhSj0aWpU7fqKl/Jx3CdwxX
         xqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392066; x=1793996866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xXcIDxiVniNGdcbQJ6nFzj4IsHGrxD6GcvvhJ9Jcnc=;
        b=Y7QNxuqOViLKVxkNaUlSKOwbTwZpDIHST8HFjaTYG+nJNLozkE8He3/TfCej/M6Zkl
         HEmMXGOuL5c28MZY0ab8jUpTgGFfeELRz9Qensv3Jd6QGh9HevSySPkTttgzM9AZFmt1
         Usit8jzzqtpJOD0cJz6tYJduKnuiO+8kvZPUoPzgs7uJtodk5DAwp5tjIFrykygetSnp
         zQPWFI5hTix2KfV9UW973bmFpMEoCSzs2h50hSFS8Sd5qTG1oQ0v4i+1Hv2DlaqlRp9F
         gy1YHgfGaKb8KEMpGSOwOdLaro2agnjBCdbswsNBhggHpnfWGjoXGrP3JTIjkEPV4abz
         bi1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8ZcsjZ4EUDGPmwRwD+47d0gS8HRKi5l7edSAlVxU5FBGOYYPGyHug9JWn3xd5YRzUMJ65EwhtWss=@lists.infradead.org
X-Gm-Message-State: AFq9FYII0gsZCAbZLsfuOTvQjj1t6hb8gmvTjcOlpYvHkQigIx+vBah/
	17yVjof9z32ZHVCiS06KB/6EikmQDlFNuPMvPUPgU34OB8Mi+5J00aT7zfRoPJUozolupsrQuXR
	GVNqaA3E6dyeC3ZxDJRpSnBcX5UqlyW4zKiKscCqgppVOBIVucetxQ2xlYfqqbYlYbV2/
X-Gm-Gg: AYBFou0Iobo/za4IFWFI/HOkDB1eiOyTrTJneMDpeBy+y0e+ByBlWQ7Evh5vDKa/6Pu
	FGdXUtYKOjump9sr0cJFAJ3bL/OacqRtQKUvQKbT2ZmGL0+OvgZjqLGL/exuZmMWgfZEubPvLI2
	Ok1SyldDWsWzSFgyBL0jY6ORlAi1ed5ZFvxyhUOFEH89Ctc47IFj7XMf4Yr6w8WcPJ6pnXUCmUt
	wx6onVEY5FOvMRA3jeERrXPiOJt7O2XngpRIHLCfncd84QkPfIhzUhsCdU0or/Wbzx7joIEVdF5
	kRcQUgOOAI6JeHyJxLstsOENPwSbUtjwcMaV3qs9enPfuC8xA5wh/169JaWDmaXYJdFRLE7Rn85
	cYzZrG3z6ouEAN1lNCrLOZ9u9B6JpX6/g/W2Z/j9VWROKVG8kYqKlflCb2rc8/Lr4GIYnOejDwK
	WBH8Xb5cxpD+oix3cU0m83
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr2859641a91.41.1793392065724;
        Fri, 30 Oct 2026 13:27:45 -0700 (PDT)
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr2859629a91.41.1793392065287;
        Fri, 30 Oct 2026 13:27:45 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3ae84596e3bsm5414317a91.9.2026.10.30.13.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:27:44 -0700 (PDT)
Date: Sat, 31 Oct 2026 05:27:33 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daisuke Mizobuchi <mizo@atmark-techno.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] mtd: spinand: winbond: Generalize the KV OOB layout
Message-ID: <auT9takcaT1TWj0W@atmark-techno.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
 <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_132752_990748_4A65DB17 
X-CRM114-Status: GOOD (  12.96  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Miquel Raynal wrote on Fri, Oct 30, 2026 at 06:45:26PM +0100:
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -318,16 +318,11 @@ static int w25n01kv_ooblayout_ecc(struct mtd_info *mtd, int section,
>  	return 0;
>  }
>  
> -static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
> -				  struct mtd_oob_region *region)
> +static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				     struct mtd_oob_region *region)
>  {
> -	int num_sections = 4;
> -	int offset = 64;
> -
> -	if (mtd->oobsize == 256) {
> -		num_sections = 8;
> -		offset = 128;
> -	}
> +	unsigned int offset = mtd->oobsize / 2;
> +	unsigned int num_sections = mtd->writesize / 512;

Ah, I couldn't use oobsize for num_sections because of W25N01KV but
using writesize makes sense as well as there's one section per 512 bytes
chunk, and this works for all devices.

Good cleanup!

Reviewed-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

-- 
Dominique



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
