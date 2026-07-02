Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36547C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 11:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R36T6D47i5AMptEfffhBFXGPZUqVsmiDpLOn4tBaqwo=; b=DLfvJxzQ0IXxph8WwGbUQSyqw/
	eqUNJpE3Bf2HJJFZ+z6C4+Adu58w4YOQgfXJcIAUsJp79ZUveYObUeC4a8t2jp3mVsNDZ/zAAoeTd
	6ZzWsO3xolpsHax9+H4W83EoUrm9owm1rxg1nkUyYMvPFKtg9qP68mGr4bDXG1PT6d/ZLJ2KJ3lNR
	Lk7RFUNVoudLSLTgMDNSSuYtZ2FimjnHgbWf/ner8xn/MzXNPCYAGt97U56TurZhOYelVtWPQyiiX
	JPuKFzsZku86LIA+Kmqo0fCYBR1T1VPZzBxUZpjaC8xHGaWuhfQdlOwOyO5VWdvj3buWcsof21pyb
	lThP3YUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFD5-00000004GcC-1VB0;
	Thu, 02 Jul 2026 11:03:59 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFD2-00000004GbF-3xcD
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 11:03:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c0e124d2a21so208667666b.2
        for <linux-mtd@lists.infradead.org>; Thu, 02 Jul 2026 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782990234; x=1783595034; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rLAZ6xjWSh4dBeXXx+Zm/8773z7w6ApW8uj4atG+Tbg=;
        b=MWP2veeoZkbXJF9zZUq+8XmId5DpVVBMFnbu2vXUpOM6M6owI06uoC+TQVMaOXZtco
         h3DGpScYP/4bv1dPODAvhTXm/e499gqwoZ3/MpFVG6g5bgIpKl6DQ+hn1b1O/lchRF7L
         NGBeKjXYelQMNMAXhKzVXckfmcas2F0HI8PnYL24FzRk7z8e9IiTtFBL9KDoK/O1avmc
         bPylN+ZYC8EBq9GZqFjbxGenGJVkchNlLNibOniM67AE1Jkfsw+zAdRh6fcdkPB6SGkG
         OTuC2ypy8rZ1uWNhHoXsyC978O2IwsbcGsqw99MckEF9JvNzU9N5hlrraWzFls/+Q9u/
         B5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990234; x=1783595034;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLAZ6xjWSh4dBeXXx+Zm/8773z7w6ApW8uj4atG+Tbg=;
        b=si6rh3grCVpF8krom2Lnr5jMZP5bjnf2B6cu88r30msW7Hs/F//WnCd5n2vr+UutwE
         WDn0fTlEuancwwbfX3e4Bilw9xvdWy4/eEu5fMOclt/pLpMoj4BtOpAdU6uSYIIaWJtm
         cPakGfENWldUbtF0+L+WvWYVmV9ZRe6/nS/nhLYCuzaGsdAyBq3CCdZRhgqBhBFv551z
         8hXhyLRHAtb/Yc5u85NZjPnkDAwbfC0HZzzMWWHUifaU+N05bss3+EqVswshnkDdOt57
         r4A46tgzhZvrZIwQLLbZfQ9+ZkIvhpCSf7E3br2R2aPUHBfsVQpveUKu6+Vt5GwQ+Mqn
         EeNg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3nAdlrCdRO9rurgXciRkhShbE1RnBggiUhl8qHsoYzyVT9Ufd9Hw78Fs+EEdnPderB5Ky9Srp2/s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJt8tJRo8J3YbbpfrtLyOLj6Ia57Qr8wHf09f+57kC5SQ62s8w
	5uO3HPcxyj7P9Nd/fz4CRPyLAUSM8//IcjjylBzX+41pU7gliIxbC8RfpP752xj4Ie8=
X-Gm-Gg: AfdE7cnb7dPohoIc7B8vb71txIaq61iBUdqzyJ0w0+gV1RW4htw61ZMkmySNM3rFxIQ
	id/N1azTaGLY2RnXbhA9ZGnE1E0q5XPhBJ8DLGA4N1ifdHDmyd/yfChXxCqqiOiVXZy8nQNG++z
	mwH/Odhxmz+0Z+MusfhOS57l4DL01OUL6WLDUnUQzIgAtqzW11HnK5TAB6Xvf6jCqQtxIbYswKV
	0L1jIBYpGxIR30iTkMWCpVWVTYtkgRmOMlyr+PdyLQvbIluLEsTIjMoFSL1fdLMuP+z1qAwnK1e
	y4hUQrAIxTOSDFIsIVe46LxzoqtIo6LKBg9aqlaksgwAZ5Y6ae48pSgC2pW5FCtO/vWVs3svJ6O
	Bb6PulFoMrj+1i+0g3VjxAyuB+i9E4ao94NgBVNyL/STzdOQxfHps1LOLrvZH6aMs+9RTSO3ooy
	t9gi0DeKAANPKglRnsZxu0Ekc+A57dDaxf6X+3Y685Rbh5fBIWzTKD+LilFz7o8fMVh0QLLJuSn
	VWPudoKQE9CbNbq2SPQIbVLszAvGzS+3XC8yeCtdwU=
X-Received: by 2002:a17:907:e14b:10b0:c12:3143:864f with SMTP id a640c23a62f3a-c12ae47556cmr180127966b.2.1782990234377;
        Thu, 02 Jul 2026 04:03:54 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698acf25f4dsm809220a12.8.2026.07.02.04.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:03:53 -0700 (PDT)
Message-ID: <99228803-b8b7-47a3-b77c-6fdf3b785730@suse.com>
Date: Thu, 2 Jul 2026 13:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
To: Ingo Molnar <mingo@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-pci@vger.kernel.org, virtualization@lists.linux.dev,
 linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-crypto@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hyperv@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, "Rafael J . Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, "lukasz.luba@arm.com"
 <lukasz.luba@arm.com>, Jason Baron <jbaron@akamai.com>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Len Brown <lenb@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Kirill A. Shutemov" <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Pu Wen <puwen@hygon.cn>,
 Bjorn Helgaas <bhelgaas@google.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-geode@lists.infradead.org, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Guenter Roeck <linux@roeck-us.net>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Huang Rui <ray.huang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, xen-devel@lists.xenproject.org
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
 <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
 <akJUz0kYkEBdLSZ3@gmail.com> <akQR9YMtMHReJTfB@google.com>
 <akY4U0jUZm4HOGZ_@gmail.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <akY4U0jUZm4HOGZ_@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_040357_138890_6E916A38 
X-CRM114-Status: GOOD (  19.03  )
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
Content-Type: multipart/mixed; boundary="===============6063110140423506650=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6063110140423506650==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WjZXb44KsATEDkDSufWy2bKk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WjZXb44KsATEDkDSufWy2bKk
Content-Type: multipart/mixed; boundary="------------o2fircZpb09tU1GMO2GxqgPd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ingo Molnar <mingo@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-pci@vger.kernel.org, virtualization@lists.linux.dev,
 linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-crypto@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hyperv@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, "Rafael J . Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, "lukasz.luba@arm.com"
 <lukasz.luba@arm.com>, Jason Baron <jbaron@akamai.com>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Len Brown <lenb@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Kirill A. Shutemov" <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Pu Wen <puwen@hygon.cn>,
 Bjorn Helgaas <bhelgaas@google.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-geode@lists.infradead.org, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Guenter Roeck <linux@roeck-us.net>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Huang Rui <ray.huang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, xen-devel@lists.xenproject.org
Message-ID: <99228803-b8b7-47a3-b77c-6fdf3b785730@suse.com>
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
 <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
 <akJUz0kYkEBdLSZ3@gmail.com> <akQR9YMtMHReJTfB@google.com>
 <akY4U0jUZm4HOGZ_@gmail.com>
In-Reply-To: <akY4U0jUZm4HOGZ_@gmail.com>

--------------o2fircZpb09tU1GMO2GxqgPd
Content-Type: multipart/mixed; boundary="------------DvT8SfkPmJRmXAYHiBwk9gCF"

--------------DvT8SfkPmJRmXAYHiBwk9gCF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDcuMjYgMTI6MDcsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBTZWFuIENo
cmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+IA0KPj4+IE5vdGUg
dGhhdCB0aGUgaW5kaXZpZHVhbCBwYXRjaGVzIGFyZSBJTU8gc2lnbmlmaWNhbnRseSBlYXNp
ZXIgdG8gcmV2aWV3DQo+Pj4gdGhyb3VnaCB0aGUgYWN0dWFsIDMyLWJpdCA9PiA2NC1iaXQg
dmFyaWFibGUgYXNzaWdubWVudCBjaGFuZ2VzIGRvbmUNCj4+PiBpbiBpc29sYXRpb24gKHdo
aWNoIHNvbWV0aW1lcyBpbmNsdWRlIG1pbm9yIGNsZWFudXBzKSwgd2hpbGUNCj4+PiB0aGUg
Q29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaDoNCj4+Pg0KPj4+ICAgICB7IGEoYixjKSA9PiBj
ID0gYShiKSB9DQo+Pj4NCj4+PiB3aGljaCBjaGFuZ2VzIGJvdGggdGhlIGZ1bmN0aW9uIHNp
Z25hdHVyZSBhbmQgdGhlIG9yZGVyIG9mIHRlcm1zIGFzDQo+Pj4gd2VsbCwgaXMganVzdCBh
IHNpbmdsZSBhZGQtb24gdHJlZXdpZGUgcGF0Y2guDQo+Pg0KPj4gSXMgdGhlIHBsYW4gZm9y
IHN1YnN5c3RlbSBtYWludGFpbmVycyB0byBwaWNrIHVwIHRoZSByZWxldmFudCBwYXRjaGVz
LA0KPj4gYW5kIHRoZW4gZG8gdGhlIHRyZWV3aWRlIGNoYW5nZSBvbmUgcmVsZWFzZSBjeWNs
ZSBsYXRlcj8NCj4gDQo+IEknbGwgdHJ5IHRvIGtlZXAgdGhlIHBhdGNoZXMgaW4gYSBzaW5n
bGUgdHJlZSAodGlwOng4Ni9tc3IpDQo+IGluIHRoZSBob3BlIG9mIG5vdCBwcm9sb25naW5n
IHRoZSBwYWluIHR3byBjeWNsZXMgLSBidXQgaXQncw0KPiBvZiBjb3Vyc2UgZmluZSBmb3Ig
bWFpbnRhaW5lcnMgdG8gcGljayB1cCB0aGUgcGF0Y2hlcyB0b28NCj4gKG1vc3Qgb2YgdGhl
bSBhcmUgc3RhbmRhbG9uZSksIHdlJ2xsIHNvcnQgaXQgYWxsIG91dCBpbiB0aGUgZW5kLg0K
DQpJbmdvLCB3b3VsZCB5b3UgYmUgZmluZSB3aXRoIG1lIHBvc3RpbmcgcGF0Y2ggdXBkYXRl
cyBqdXN0IGFzIHJlcGxpZXMgdG8gdGhlDQpvcmlnaW5hbCBwYXRjaCBlbWFpbHM/IFRoaXMg
d291bGQgc3BlZWQgdGhpbmdzIHVwLCBhcyBJIHdvdWxkbid0IG5lZWQgdG8gd2FpdA0KZm9y
IG1vcmUgcmV2aWV3IGlucHV0IG9mIGFsbCB0aGUgcGF0Y2hlcyBiZWZvcmUgc2VuZGluZyBv
dXQgbmV3IHZlcnNpb25zLg0KDQpBcyB0aGUgcGF0Y2hlcyBhcmUgKG1vc3RseSkgc3RhbmRh
bG9uZSwgdGhpcyBzaG91bGQgbm90IGNhdXNlIGFueSB3ZWlyZA0KcHJvYmxlbXMuDQoNClRo
ZSBsYXN0IHR3byBwYXRjaGVzIG1pZ2h0IG5lZWQgdXBkYXRlcywgYnV0IHRob3NlIGNhbiBi
ZSBhcHBsaWVkIG9ubHkgYWZ0ZXINCnRoZSByZXN0IGhhcyBiZWVuIGFjY2VwdGVkIGFueXdh
eS4NCg0KDQpKdWVyZ2VuDQo=
--------------DvT8SfkPmJRmXAYHiBwk9gCF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------DvT8SfkPmJRmXAYHiBwk9gCF--

--------------o2fircZpb09tU1GMO2GxqgPd--

--------------WjZXb44KsATEDkDSufWy2bKk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpGRZgFAwAAAAAACgkQsN6d1ii/Ey9T
iQf8D4c54BGRNKMRsSJiXSFxOPiUVfGXcsH7BLGSCIbavlNKB6PC4nfBVKfvlEHUsQk3Zy7dOXCt
DjWUBhqMxb+QCJKNrUGKsdDFtl1Agihz8PaRzzF6LAJL86LHnhjy30FkyEoT+wE8pfL61qKpyusy
xGc+xkkzm+tcDAwQDn9wTrmDKRaa/yWjrPX2idLQ/ATrKILtNW/Ci7tbKeltRSGhWV7aNEtyEUco
wq6RU91rH9miz+a9ZWCRa/bc1FU0brdudBe2pkTiDua5vzSwUx4gBoLQ98BcHb+bKidB+OS3WYBa
Qfoo0sr6Uryp6mf98UcyNgyPhA4rdUuo1iUvfsGhdg==
=MZUf
-----END PGP SIGNATURE-----

--------------WjZXb44KsATEDkDSufWy2bKk--


--===============6063110140423506650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6063110140423506650==--

