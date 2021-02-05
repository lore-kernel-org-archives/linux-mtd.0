Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9469CC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:53:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA0764FC0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA0764FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=INUTcwCqY6Qbz1iHIzBLN5PJZh+Fg986VHUjo1UlKBQ=; b=PL8vhfcMhseY0J3lHBkGJ1QLZ
	ufd+rUw8LaqAI3Wf41CtCnNFhEZgEXBYBIVjkv46Av7mUKSJd9nk3ZATOjfC/fyBA5sOy7mzHoOE1
	8QlAYdc5O5qIXrefCE5ZACrPI0mSkS2lw1IS/1u8o5Y0k6B7YKULkpkNUoIs9DjRHP2rEX1PUPUfQ
	ZZX/cucYCAltswn9sG76o8mijdCS+UUHinoaubsQXIZf+aBdyJciJVQRfGCO4goCZbTfo59dUxb8Q
	RDMH58jOV0LmihhnncPzx5iiwFMpq5KB33wfZob/n0Xf9RcuIXqoizp9mlyDtAEsn8YMhiGIYWXNU
	DH+gUlMEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81XI-0003jB-NV; Fri, 05 Feb 2021 13:52:36 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81XG-0003hq-1n
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:52:34 +0000
Received: by mail-qk1-x734.google.com with SMTP id k193so6856627qke.6
 for <linux-mtd@lists.infradead.org>; Fri, 05 Feb 2021 05:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y8ywqrNIRNsV/WCSse4osZ5a836SkyCAgJhGHdnyxYU=;
 b=eVdNW0R+o8hTwRs0jlD8x9RbifEQSwRdrT3SnZShE4VF0wxyIfFQ1sGDdDNL+xc4mf
 y+3Xsa8jE0c20zdnNYEz1scHewL8jDtYAcf4vSKkddau4wmpDIL2zivvt7lxhDR4diNi
 SAZbpQZQgfDE7R4BViW3dyO1gwtrubpj4ui1Uo0feJXuop7P4VQJZ4uXAIY2XnOJD9gS
 YP62SsE3i1Y7H0LC9SeeyQX7CDxiifRsOKlMGI7pOJjbUvKpEo76fEJUzveXxaP3IFVr
 l+eXPiaj4hveXJAG3D6CWYP6U9ZDsX0Zs6o8liTVtIgpkNyaVe5rIZpAkTie+HLkOraS
 2Pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Y8ywqrNIRNsV/WCSse4osZ5a836SkyCAgJhGHdnyxYU=;
 b=kb4JQsBKkjmm6LJ4ZRuGqlcuXiVMwlsxWy8q92C+tWYZDUMwK9pfGBO7DSpbyz+qr1
 gN4RIharEC9hjFuaKGNE84iLNIxWlhd9m0to4vIQFmHRT11dBmbYq0cKcBSZX8yOCkRS
 FqQMV56YzEWPyutiwGbhlVTiqHfn7i3ykIHUXZXVBmHHfHMgVGgLffI0nnhZ3xylbzhO
 X4G9DSPn0Zk0eqkXg2KuGg6JEtUccUa26L4+q4UQbvWtCd133oh6Aa6mATf3wprt43Li
 PItBrG6xhEYdqVdfKnNk1v9vFgF5CIyVqpecvw1Cb1+rP2pJ4vZ+75Y8kxAsFCNxdBup
 BfVQ==
X-Gm-Message-State: AOAM533UsY4abmOOOdsieDDV59322c3qM7YMf9g5f8Evb1j0cO4x/x2q
 MwL7/65kMFzG60nLFsA1GSw=
X-Google-Smtp-Source: ABdhPJzluogsW7CobFyQbM6KN4LrBuqIAEnj4fFqzRKZPeSLAVs7kNOzDryBUlYQs7HYZQfz/8LpAg==
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr4247131qkl.131.1612533152237; 
 Fri, 05 Feb 2021 05:52:32 -0800 (PST)
Received: from ArchLinux ([138.199.10.106])
 by smtp.gmail.com with ESMTPSA id f7sm5939828qkh.45.2021.02.05.05.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:52:31 -0800 (PST)
Date: Fri, 5 Feb 2021 19:22:22 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] drivers: mtd: Better word replace a not so good word in
 the file mtd_blkdevs.c
Message-ID: <YB1NlhOLQYQMR92b@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20210205124151.1386271-1-unixbhaskar@gmail.com>
 <20210205142618.116852a0@xps13> <YB1J53adyW4BBK3g@ArchLinux>
 <1065601601.365300.1612532978692.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
In-Reply-To: <1065601601.365300.1612532978692.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_085234_141299_AD01E779 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0242766251765252702=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0242766251765252702==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UbVbuy+EtEjeJ/Yy"
Content-Disposition: inline


--UbVbuy+EtEjeJ/Yy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:49 Fri 05 Feb 2021, Richard Weinberger wrote:
>----- Urspr=C3=BCngliche Mail -----
>> Von: "Bhaskar Chowdhury" <unixbhaskar@gmail.com>
>> An: "Miquel Raynal" <miquel.raynal@bootlin.com>
>> CC: "richard" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,=
 "linux-mtd" <linux-mtd@lists.infradead.org>,
>> "linux-kernel" <linux-kernel@vger.kernel.org>, "Randy Dunlap" <rdunlap@i=
nfradead.org>
>> Gesendet: Freitag, 5. Februar 2021 14:36:39
>> Betreff: Re: [PATCH] drivers: mtd: Better word replace a not so good wor=
d in the file mtd_blkdevs.c
>
>> On 14:26 Fri 05 Feb 2021, Miquel Raynal wrote:
>>>Hi Bhaskar,
>>>
>>>Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote on Fri,  5 Feb 2021
>>>18:11:51 +0530:
>>>
>>>> s/fucking/invite/
>
>If you are afraid of "fucking", please replace it with "f*cking" or such.
>"invite" makes no sense.
>
I am NOT afraid of anything ,just replacing the bad words ..that's all
=2E..never bother to evaluate already bad sentences with correct word.

I know it is not make any sense ...still a better word ...
>Thanks,
>//richard

--UbVbuy+EtEjeJ/Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmAdTZIACgkQsjqdtxFL
KRWjCAf+IfKyBykLxL7ODeRiwftX3kiSLsaxEeA5lx2nBqBTM4AU/ee8yJChDykP
P5pozQCOeXO57UTOXVuF+juT8zWPY93h5+o6nRS2zaCjOFlrMN93rLKuyfOj7/s1
TJl7RHpUuJPV+Hy93pXpd7kLUttO4j8WFA9ToCNd0IUZQ9g4oz9hI9t6rVnFaFP6
npQSeNJNn7Fyeb9jTur0B+j2lmi8y87hO6U02oEwCWmfx+KI0NajLI/6ljTGriwE
RrzVdtsgNl2dH3g1JotojV8X7OUWpaKh9FzHBSPJlxRWPbk/T4SOxqWp/tlKYTRJ
q/w7x+bz+5Ly8rtX2wxTjSh6oluEcg==
=bMZA
-----END PGP SIGNATURE-----

--UbVbuy+EtEjeJ/Yy--


--===============0242766251765252702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0242766251765252702==--

