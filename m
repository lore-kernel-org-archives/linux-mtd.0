Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F8C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjMRCIBrnHkpok6CziEdBx2ligKSV84C5KvS4TxA3bU=; b=j3zRxW60AGObRq
	qvri7Bh/qiLCfWRdvmkLgVmOqo3PqWUFVCNxyaLrrXBnMfpNLWXAHXSsXex/i2p3xFH40P/QMRHT6
	lSKr2OPzkYv0zyTy4kPSUMzh7Rt+k0nEIaIDMdWCNloSOO4CxAL978pO7yGG3hAKaxoPs2cDEuaIu
	NMs/OkSl1Th9niDBrFsJJ8VqCNGVFpcFs6N8UurRPGsV2qAVVjuEZCxu/ZdMCVztL6/noRbHTUKBn
	uHBr80Kk7bRhR/4JCdUa2XvUF57fkYz6cytS+3ihCq7nt0RCNgjELsvLAsYt0KaLF/mRe5k76YVk3
	9szjh2UHp4r/sa+xqOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgzC-0000000FNbh-0i6i;
	Mon, 24 Feb 2025 22:31:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgxn-0000000FNID-3GuO
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 22:30:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-219f8263ae0so104010915ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 14:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740436211; x=1741041011; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Me2tClMPt10g2IbqRw63NkEwXox0kTNxKyczDkCN+Y=;
        b=PCIgv4I6yH4scVjvNJXeEX7g415s+KaEekGNesG/4iFrqjArppyv7yDC3s022GZL5b
         D9PH7xqXuqn75f+c98Nq1jfLRoeNiqP8kLae4RtmsRAzi6lCteQH5aP1aWjrs05JJKXd
         jfh4VpuNfAzNuB1HUbTjtMNJUPmFyROF5+dR3yzXLZGkWFw6/OL/+r0JkHr8gZkVPLIg
         SN79er4WfYHsYt1X6Ee+hsc0+iBHn0LOGBqcczZBmqeK7WYnN36/HfePRQGdHq6cKGN6
         HuwRuzXwDGDKqDoSA/MAbHXQ9tFw/Awkx1nUIbcM5ubrGQYoUTu8/3z5MKLXECfDTtwn
         RlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740436211; x=1741041011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Me2tClMPt10g2IbqRw63NkEwXox0kTNxKyczDkCN+Y=;
        b=jC4QZLjJFWa/15DkiHVMnycZgthhp3TgvHVPdC4hS7W3BY0BePqYCxRa7hoPVpbUE4
         olOoKGpcSMD33Vk+yYrRMblqClqoQHn8vZGEhLMEuXd9hMUohY2fnmT0A/NPAI+9tAx0
         2mKlRjJzXmV0d8AULkyPKA+dgcOohW4p3yQl/AWSslfIjEoUsyHL4THtpAaLZabRYuIE
         h7RgV1PJtLubxXvqIYnyxUED8tyS1Z81IebJ0TKZdC/vxlLCQQo9xTUSwZyMpctzIgIb
         w032dg51Qwxc2nRHY9GVRKPV551Ik7nqNroQ3FoRZGkeYKeS6mytCha7tFCUM9DfaZPN
         T2+g==
X-Forwarded-Encrypted: i=1; AJvYcCX9xGXu/lS/37B0TCBEA/l4IvSeOGZiLpNhApxgiDH1mh5z5m9p8Fz2P26qDyRO7rCDhvQAFsuUIR8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYORwgDlfTiJUOCh3Z4UaIffqXOJu8AAbLcS1jTUkY7E3Xvpsr
	yVFR6xCz7AKMaZ7XIjHMnWO61VBvrmYfIBapV8WELy4CrBo8uFNg
X-Gm-Gg: ASbGnctoNM1k1lZoEoA5bHCX0h97/3C46KiE6HLEpDDG7xMzQi1esRS4+QWX4WyFupv
	/VpWo7o/FL6PGGOC917fvLjsCGECFxcr9YGiszqY/EmAXu14qkjLXd76VPqTBeGkhhmWzHFV496
	e8FQyNgTwbCYqIGeCqnrX+jmNAgKLRBwJuoobPiDM4diwTnuGpUTYp8LM6GD9rQBmENrOnhVrgx
	xj00bYi4SZIemFvQv44n1QEFqvKzPHMFD5tqu7OuBNvnfyO7+N/5WSJs4EkHjGIv7gX9QAfkEc9
	n2I+mOn4K8fVMF5M8qzjcHsp0A6KlTaZ+NVBxG1vlQ0to36ILw==
X-Google-Smtp-Source: AGHT+IHSWZzc6ZuJ7NuejlOnvhXRMbFaz5+ejvmVe/JbcFGg9XTfI3FePFDJqFfvVera5WJ+OS97IQ==
X-Received: by 2002:a17:902:e542:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-221a1191974mr248692865ad.38.1740436210908;
        Mon, 24 Feb 2025 14:30:10 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092fc9sm1130585ad.126.2025.02.24.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 14:30:10 -0800 (PST)
Date: Mon, 24 Feb 2025 17:30:08 -0500
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
Message-ID: <Z7zy8AOpAo4JQu8W@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
 <Z7zv-c4A76jeMAKf@thinkpad>
 <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_143011_821950_C67E8402 
X-CRM114-Status: GOOD (  17.94  )
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

On Mon, Feb 24, 2025 at 02:21:13PM -0800, H. Peter Anvin wrote:
> On February 24, 2025 2:17:29 PM PST, Yury Norov <yury.norov@gmail.com> wr=
ote:
> >On Mon, Feb 24, 2025 at 01:55:28PM -0800, H. Peter Anvin wrote:
> >> On 2/24/25 07:24, Uros Bizjak wrote:
> >> > =

> >> > =

> >> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> >> > > Refactor parity calculations to use the standard parity8() helper.=
 This
> >> > > change eliminates redundant implementations and improves code
> >> > > efficiency.
> >> > =

> >> > The patch improves parity assembly code in bootflag.o from:
> >> > =

> >> >  =A0 58:=A0=A0=A0 89 de=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mov=A0=A0=A0 %ebx,%esi
> >> >  =A0 5a:=A0=A0=A0 b9 08 00 00 00=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mov=
=A0=A0=A0 $0x8,%ecx
> >> >  =A0 5f:=A0=A0=A0 31 d2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 xor=A0=A0=A0 %edx,%edx
> >> >  =A0 61:=A0=A0=A0 89 f0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mov=A0=A0=A0 %esi,%eax
> >> >  =A0 63:=A0=A0=A0 89 d7=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mov=A0=A0=A0 %edx,%edi
> >> >  =A0 65:=A0=A0=A0 40 d0 ee=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 shr=A0=A0=A0 %sil
> >> >  =A0 68:=A0=A0=A0 83 e0 01=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 and=A0=A0=A0 $0x1,%eax
> >> >  =A0 6b:=A0=A0=A0 31 c2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 xor=A0=A0=A0 %eax,%edx
> >> >  =A0 6d:=A0=A0=A0 83 e9 01=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 sub=A0=A0=A0 $0x1,%ecx
> >> >  =A0 70:=A0=A0=A0 75 ef=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 jne=A0=A0=A0 61 <sbf_init+0x51>
> >> >  =A0 72:=A0=A0=A0 39 c7=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 cmp=A0=A0=A0 %eax,%edi
> >> >  =A0 74:=A0=A0=A0 74 7f=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 je=A0=A0=A0=A0 f5 <sbf_init+0xe5>
> >> >  =A0 76:
> >> > =

> >> > to:
> >> > =

> >> >  =A0 54:=A0=A0=A0 89 d8=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mov=A0=A0=A0 %ebx,%eax
> >> >  =A0 56:=A0=A0=A0 ba 96 69 00 00=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mov=
=A0=A0=A0 $0x6996,%edx
> >> >  =A0 5b:=A0=A0=A0 c0 e8 04=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 shr=A0=A0=A0 $0x4,%al
> >> >  =A0 5e:=A0=A0=A0 31 d8=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 xor=A0=A0=A0 %ebx,%eax
> >> >  =A0 60:=A0=A0=A0 83 e0 0f=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 and=A0=A0=A0 $0xf,%eax
> >> >  =A0 63:=A0=A0=A0 0f a3 c2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 bt=A0=A0=A0=A0 %eax,%edx
> >> >  =A0 66:=A0=A0=A0 73 64=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 jae=A0=A0=A0 cc <sbf_init+0xbc>
> >> >  =A0 68:
> >> > =

> >> > which is faster and smaller (-10 bytes) code.
> >> > =

> >> =

> >> Of course, on x86, parity8() and parity16() can be implemented very si=
mply:
> >> =

> >> (Also, the parity functions really ought to return bool, and be flagged
> >> __attribute_const__.)
> >
> >There was a discussion regarding return type when parity8() was added.
> >The integer type was taken over bool with a sort of consideration that
> >bool should be returned as an answer to some question, like parity_odd().
> >
> >To me it's not a big deal. We can switch to boolean and describe in
> >comment what the 'true' means for the parity() function.
> =

> Bool is really the single-bit type, and gives the compiler more informati=
on. You could argue that the function really should be called parity_odd*()=
 in general, but that's kind of excessive IMO.

Yes, I could, but I will not. :) I also feel like bool looks more
natural here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
