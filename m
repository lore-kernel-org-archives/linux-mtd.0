Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63A7C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 14:48:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A839C218FD
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 14:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5pyY2Yt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZMVeyu6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A839C218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhwVyp7lsMBQIY899tLLj047tvFx6FSCHEWE/nU4yQ8=; b=b5pyY2YtvlHMQ1
	E9bUu6ek8kzL81vb9FvMu+m/FtahDvWgYoLBZyDvrhobORAEQtNw80VLnZYirC+dS8KvNpdJF17Ia
	1aiTbSdLWS/jIOllyDm844/ImdnisWQ2mOuqsr94htuZnR0bIz/e3Ul4RySZuHjRA4Mv7LgWVOLPj
	0EqiZ8pK3CBTP/J06Fc4/TcgSO0qiPsAlhdkv079+KpO5M6+vWVZz+S2iop9XkcKJS2swTVy+GnEh
	1Bz6J1uqjkiMj/3F/MKf7ut6wt1YX+30vXTzHZ4UTW2QBvLghpZp4MKk1vLTx4YfPOvOT5FPk2y0b
	c6DSRNtAqZSSJ5o6oUfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJJCD-0006jg-Rb; Wed, 24 Apr 2019 14:48:25 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJJCB-0006j1-5v
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2019 14:48:24 +0000
Received: by mail-ot1-x334.google.com with SMTP id o39so3267298ota.6
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2019 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gt2KaLgFE9C9Wx32mhASsQsbTkmm62gqioN+Cq2y4HA=;
 b=aZMVeyu6egXP7EhJN3wmK1YGeyHtUsjt1rt0SSYP+Vd76KSKTgo9vYlS0mOWh8J5PF
 v+lcU7c3RRvDsFUlK/0NnEg8EausNqMEurR3SFRZ14IURRWGRBXA8ljjb/LSu2Ps7iNl
 NVyC9GE21A1uWGyxhIAIYtgTqlWG/0dUdg/bNWGKdBSM1Zv8y9J4p/LzDtZEoHSBxA4t
 WEVH/6d9ZObYCcSGWxVGuhQ9qXvBuVCukXyKpGud2wXeljaMIIsV64bzGQWq3LYXA9py
 ORAim70KDVX0UseSWELJAy0EkEgMBxFGedt5my7/nh/srI4Jqxab/kjHSQVN3w+EawJJ
 LPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gt2KaLgFE9C9Wx32mhASsQsbTkmm62gqioN+Cq2y4HA=;
 b=r8PYwz6bugb3g9ZkQMfMJUn6MyztWA5C51Bb1iApLH5zzgeYdpR4nEoh0OHpYGsuFx
 9WP24M2H0qwKiQDBVfl1uaoVqmIkQN9tVwt+7Bgpv125zyksUXhwUcKlcPXx2Vp82iMm
 rYOIyXShjATi7izy4Ap+nxgjnOyo8Hw5hHR1rLlMahiTTfnQhdNAkW1vQuisvrU5Fl3u
 TJiUQjY1j6c/LKtgo2nIqhvWCH4pJR5Dh/Sno3HxI5Kb1Q8796Ud1JL+N5+SpkwXKkYE
 iW71lkIGsuoFpj2v0+A1eN03Z0hJoIYyi9CV5KQQi1EuuTq/bbTmlDiqUvTdd6+YQ+Wk
 bX9Q==
X-Gm-Message-State: APjAAAWdmSbOEtmIhhvTQC4k8L+YSxNpHS1oGgkrDDz4B8d+0dZMGT1W
 SXFD3SKRn/U3XEBoj0NAdxATed1q5cK/J9JOOls=
X-Google-Smtp-Source: APXvYqwa359t+rEYrxUoka0g/Rh4AvBSdQ+btKftxFTvfdCFoj1UyAPFkicTtqgLSt01NaoS0Mhv+7+azcI2rhamoYI=
X-Received: by 2002:a9d:6941:: with SMTP id p1mr18894151oto.64.1556117301555; 
 Wed, 24 Apr 2019 07:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <5d6f2392-ac70-3192-bc16-ab3f7a88ca04@allycomm.com>
In-Reply-To: <5d6f2392-ac70-3192-bc16-ab3f7a88ca04@allycomm.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 24 Apr 2019 22:48:10 +0800
Message-ID: <CAJsYDV+Y4-xcuLqv7QTL_BtNcVOZriwnrkyTCTLjxJi2WuHv2w@mail.gmail.com>
Subject: Re: spi-nand: GigaDevices Support;
 qca9560-spi Device-ID Byte-Shift Inconsistency
To: Jeff Kletsky <lede@allycomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_074823_218006_4C1EE597 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Apr 24, 2019 at 12:33 AM Jeff Kletsky <lede@allycomm.com> wrote:
> [...]
> [2],
> is that the results of the Read ID does not seem to need the byte
> shift in `gigadevice.c`

It's needed for currently supported chips. According to datasheet you
posted, GD changed the implementation of the READ ID command for the
GD5FxGQ4xF variant and you need to patch the detect function to check
the first byte and match against a different spinand_info array.

> [...]
> The second question relates to enabling the use of the GD5FxGQ4FxxG
> series. It appears that I will need to implement
>
>    _ooblayout_ecc()
>    _ooblayout_free()
>
> and the like. Though I've read through both the F-series data sheet[3]
> as well as the E-series data sheet[5], it's not clear to me where the
> ooblayout comes from.
>
> Is this an implementation decision for Linux, or is there a section of
> the two datasheets that could assist me in proper implementation of
> the layout for the GD5F1GQ4UFxxG series?

Page 35 of link [3] you posted has the OOB layout info available.
My understanding is that ooblayout_free returns free areas inside OOB
area and ooblayout_ecc returns area for ECC data.
According to datasheet the free areas are 0-0x7ff and 0x810-0x83f.
0x840-0x87f is the ECC area.

> [...]

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
