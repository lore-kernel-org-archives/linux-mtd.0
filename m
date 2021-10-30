Return-Path: <SRS0=MDdG=PS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A727C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Oct 2021 17:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54CE660E9C
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Oct 2021 17:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54CE660E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UW4T7oxkApT3wLLsEUjpm3tbTe2zRixhNeoqPmjNLyQ=; b=w9dj0pyMXuLBbR
	xkGiQl9dRQQym2tUOqAoI/doyv1zKDm4eenMQ0QIP9mAJc9oHoqcGk/ujSEm5DVEPx2iXYVfcFHbo
	KGOi8F3QKn9pQpEqs8YGZUjtkuR4OY7XyGVp3ttRw/xEWNpB7OHmtXHiCIQL/JJr12UHdApWMxqVu
	Jcyb3tOGjOjmm6tfBmPwjkeG0XBarGDbaSGn3YLbevlDeMNsKJoHcfttdTgClgOAcwqlIQ57QNhz6
	z9rzg9r/79c5hpvGB2mAIqjMpkvxXaO1ewUx7KHnwkBKLflUNQBCySobHEyzF7EXNGzbCYZeCQuay
	lB+t/kFdSvg0HDHXxMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgrm2-00DH4V-CD; Sat, 30 Oct 2021 17:04:06 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgrlk-00DGzo-8o
 for linux-mtd@lists.infradead.org; Sat, 30 Oct 2021 17:03:49 +0000
Received: by mail-io1-xd2c.google.com with SMTP id d63so16460931iof.4
 for <linux-mtd@lists.infradead.org>; Sat, 30 Oct 2021 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=mxOtNLa1eAMR0wpGD1VMaJkJmBISmLqnmjVIAsRcHvc=;
 b=TxRznXHiVxPacqnwtNIIT0ht6nYzSE2RDLvhKozr3LBin/ehB9sdFZDpWWjj4OSd+b
 wNVCVAvLw46JGTiAgUNZvEmvOxN66IADWaxYxM1QrR9lkXlSakotxqRDVZM1H74gZzC3
 dptCLtGLLsAefANWtuy2n0rGMRlWfacf/IHiKhBgdqwAXaaJe6kpIkKpb32JNyUJDsPQ
 h2JfNkORS5+nxcLRKrwXOlVNT9+6p7ra3ZV/bu0Di5bdLiqfxKarFy4zEtd9fllr2oYp
 7Q6VyWuncWNiiodyabAkyjZysJUsC526HyMFP48mdzk4scwMLVB6FI1dgulKgRvL0IOy
 PuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=mxOtNLa1eAMR0wpGD1VMaJkJmBISmLqnmjVIAsRcHvc=;
 b=I9UJ9kB5DbyVobcqK5Z/Nu8FWpB7uzxZugr7fX4ghtPQYz4bigEDlpR4y9Z4NhzYhL
 7RFAg4Q8Ci6ENWOtdZK8s1Tyomo4LQEvMnH1ig4wcxqZ/WJgEQPKL5a8S3NdUQxdbMEj
 AmnX06UiaBOxo6jhnUJGB1esUAOzFL+cFIvzBlNgB+Ol+0ZCyjbzX6piGNepVVWQA5z2
 FlumiiqYKtEY07oHKKRsvVj0Od4kU4aYxb5+v6xz9VSW0fmGJps2zQynQ94MXyqDpfc5
 2fPsIpbw/+n+FoicGDazemvJ+OxVhPtW+JVMCfSgn10n0ZxXUOOgy8FZxjU2thENZQFm
 Ui8Q==
X-Gm-Message-State: AOAM533AIeStLwVZf5KBXoWqORTOcfcd1RQYOsh3ae0g9sLlIxo8ao6Z
 3Q/wlpmkYovL1LIlX66fSb8jtA==
X-Google-Smtp-Source: ABdhPJzMkwx+8CSrFVSVUQuPKJKJNsEs+j3d0vp9XLDv6RRzhAFgLrCeu1vNWGVlfsmYjr2iZBeQpQ==
X-Received: by 2002:a05:6602:2a44:: with SMTP id
 k4mr13067137iov.56.1635613426348; 
 Sat, 30 Oct 2021 10:03:46 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id z26sm4948483ioe.9.2021.10.30.10.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:03:45 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: kbusch@kernel.org, dan.j.williams@intel.com, richard@nod.at, jim@jtan.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, miquel.raynal@bootlin.com,
 vigneshr@ti.com, ngupta@vflare.org, ira.weiny@intel.com,
 senozhatsky@chromium.org, hch@lst.de, paulus@samba.org,
 Luis Chamberlain <mcgrof@kernel.org>, sagi@grimberg.me, mpe@ellerman.id.au,
 minchan@kernel.org, geoff@infradead.org, benh@kernel.crashing.org
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 nvdimm@lists.linux.dev, linux-block@vger.kernel.org
In-Reply-To: <20211015235219.2191207-1-mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
Subject: Re: (subset) [PATCH 00/13] block: add_disk() error handling stragglers
Message-Id: <163561342513.76453.10042066842818606438.b4-ty@kernel.dk>
Date: Sat, 30 Oct 2021 11:03:45 -0600
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_100348_335264_25DCC4CB 
X-CRM114-Status: GOOD (  11.89  )
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

On Fri, 15 Oct 2021 16:52:06 -0700, Luis Chamberlain wrote:
> This patch set consists of al the straggler drivers for which we have
> have no patch reviews done for yet. I'd like to ask for folks to please
> consider chiming in, specially if you're the maintainer for the driver.
> Additionally if you can specify if you'll take the patch in yourself or
> if you want Jens to take it, that'd be great too.
> 
> Luis Chamberlain (13):
>   block/brd: add error handling support for add_disk()
>   nvme-multipath: add error handling support for add_disk()
>   nvdimm/btt: do not call del_gendisk() if not needed
>   nvdimm/btt: use goto error labels on btt_blk_init()
>   nvdimm/btt: add error handling support for add_disk()
>   nvdimm/blk: avoid calling del_gendisk() on early failures
>   nvdimm/blk: add error handling support for add_disk()
>   zram: add error handling support for add_disk()
>   z2ram: add error handling support for add_disk()
>   ps3disk: add error handling support for add_disk()
>   ps3vram: add error handling support for add_disk()
>   block/sunvdc: add error handling support for add_disk()
>   mtd/ubi/block: add error handling support for add_disk()
> 
> [...]

Applied, thanks!

[08/13] zram: add error handling support for add_disk()
        commit: 5e2e1cc4131cf4d21629c94331f2351b7dc8b87c
[10/13] ps3disk: add error handling support for add_disk()
        commit: ff4cbe0fcf5d749f76040f782f0618656cd23e33
[11/13] ps3vram: add error handling support for add_disk()
        commit: 3c30883acab1d20ecbd3c48dc12b147b51548742

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
