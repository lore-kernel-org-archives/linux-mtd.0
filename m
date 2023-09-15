Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2891EE6447
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6178ClpGlYtWpioO8k4pXBY6kPvKq//2mpacADcVcQ=; b=uWmfv3q6h+i3oPm8hcjIVj9QlS
	vn/4uECgMDGnH1vm4FOfRYPA/L6662q7i4+azP+2xZS+SUcJCUbMiXvyoh0mLfQ/Xxs6maiedzBBo
	3G1cA13cwausKjqNn823CnmTVA1onrCyE2rFci1yHYu5j6W/jxYkmSXcki6rO6WqUwXvVmGMFhsc4
	3ilyLaGSRwQ3pt3NDvuHNMph9NnimcxdAT+C6hu9uIPShbDlNR4436OseGuUyQKfrIgQnXJizacfM
	Sr1oaMTIyj07D98wczrBypi9Rvyo1f2SXHQPn1I5etXzxZdFq4TAn+Nm7q6+2Mfs+qqpAVw6WGktR
	HWi6ZtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4oj-00ADvq-0K;
	Fri, 15 Sep 2023 09:08:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4of-00ADub-2j
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 09:08:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so2251451a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1694768922; x=1695373722; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RIe8hwUUG1sBCqfPefo9MhhoBTi3MvYwFYXjnGn1y58=;
        b=an3+yOaLVnb+hYywSndlblKOBbOX7MaATJna6amioicMBqHkJk02ePbIgyp4k/VDi8
         umy1t5nMxaT15OzYcpnIJMIZh7p0i2GPhJugZXLeU2nFjFl5tvatms0ibrxDBJ34rmK3
         B+NtzldZ14wOgZFQ2jzDWbGXJJYasBk8eAVpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694768922; x=1695373722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIe8hwUUG1sBCqfPefo9MhhoBTi3MvYwFYXjnGn1y58=;
        b=t4M9D2vnIAetkNwCrl7FEDnslNQdcGqyu0kZIf/CwSASFVKK+8kqPGwwzZckIMGrdk
         4k21xlh90c7W/XDKumQEGHk0vG8p9J1QeJ3mdeQi4/z7qnyZEk+cjcHwpVyvVeZLXrRC
         5MDl8ukj0PK3P9GTmGbCJS23LA4Fg5fAtDFi+0v2H8sLnoAomAsl/6l7BUmn8eZ5bOKy
         hZV2NQWy+FzNnlwGdiPoK9S90BvqKV329L5XkAqaXis6zjCgB3MhCI+PuaC3rcaeqfgL
         2rns7kWXENoPrbhPEtRYOWp9Xm7BVXrVEeWfWjpHCtHNK66327eGr3Xm+m9673RdVJae
         uTsw==
X-Gm-Message-State: AOJu0YxWd6oKiW9nJltuO3RZtcW4zw4AqCei89mRKtYZMYuTybnFBYEi
	IV1GmwYi6haFx/NWjYHqnZ+wH/mIQUGFXhnUucuHew==
X-Google-Smtp-Source: AGHT+IHb4pmmYCnujKtXiQuwL1F9bXx+m/QIh8PYni5N5EsFTVgLIC7XfK0euMpa8neJt7Ah6qsjusdKKyueFki3Dyg=
X-Received: by 2002:aa7:d90f:0:b0:522:bae5:282a with SMTP id
 a15-20020aa7d90f000000b00522bae5282amr1121180edr.1.1694768922072; Fri, 15 Sep
 2023 02:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230914064922.3986-1-zajec5@gmail.com> <28fad55f-1253-deb2-9615-b32746129664@gmail.com>
 <CA+Jzhd+HLoUDifQQ5vF7m66X3rsk1Bk2yx_0h6eSzaUwXVa72w@mail.gmail.com> <24ab9df46703695cfa7402695a5dc5a2@milecki.pl>
In-Reply-To: <24ab9df46703695cfa7402695a5dc5a2@milecki.pl>
From: Scott Branden <scott.branden@broadcom.com>
Date: Fri, 15 Sep 2023 02:08:30 -0700
Message-ID: <CA+JzhdKgTUoFpUDexKcp2vEYTFeMFBNKST-fpkerKDh4ekqqAw@mail.gmail.com>
Subject: Re: [PATCH] nvmem: brcm_nvram: store a copy of NVRAM content
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_020845_914676_2046EC21 
X-CRM114-Status: GOOD (  25.91  )
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
Content-Type: multipart/mixed; boundary="===============3390528040698343691=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3390528040698343691==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000099106506056223f4"

--00000000000099106506056223f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 12:28=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <rafal@mil=
ecki.pl> wrote:
>
> On 2023-09-14 23:30, Scott Branden wrote:
> > On Thu, Sep 14, 2023 at 2:26=E2=80=AFPM Florian Fainelli <f.fainelli@gm=
ail.com>
> > wrote:
> >>
> >> On 9/13/23 23:49, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >> >
> >> > This driver uses MMIO access for reading NVRAM from a flash device.
> >> > Underneath there is a flash controller that reads data and provides
> >> > mapping window.
> >> >
> >> > Using MMIO interface affects controller configuration and may break =
real
> >> > controller driver. It was reported by multiple users of devices with
> >> > NVRAM stored on NAND.
> >> >
> >> > Modify driver to read & cache all NVRAM content during init and use =
that
> >> > copy to provide NVMEM data when requested.
> >> >
> >> > Link: https://lore.kernel.org/linux-mtd/CACna6rwf3_9QVjYcM+847biTX=
=3DK0EoWXuXcSMkJO1Vy_5vmVqA@mail.gmail.com/
> >> > Cc: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >> > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> >> > Cc: Scott Branden <scott.branden@broadcom.com>
> >> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >> > ---
> >> [snip]
> >> > -     priv->base =3D devm_platform_get_and_ioremap_resource(pdev, 0,=
 &res);
> >> > -     if (IS_ERR(priv->base))
> >> > -             return PTR_ERR(priv->base);
> >> > +     base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res)=
;
> >> > +     if (IS_ERR(base))
> >> > +             return PTR_ERR(base);
> >> > +
> >> > +     priv->size =3D resource_size(res);
> >> > +
> >> > +     priv->data =3D devm_kzalloc(dev, priv->size, GFP_KERNEL);
> >>
> >> These can conceivably quite big data structures, how about using
> >> kvmalloc()?
> > Why do we even need to expose MMIO interface to NAND though?  Why not
> > always go through the controller driver.  I don't see how the MMIO
> > access would be used given bad blocks aren't handled?
>
> We need to read NVMRAM *early* for booting purposes. Some vendors store
> there information about used firmware in case of having main one and
> fallback one. That info is required for partitioning which happens
> during mtd initialization before we have NAND driver fully initialized.
OK, it would have been nice for the bootloader to sort out and
retrieve any information.  But if you need to access flash in the
kernel before the nand driver is loaded so be it.  Thanks for the
explanation.
>
> --
> Rafa=C5=82 Mi=C5=82ecki

--00000000000099106506056223f4
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
aon9PduLGVgSMfiFb2nQ2w0PzDSefbrZKRQAGcSvcQlWb8XU7YKGbLhjR9c/r3KF4iUW8w2T2pd+
bO6aQXt8b1C9YG/V+B65TuJXxgX0veIJEyP+Cl0Im5vNwwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU8+MSO/sprODwb9D5cjaq
JNiLqgkwDQYJKoZIhvcNAQELBQADggEBAA25uPHwC95BhvFXuEOAk+J5FZV4v82uly/X7LATDzrf
tsww461GRAidKV8lvziiIw6OQQgO9Ei/yC8bVdzDLQJF2PhxcWhc+4II6AkUyRC+Tmfk7xmPEYSv
MHgQfpwPU6C1o4FI/8XjfJgk1dE4j4v16iLKC2qfBqfdzdT/cJaCg/fZfL0w5RLtGOOVIMBWwObx
UKmtYSCgcvRKmLailjlxgiUaYgxdZSpwR0RvFJapt0KzMR5OIP96iyXYVWbl9qy8uY9gqEeNaaQm
Bt8T4oEXHxRvse+Ij162RjEysEsDgkiE/koCb3YFlkVu5lL1N0M7EIo+XiuWWUEjuhztPasxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxPA+M+AQMMGpZn
bCswDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIHu3R9t7zHTzs6NOMjntOsc+Dbka
txBeVF3NK0PiAbTWMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDkxNTA5MDg0MlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBG5Tz6HbuPGqK/V3Jj7V/c7cD0ZmPlnIEboVyW5wUQxxqS
rLhOqmXEhoznpOBOr5JE4CewspcFhVV/ryQk125Y12qRvHBfT4qP7LUtp+h1y2SJ0T/rucHJSXQx
qHSGg/Uz62JVSXxMgQH2yRfw/ctiICYvDMiQ0B5GTV4iMcQ9UAj4CaLVLfgGMrWVk5JkPTJUaAP6
DriG21U3OWvtXCbQYb7UJ78DFZcDSrWnoxsVcRx3FZr7W1zisCdErjR4Pmk+WtH1NZErwOccVvkC
QHka/B/ELj9t+HL3Ilfppgd57SDzJowyYmf6NMUKOteEW71loSGwUmIZdhXVtIxqSrnH
--00000000000099106506056223f4--


--===============3390528040698343691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3390528040698343691==--

