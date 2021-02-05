Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86AEC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 14:03:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BB464FC6
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 14:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BB464FC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ifYG7loVVUF3nAKS6PsR+GCZIQSh47ViHbGkGZJaTG0=; b=yjVoYfSKvwhc5uY38BIfJDc2K
	mTGrmGj+rS3JLx56/MheBZCYYiTsLmvzd5d7WcpRfGGqtC1PWeqXXnWPGmSiT526z3PHo/WiT24rW
	BEtZH5zykI9RvnVJkkYCBrZ6l8VdOK+jvpBuJRkCmdmRE7pXd2aEmCVBGrSSi0ngvSHHHMKPts94f
	s1tLUHcScatvyWOLk8hn5XHxCWUAp+w34/Jez1aqcxmsTLXIaMa/pIc8TMqfrunCMK5qEOERSPo4T
	eEL+rbiaFv0cO1NdxVjaBOrPJcJzLuIkMkcUVq1hIDvIOUye0t9PVjQ3KgrEHOMLttKMFodWOTeTo
	Bq8I2SrIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81hQ-0008AR-84; Fri, 05 Feb 2021 14:03:04 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81hM-00088d-EG
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 14:03:01 +0000
Received: by mail-qk1-x734.google.com with SMTP id l27so6870603qki.9
 for <linux-mtd@lists.infradead.org>; Fri, 05 Feb 2021 06:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=GLu9lg4ZbAu+RURJjhT4bU73xZ0HG2hZgBOTmZEyXxk=;
 b=ggpk5NUzB8TU5aNXclxcJHxzxliHqTlzlusLPQCja5Gp+PFXaOgj97QTy1k1pIlZ/B
 rw/OWgd9tNLonuF1T1ls/yZ2R+QQpO5d8214B4db6CSyvlc1jR2GB4aICbM4T91vtnHF
 3CD1bXFHtSgMOceUc0K0vGeBH6PRd9tVCTNoRTPyauO+5WDQ0hQMaoB77AVC837YNWsq
 48tJWUc76/zyanvhKXT5x9iO2gu6d2lgQsanBh7RhQBgVi5Ex+8IML4y8yCZghafoF63
 2dlnUjnk/r4LZjgfpBQsM9ELN0GMUnA2RsUfZPIPKd4LIyKiFbiLxy6qwz0vFT7Mvzpk
 m/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=GLu9lg4ZbAu+RURJjhT4bU73xZ0HG2hZgBOTmZEyXxk=;
 b=KqWMQeAALKta7qQcHMmRX23G9/lR4K6hfpnZSzwRcOkmpypDgOR+u9USK5sPuEvGAP
 Az0jlsNdhdkwjRUQQ1FopBPqceYrFLAVyVAP9FqEu6qc3Phi/CGGSXLLVvi/+wPZl9Fy
 HzMYQpaGQMv+0UsNT5w9f1uKuczRnVQ1+bFjLQmaCIq8cYC4kjDhGRb6d7lSiZGk59Lx
 weNl4GA5LrU8hzxFijs4dSZuyf3RaFt4MOGSnsm3xLzLw+thWavh4UozQY4ih0r/xIUB
 MBIvq55Ivwtp2Nu845edwhfkZMf4ObJbk0BgV3B1cOMnZe6Usb9Dgo4K/sQBApjMWzwc
 2EMw==
X-Gm-Message-State: AOAM533bJ3rOMeXiFB2cCtGtw5r/U/iPuMbwnzhkTxdb5UjF1g6ND3VQ
 H18zMaDPV6WqFmBJLZkHgHU=
X-Google-Smtp-Source: ABdhPJypgX8Dx+6q0k1J/qnJLpH/bLWvNJxWvDqgMSsmhqMj9EMAOwTyNZSvi8DrGocPFxDVK2OZQw==
X-Received: by 2002:a37:6507:: with SMTP id z7mr4246461qkb.26.1612533778490;
 Fri, 05 Feb 2021 06:02:58 -0800 (PST)
Received: from ArchLinux ([138.199.10.106])
 by smtp.gmail.com with ESMTPSA id b194sm8605469qkc.102.2021.02.05.06.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:02:57 -0800 (PST)
Date: Fri, 5 Feb 2021 19:32:48 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] drivers: mtd: Better word replace a not so good word in
 the file mtd_blkdevs.c
Message-ID: <YB1QCHGUdDptkP0M@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org
References: <20210205124151.1386271-1-unixbhaskar@gmail.com>
 <20210205142618.116852a0@xps13> <YB1J53adyW4BBK3g@ArchLinux>
 <20210205145716.4083e083@xps13>
MIME-Version: 1.0
In-Reply-To: <20210205145716.4083e083@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_090300_563195_42A71028 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: richard@nod.at, rdunlap@infradead.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============3173022078894913734=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3173022078894913734==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xEKPr6lbRHLv1sAw"
Content-Disposition: inline


--xEKPr6lbRHLv1sAw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:57 Fri 05 Feb 2021, Miquel Raynal wrote:
>Hi Bhaskar,
>
>Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote on Fri, 5 Feb 2021
>19:06:39 +0530:
>
>> On 14:26 Fri 05 Feb 2021, Miquel Raynal wrote:
>> >Hi Bhaskar,
>> >
>> >Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote on Fri,  5 Feb 2021
>> >18:11:51 +0530:
>> >
>> >> s/fucking/invite/
>> >>
>> >>
>> >> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> >> ---
>> >>  drivers/mtd/mtd_blkdevs.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>> >> index fb8e12d590a1..756a0995e474 100644
>> >> --- a/drivers/mtd/mtd_blkdevs.c
>> >> +++ b/drivers/mtd/mtd_blkdevs.c
>> >> @@ -523,7 +523,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops=
 *t
>> r)
>> >>  	int ret;
>> >>
>> >>  	/* Register the notifier if/when the first device type is
>> >> -	   registered, to prevent the link/init ordering from fucking
>> >> +	   registered, to prevent the link/init ordering from invite
>> >>  	   us over. */
>> >
>> >invite us over?
>> >
>> >I'm not a native English speaker but this does not bring any value to
>> >my ears. Worse, I don't even get the point. Better rewrite the comment
>> >entirely than just swapping "fucking" with a random word, no?
>> >
>> Got your point , and I do understand "fuck" and "fucking" is so strong w=
ord
>> that it is really difficult to replace with something else.
>>
>> But..but you suggestion to rewrite the comments sounds good Miquel ...wi=
sh I
>> could have that much time in hand to replace every sentence having that =
word
>> ...all the patched sent with that word replaces...please step forward and
>>  make
>> and send patches .
>>
>> Today I sent 10 patches replacing that word(weather that make sense or n=
ot)
>> you can see those in the ML ...please pick up as you wish and send patch=
es.
>
>There are currently 21 uses of "fuck[ing]". It's not a mountain to
>climb. Nor a race.
>
=E2=9C=94 ~/git-linux/linux [master|=E2=9C=94]
19:28 $ search fuck | wc -l
15

>> I was simply replacing the word ..never bother about the meaning it
>> conveys..doesn't matter really.
>
>Are you kidding? What is the purpose of a comment if no one understands
>it after a blind change?
>
No I am not . But the sentences contains that word hardly have more meaning=
=2E But as you already said rewriting those comment would be a good idea...=
can you take up some of those??

>>
>> so...
>>

--xEKPr6lbRHLv1sAw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmAdT/wACgkQsjqdtxFL
KRU1hgf+MxLaFJXAVwby3LAb7iHwqYI6m9Z62etIZnm24hL6yjiZ6AHQMnA3hucl
eoKovogTUUeF3tY/R9f2/EYzVgO+Bfu9pFU7UP5kyO8XqxtsHvkvaf1TgF9a392Y
gXOXHMxKHjR2CUyS/tF/1PZQVuu8cEKvkF6MX0dQF9SRcsUsnwky6WZLVa9dk3az
0IxTsIWkbZKp+WfCDiiXJsnZzFSpV0OrQ4gSoQOwe/aHpky77zyOjoJr9/rvXF++
8mKXhKwpz6fTzr/aaLCkqs4xnrBNmLHQk3ftdrTLblxb2SxIklAreke3Rg4oTYO4
XRF6JX+CHS+BydUXfgNV8KQVdI0qKw==
=rldI
-----END PGP SIGNATURE-----

--xEKPr6lbRHLv1sAw--


--===============3173022078894913734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3173022078894913734==--

