Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC3BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 15:01:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C94611CE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 15:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05C94611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKFUvnBbUIaxo/qIbZNtJsHpuP3D3M3NNO2crAx90dQ=; b=EbtyCByDitZgzs
	ENVavmTHxWmfpqwisqBszyYhWooSVuOVDPBamDUnLObwAGkIUO0C9jExPkVKreWBpEwc6xnBnDWcY
	9vqpfMPuMjLlah4/PKYGm5xXp8XXITF+SSZhbdxWDD7N5k/Cix4tQP9mSmwUEbkFCAbeTdn5R3d1J
	KFmkjOZmjlU8GVFH4voeAjM1h/1pJd9KZoAlliODDMruf96u5t/8LTQ2+quzUxboj0SL5XsWre8IF
	GgMTd9/w0JTKL4n1pwubxrq62d+FOqsAe2y/Cc5AXZJM46Ki5I2YURf1ALsraPyasv4ZgSM3iGql/
	u/fCkpQov2YF35sd9bEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZZB-007wlv-Lf; Thu, 21 Oct 2021 15:01:13 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZZ8-007wkI-Av
 for linux-mtd@lists.infradead.org; Thu, 21 Oct 2021 15:01:11 +0000
Received: by mail-oi1-x235.google.com with SMTP id s9so1195892oiw.6
 for <linux-mtd@lists.infradead.org>; Thu, 21 Oct 2021 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=6jnVZbBkLbnw6pFZpxUldRg4FuFfEZElhVVQao3Uy20=;
 b=ZGFMo833ta2HUfgqVLXUNHJV5pTUNb23BosrQDRrArzz1VYW1rZvujqd1q9AvwL/2L
 I3qasTS/LaOX+rTG38fA1WkYeozE1AIG6Y1LWW3KJy++pLKzaue+ysn5BR5qqBazSL3X
 IVR4Fjt0Mg/h6j4Zo8LPwJHvk9rRXi+EODiN4CZjW0a3nWKAwsxdaWUyN0Iinpv2NO0m
 dB+Q+OGRW5ZAtyv3ynB4fi22vLxF+kmJ+bRRxyM9NM8BrnQaDlNccb6EwaqBPSB/5dXE
 w0UzuwJbGrVM1iqd9niPDqAPfBdtIGPYSTrtcyZITTG5mzlvKTmg+/w7FrEp4Vj/y3G+
 Cdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=6jnVZbBkLbnw6pFZpxUldRg4FuFfEZElhVVQao3Uy20=;
 b=Sl0WLF9xwAJCnvbQB98Mdq4zEs/erTHQefxvA7izBS1l4KTgjc1+dYokW/oN/2QG9G
 5UlrrgcpE6HiSbBHRGXRLHU8TfeausRk/MPV9QzBnvyH9s9567REoatS4kuKcJPOWk6k
 MU6efoU9WIucitW4MxYonz6sfdT/aJHAdWfSF97zC6wZGyOwGRf4Bcib4ehTUVBlzkr3
 1hPQvaD4/t3loqdDhrGgEzwLmDJo8zNnUpNIkASrdB4t+0SStCrSTF8jfcP8jz/6zij6
 Y6qq4a8b2oXp7M0LO+KEYKJhPSstFfQT2f27gs4l+W94pkU9hICZig6SZq/1TWmW/zpp
 plHQ==
X-Gm-Message-State: AOAM533smHVOnoB4ly21VzhKLVO7S6F7fnHEaNr061f5yrjb5dxQqugi
 LVBSd9BEaMcvBQsWOMRKg3avSw==
X-Google-Smtp-Source: ABdhPJxcqYzZpw8hjWvx8wtyMAFaG+Ip962yojdp/B4kEz2Pn9lx52Qn4eX8lgw7zW26Sgpyf8s+nQ==
X-Received: by 2002:a05:6808:3c9:: with SMTP id
 o9mr4905862oie.20.1634828468846; 
 Thu, 21 Oct 2021 08:01:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:380:783a:c43c:af64:c142:4db7:63ac])
 by smtp.gmail.com with ESMTPSA id w18sm1173833ott.29.2021.10.21.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:01:08 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: thehajime@gmail.com, zhuyifei1999@gmail.com, haris.iqbal@ionos.com,
 johannes.berg@intel.com, roger.pau@citrix.com, miquel.raynal@bootlin.com,
 jdike@addtoit.com, anton.ivanov@cambridgegreys.com, geert@linux-m68k.org,
 krisman@collabora.com, vigneshr@ti.com, richard@nod.at, hare@suse.de,
 jinpu.wang@ionos.com, jgross@suse.com, sstabellini@kernel.org,
 ulf.hansson@linaro.org, agk@redhat.com, linux-mtd@lists.infradead.org,
 Luis Chamberlain <mcgrof@kernel.org>, tj@kernel.org, colyli@suse.de,
 jejb@linux.ibm.com, chris.obbard@collabora.com, snitzer@redhat.com,
 boris.ostrovsky@oracle.com, kent.overstreet@gmail.com,
 martin.petersen@oracle.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-um@lists.infradead.org,
 linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-scsi@vger.kernel.org
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
Subject: Re: (subset) [PATCH 0/9] block: reviewed add_disk() error handling set
Message-Id: <163482846658.50565.12530170761457767964.b4-ty@kernel.dk>
Date: Thu, 21 Oct 2021 09:01:06 -0600
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_080110_390524_10D491C8 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 15 Oct 2021 16:30:19 -0700, Luis Chamberlain wrote:
> Jens,
> 
> I had last split up patches into 7 groups, but at this point now
> most changes are merged except a few more drivers. Instead of creating
> a new patch set for each of the 7 groups I'm creating 3 new groups of
> patches now:
> 
> [...]

Applied, thanks!

[3/9] dm: add add_disk() error handling
      commit: e7089f65dd51afeda5eb760506b5950d95f9ec29
[4/9] bcache: add error handling support for add_disk()
      commit: 2961c3bbcaec0ed7fb7b9a465b3796f37f2294e5
[5/9] xen-blkfront: add error handling support for add_disk()
      commit: 293a7c528803321479593d42d0898bb5a9769db1
[6/9] m68k/emu/nfblock: add error handling support for add_disk()
      commit: 21fd880d3da7564bab68979417cab7408e4f9642
[7/9] um/drivers/ubd_kern: add error handling support for add_disk()
      commit: 66638f163a2b5c5b462ca38525129b14a20117eb
[8/9] rnbd: add error handling support for add_disk()
      commit: 2e9e31bea01997450397d64da43b6675e0adb9e3
[9/9] mtd: add add_disk() error handling
      commit: 83b863f4a3f0de4ece7802d9121fed0c3e64145f

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
