Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F5C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uwc86w22tTPg0TWKCUtkLQO7o4UMNLWIGchcEdnm8s=; b=rCkD25q3VtRGLr
	Gxsb7aYffxDjcqFp6sA6BxudnbXgDygNTaPZtjS4zs6iXKFtkd68WMscTXWM4dCGbUsnZCoUx+fez
	dtXcedVxOzDYpAxBKSExk/heu1iK38T9fkoTZYH31WBJPQ9zX3+PV+6pbCmVpmV4k99DElpZ1Yu06
	tM2Ab1+prg9ZTSELvaAmGqJE4sZaCNeTtbrAGoBf7cziFEtUnzn4JxmgPL/lPweTLIyUkRaAHXy5j
	usrNOjmeIqSpWEWh91wEiVWmrcOQVYBoOg1P1Q0Mgxv7uo1P9KPva3Va/5CgkdtoBZSZdskpU9Bcx
	Vspo1JGxkeFj4gkQpmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmglc-0000000FL6u-22tB;
	Mon, 24 Feb 2025 22:17:36 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgla-0000000FL65-0z5d
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 22:17:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220bfdfb3f4so110041055ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 14:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740435453; x=1741040253; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MIAmGwREzfChZxhZrA3OzxmyUXhIuIWMIVivU3ALR/o=;
        b=AwFZBC13azHXyrhSMiAQ+ldbchH3qCzZTalV6ny1x4TrSRwJjefuFiADx/ZJ/z1A/t
         slYEXseEp1oIRdOAVR2uK6OQOJ1SBLjvsYE2m5AAFiDX/sp2hfuwyujPp2/n1xYjx7YA
         tVkk09hDhhb2qLayNbQp8omTIeSmxto60CvbRXFzwVxSQAkxq3kYrLTQbVcJ+ZI8ZFXM
         /WLFxuneEaakI+GJ+wjuqVN9q8vm83XLTtSyK9pT+1xwU5c91OV5+fUmWOME2PHzyMd2
         JcSQbPRJIyJjZY7pU4Oq7+stGIGanBo5oFCjEvQugrLeA2OkXizxRCdlv9oW/C9AUk0s
         lakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740435453; x=1741040253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIAmGwREzfChZxhZrA3OzxmyUXhIuIWMIVivU3ALR/o=;
        b=lC+qRjmsPugukIJKVIbvVNSVAnfdLY3xRG1aGh2bMdUD62u7GeORTXaKvukNADDnXF
         jCIEvTg6nJVWQRRKsLWcMGV7Ykpr2VLsQwJVdQ9luq/ftGo0aW1KsA0LfwzrXJINTa4Q
         Seltvnys6PE2KbwDYABHe6GoXmcIYwcrr/sImW7dQem8+uNMInI63XxajJcPV4k0qAx1
         r2yNQfa59MfXSo23XPPDQM9etl8wk2MXSfOp/esJbuV1voz8ATtLkTmjtaFBMsuFnpQJ
         1VZM3W+Dj6O1GHwFnyKp0iVAO7D/riMv/AYUTh3sCxMRPWSXgQ5pPPRaW/il4MQ0EEpb
         G2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMZ3CgOHqN5X6ZFQMiYFXUt6G2s1AFA6Ix1EhZkvASwCr/CWGQe5yuHnS4JwxpmsO3SAovlDtayj4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRX0ouirB0Ntt1Px0M0bjwEhy8+Qodw3p7F4K2P9+QbI1AKm0S
	674SXYpkV2/NPR3czo0PW487Ej73eHN/1Ti7ZL2bBpMW1BZqp53p
X-Gm-Gg: ASbGncsAiqPR9GhFKkZ5N/P5NV0NQF0vd0ekzAvYelWIB7fbf9ko2K/AnaS07w3gXJP
	r869noCiJnY3QGOUi/u5JbGOz4VgETIgxEKMww3He1YNSCY5FSfCxdgYqvSSbwaTc46Bb8krfEO
	tXJ19jdOBIYANSzJ9Pu0DQ0cIT3WT/p/kggA1g47g27/EeveYRHO9MtC0dSJkqne1+tEVr2rb1f
	ojigeyQlvcalpMWyVfgULbJtKGvHBDgYwr5Eii4jxFcXAfTUng+x4cHIdyu4yOpZHPFdjz1ZVXF
	Z08daloIMhOeLWl2M3Y2Fa8ov0iJ/O0pMV/POFxc3zvZlib1HQ==
X-Google-Smtp-Source: AGHT+IHUNZzOI1ZFK/Wig2ECxEjG2LCeoTVF/IwXlP7H5EbtmMAu2d6RHqgduSyhdb+wHec1lfRRUA==
X-Received: by 2002:a17:903:2a8d:b0:21f:6584:2085 with SMTP id d9443c01a7336-2219ffc4928mr267486635ad.42.1740435452344;
        Mon, 24 Feb 2025 14:17:32 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a01fe28sm1125415ad.100.2025.02.24.14.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 14:17:31 -0800 (PST)
Date: Mon, 24 Feb 2025 17:17:29 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
	tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, mingo@kernel.org,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <Z7zv-c4A76jeMAKf@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_141734_270235_87EEB5CE 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 24, 2025 at 01:55:28PM -0800, H. Peter Anvin wrote:
> On 2/24/25 07:24, Uros Bizjak wrote:
> > =

> > =

> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> > > Refactor parity calculations to use the standard parity8() helper. Th=
is
> > > change eliminates redundant implementations and improves code
> > > efficiency.
> > =

> > The patch improves parity assembly code in bootflag.o from:
> > =

> >  =A0 58:=A0=A0=A0 89 de=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mov=A0=A0=A0 %ebx,%esi
> >  =A0 5a:=A0=A0=A0 b9 08 00 00 00=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mov=A0=
=A0=A0 $0x8,%ecx
> >  =A0 5f:=A0=A0=A0 31 d2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 xor=A0=A0=A0 %edx,%edx
> >  =A0 61:=A0=A0=A0 89 f0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mov=A0=A0=A0 %esi,%eax
> >  =A0 63:=A0=A0=A0 89 d7=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mov=A0=A0=A0 %edx,%edi
> >  =A0 65:=A0=A0=A0 40 d0 ee=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 shr=A0=A0=A0 %sil
> >  =A0 68:=A0=A0=A0 83 e0 01=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 and=A0=A0=A0 $0x1,%eax
> >  =A0 6b:=A0=A0=A0 31 c2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 xor=A0=A0=A0 %eax,%edx
> >  =A0 6d:=A0=A0=A0 83 e9 01=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 sub=A0=A0=A0 $0x1,%ecx
> >  =A0 70:=A0=A0=A0 75 ef=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 jne=A0=A0=A0 61 <sbf_init+0x51>
> >  =A0 72:=A0=A0=A0 39 c7=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 cmp=A0=A0=A0 %eax,%edi
> >  =A0 74:=A0=A0=A0 74 7f=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 je=A0=A0=A0=A0 f5 <sbf_init+0xe5>
> >  =A0 76:
> > =

> > to:
> > =

> >  =A0 54:=A0=A0=A0 89 d8=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mov=A0=A0=A0 %ebx,%eax
> >  =A0 56:=A0=A0=A0 ba 96 69 00 00=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mov=A0=
=A0=A0 $0x6996,%edx
> >  =A0 5b:=A0=A0=A0 c0 e8 04=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 shr=A0=A0=A0 $0x4,%al
> >  =A0 5e:=A0=A0=A0 31 d8=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 xor=A0=A0=A0 %ebx,%eax
> >  =A0 60:=A0=A0=A0 83 e0 0f=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 and=A0=A0=A0 $0xf,%eax
> >  =A0 63:=A0=A0=A0 0f a3 c2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 bt=A0=A0=A0=A0 %eax,%edx
> >  =A0 66:=A0=A0=A0 73 64=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 jae=A0=A0=A0 cc <sbf_init+0xbc>
> >  =A0 68:
> > =

> > which is faster and smaller (-10 bytes) code.
> > =

> =

> Of course, on x86, parity8() and parity16() can be implemented very simpl=
y:
> =

> (Also, the parity functions really ought to return bool, and be flagged
> __attribute_const__.)

There was a discussion regarding return type when parity8() was added.
The integer type was taken over bool with a sort of consideration that
bool should be returned as an answer to some question, like parity_odd().

To me it's not a big deal. We can switch to boolean and describe in
comment what the 'true' means for the parity() function.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
