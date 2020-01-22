Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9CDC2D0CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 01:17:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 950B124656
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 01:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B5nQ6BIA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="sbjgI932"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 950B124656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+qz8Ov224Mb7slouyG83XeR3kzT06VWsVAVqTFIEi8=; b=B5nQ6BIAiTGGqf
	27fsqJLJp7dtIEQRkiTDfaukoMrSCCB0m/eufu+y2vt6ZhHR1mUpCubZwVXdlqTc83wyy4An1TBAn
	1Y8a6PBSLzmeRU9rnBJRreIzqWsCR63yswHK7cP6PaS1FmxhCMaUftBA6yCY4GUNSMiF6jXm/SI10
	v/AzK8yB43xQycHootfqcWopcb5S3FLEKWEpLQUpLw3QrkP110pJPW5hzWfXPgFpQkplqZHSI47kQ
	efz7k4BIYAGHZZ5WR7YSD3ACqtPpp/3ci39s5r2P1ykvP5POE6Ej6eXXDUQOkPxMqyTXqxTYLtvSz
	TFy0ZOUOswM/+pfAn+XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu4de-0003DU-8f; Wed, 22 Jan 2020 01:16:58 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu4db-0003C1-Az
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 01:16:56 +0000
Received: by mail-lj1-x243.google.com with SMTP id w1so4911855ljh.5
 for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2020 17:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aTrmpDPbM7QagWgFbn/XvaDbssQKCtZ+aK7kQ78b1YQ=;
 b=sbjgI932IVsBnwvZcFBnekfHjH6LPvKho84iI0IqHn/lre/vnHDKZVHxM1chNODhEO
 oeBlWCXMu1xE41wCdmoAkJJWr3Xo/D+ju9vZ24VZpOnhSgfRdcQ5am2PHHrxTnbqi0XX
 b6eAwer8WCvSMIGV6+9Wm90f1KZ3856dgqPB2hB+SbeEq0VAirrYLusuJK6x9OvIXK1e
 QDAc9rab8nWgGfMDGKUKmikIqpQ1Tb6qVVp8u1rUGV3i6DXFmO0XieZmSerhbsGxj1Kd
 Nom76vDbxrBnAL633zaFY9rrVrFB9Ton5m1jJHrUpOo8xzUYC7WMuWNZ+fTJ5iMxzctH
 wfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aTrmpDPbM7QagWgFbn/XvaDbssQKCtZ+aK7kQ78b1YQ=;
 b=TX37EzWIfuS35Gi0By+DJH997rAHLIP1Ye4+HNoO+39fdpyEnv5Kw2D9NloDH0f95b
 HtkuRK29MM6qcFnttgz+S51jArc2bxHCFM1niHaV/8dwVrDkCIrttfiNPSiRi7mhZpAq
 dvCZSQXflA7yaHR5IwHRFRuVzNMLKq1QJ0ZV0x313TnnP1GKAlpQamwniKxt/PTYsemm
 OjIDHLWd0kJE2M/5jXIiweOVH6yQVLo8ml55R1nw25tVOKaY+cvmOF8Tlsf3Wkg414aX
 pN9oA+wpMPOKsigtE+K5WNcLk8W83lGY83VRiDv1XLXrGNdKFzyXSLihltk0dH/3Dcn4
 GnvA==
X-Gm-Message-State: APjAAAV9aM5ra9V/+TgKPxbtTGBiLwZxAhsrtSVmiEXWxKeF2TWhHhr6
 1AyIAOTxpj8OXCMfQYs0uTmM/IuSep1E3ddYREQ/DA==
X-Google-Smtp-Source: APXvYqx9Wcig2VJsMhSPvoP5661qvRVt8CMWdEp0WvbCQ34genipkG1eA/ei4esFDAtnsgj2YEIbFdJHl+MGczi/Wzs=
X-Received: by 2002:a2e:b52b:: with SMTP id z11mr18133901ljm.155.1579655807322; 
 Tue, 21 Jan 2020 17:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20200120223201.241390-1-ebiggers@kernel.org>
 <20200120223201.241390-4-ebiggers@kernel.org>
In-Reply-To: <20200120223201.241390-4-ebiggers@kernel.org>
From: Daniel Rosenberg <drosen@google.com>
Date: Tue, 21 Jan 2020 17:16:36 -0800
Message-ID: <CA+PiJmT1GPgLBYak51V04jtyDjOFPzSeaTxKryCqy3Ak6yAo6A@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] fscrypt: clarify what is meant by a per-file key
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_171655_380564_0B9B5870 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 20, 2020 at 2:34 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Now that there's sometimes a second type of per-file key (the dirhash
> key), clarify some function names, macros, and documentation that
> specifically deal with per-file *encryption* keys.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. Feel free to add
Reviewed-by: Daniel Rosenberg <drosen@google>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
