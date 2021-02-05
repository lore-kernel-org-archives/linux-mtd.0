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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED5AC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:37:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D974064DE1
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D974064DE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=shxpaa8BxEmpoIE0gL/g7gU+nl1ThWA4shMVe5whtrU=; b=mqXe/VxiEmlx0ZWa+Cq9l4WOs
	2j8kq0EkIzGtegjLDFqBa5KZa8n8jPyMUSeoyZ+MyXF8cT5/571SCuN7zqr2/mJZwpIYISdjH9p6m
	dw6WhTIB33PGInVerKpCh+ex9W5lB+WUReMoWdkj0w/QnEkmdFBK32j8bqs4YRgksSHgQCoHKHPH1
	fzF/stSKzGCD7mspoYSq+cjAOjqoLKDYBUQdQNCV0RJsuJCTcdRKqllC+qG5wLkhtZsvCi1l24DSe
	PO8B2eDkvywJhBNDzDMSJZiYvkppKVMI0YgIoPkIgobgquSiPsH3/Tq10q04NoNbN7Q82jZVWSx/d
	XWsMtUVcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81I7-0001M7-E2; Fri, 05 Feb 2021 13:36:55 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81I4-0001Kc-KI
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:36:53 +0000
Received: by mail-qv1-xf31.google.com with SMTP id u20so3397435qvx.7
 for <linux-mtd@lists.infradead.org>; Fri, 05 Feb 2021 05:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+mW6FpqAmKNeD8zGl6TjC13ZMf5E8ip1whQBn+m47Yw=;
 b=T9l/mpYX+hFDFWYFCi7BPQeSDhYrFell0kIK045Hl1dOHHuEBftPu7El5h6RqPIKzE
 LWISVwkwtYZ6zqOyqgOSLNU0Ipi7ox1/Uj+c19fuQ9pEpYJeVyHV2FeH7hA6FOJ7EieB
 PfJBFhlSwV0DId5m6z8SneBUv4CcJU+UUVgyApfQrTW2NL+IRSGhCWEBb4JiEXdT+meC
 rrpYwTIKmQG0moDFyL05IfjcQQDlqSSp5kaVJbpsR71HpltyKI0SdLSXq7jiTI0sGCC8
 1Y+fFO48gUOgMgO0xVH3/88rr8/GkkQolZ66uLeekvE54pWE/SOB4BHnx7fl8GiKYl1g
 XFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+mW6FpqAmKNeD8zGl6TjC13ZMf5E8ip1whQBn+m47Yw=;
 b=qvzqKMQerbULfzFhhKKvMe4eYdRjpWNCIn5UYnf6GtstQ7XgeXLHkGppdOV1q+Rd0v
 iq/3EJ6G2MTJfGUfKQvwrVrlhbP4pNLpznhKHyJkXVa9xIJBpTDftmMUGMTPklthhA3G
 oyCHsFn5fW1BzuDXXzUacRUf+LhBReMohSirOuiwB4xcLMleRMQPODbSDpFsdVnunWyQ
 3zCEseXK8Qj6d9JLwo0CZfIKKrQ8h/xHJdvPOB7AeeoqOxFn9H8eAIA2GO0Ja7GgK0Z5
 O6gn9WFcp0s2n1AVl69ko6hov/m+iPoNw/03knAgeoYDtVOwR1t/FkoRl0F4JS3yaC4A
 2W5A==
X-Gm-Message-State: AOAM533R2gWuvp3c3omDKzMWOCo4tUqh7rQaV9fh8oBV8jp3hwZhpbk0
 NwMbMvUnZ3iy7kYk4VfQeTI=
X-Google-Smtp-Source: ABdhPJyaF3g7LIACGikT7qeW1QmsE8yC+KpfQNvX3PhX83BEhECpZWc6tt5yGPWjTX+/WnwOW0uQwg==
X-Received: by 2002:a0c:b65c:: with SMTP id q28mr4365647qvf.49.1612532209689; 
 Fri, 05 Feb 2021 05:36:49 -0800 (PST)
Received: from ArchLinux ([138.199.10.106])
 by smtp.gmail.com with ESMTPSA id q22sm5225046qki.51.2021.02.05.05.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:36:48 -0800 (PST)
Date: Fri, 5 Feb 2021 19:06:39 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] drivers: mtd: Better word replace a not so good word in
 the file mtd_blkdevs.c
Message-ID: <YB1J53adyW4BBK3g@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org
References: <20210205124151.1386271-1-unixbhaskar@gmail.com>
 <20210205142618.116852a0@xps13>
MIME-Version: 1.0
In-Reply-To: <20210205142618.116852a0@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_083652_734804_17D3563B 
X-CRM114-Status: GOOD (  17.84  )
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
Content-Type: multipart/mixed; boundary="===============2253513760496719014=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2253513760496719014==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HFkQv3hX6OCe4c2R"
Content-Disposition: inline


--HFkQv3hX6OCe4c2R
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:26 Fri 05 Feb 2021, Miquel Raynal wrote:
>Hi Bhaskar,
>
>Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote on Fri,  5 Feb 2021
>18:11:51 +0530:
>
>> s/fucking/invite/
>>
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  drivers/mtd/mtd_blkdevs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>> index fb8e12d590a1..756a0995e474 100644
>> --- a/drivers/mtd/mtd_blkdevs.c
>> +++ b/drivers/mtd/mtd_blkdevs.c
>> @@ -523,7 +523,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *t=
r)
>>  	int ret;
>>
>>  	/* Register the notifier if/when the first device type is
>> -	   registered, to prevent the link/init ordering from fucking
>> +	   registered, to prevent the link/init ordering from invite
>>  	   us over. */
>
>invite us over?
>
>I'm not a native English speaker but this does not bring any value to
>my ears. Worse, I don't even get the point. Better rewrite the comment
>entirely than just swapping "fucking" with a random word, no?
>
Got your point , and I do understand "fuck" and "fucking" is so strong word
that it is really difficult to replace with something else.

But..but you suggestion to rewrite the comments sounds good Miquel ...wish I
could have that much time in hand to replace every sentence having that word
=2E..all the patched sent with that word replaces...please step forward and=
 make
and send patches .

Today I sent 10 patches replacing that word(weather that make sense or not)
you can see those in the ML ...please pick up as you wish and send patches.

I was simply replacing the word ..never bother about the meaning it
conveys..doesn't matter really.

so...

Thanks.
>Thanks,
>Miqu=C3=A8l

--HFkQv3hX6OCe4c2R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmAdSeQACgkQsjqdtxFL
KRW1egf/YR9x8QUVW/w4A7gXog8v2ormOeiIwMsmh+dFQXySybFM8XSENV01zq7+
ihWte18fqmbBV4zXEuJ/fNApb5CCpfT7uUsAD3W5FGzyd+DkZN+0wL8V40tMfyyq
eU59eGg0oh4wwrNQMuAMD8the+K91ki2ozbx77ElKqlC3beaKRp3IhMWSg8iu2WK
kiRsYtWXBAM9Aa7Qnhza5w3UyHA48WWvXlk2hvujSIZasSbdHYs/gDsmQx4WsL7m
+ljY3PHCUJI3I7x1djkD2JC8Qyboq447ChWT6TUTsV1fsq4hcWRW0gfnR07R1YUK
uUGvdOJ/HxFgBEoz6A9cOUmdhyzfLQ==
=oc0N
-----END PGP SIGNATURE-----

--HFkQv3hX6OCe4c2R--


--===============2253513760496719014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2253513760496719014==--

