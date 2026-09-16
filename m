Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F2C982C1
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsLaVdB+0JLCYn3xDwB49GhhUm12qHhN7WMQqUyfPYQ=; b=1IeYfJ964Qsnbc
	yWguHkSikzN5v0+DEbsMmfyZJRW/1AiT5UuSRay4b9zH484YtjW9lC+hC0111VM4NZXHH2BjU2Xww
	9FdMzU7zaCkiHoCItDO3HZ80CQnyIO1sCWNMco1c7tTjS3kY7WvgEIsPa1wZJnqPN93xBSt+/Kzt5
	GlDbZ2yBEkPPQT8fdokr7NSp25v6qeG4QU5k8taPdJQj245I8kqrNQAFHEIopWszNlEq5nWTOFLcc
	UV4gqimR3fXND61wzQhqh1Hr81e9Ljsxw8IeIV5mTdLfzuFWNpS+EoKJeS0M3iXe3bmcszYaIIR+2
	QYDDibSkrraBgsUNmZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sUB-00000009jSX-08ex;
	Wed, 16 Sep 2026 16:27:51 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sU9-00000009jRS-0Klh
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 16:27:50 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so5804205e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2026 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789576067; x=1790180867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRdwwj8EXSG8IVpxD3HE+riRGCvbuZtBiFL12hxh9mQ=;
        b=eNLJDNNUgh4LbgcuWdzUcYUCcpkGEIs/Y0ZU0Y5tBeHM8naJBOOdC3rQQEet3n+N0o
         TNvLBes6J5bu91KopDnv/+237BORl2MYOgvG593MtNYr8Uym21IU2B8qTA+y7qKaERXD
         z+kYmkuL6sCaK9swaxUpd4wyjfUnMpA/EpFPedSWadJijcJ6AgV0veI4E9y/v+MlkPj5
         OjWk94i+HLGW6ER5jB3k8AX48Zym5YN5j5zX0G+jOlqhqb054AdQ9YmtCwAhUiDCR9il
         iuUzXCDLAUHpLMnqzfOtzlnhIILDcEYImR1+L7z5sKV+3VsvD5rpBY5KIobiIT1Ukysy
         oljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576067; x=1790180867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRdwwj8EXSG8IVpxD3HE+riRGCvbuZtBiFL12hxh9mQ=;
        b=LSAt4R4rFkFcj4RPuyasfMd6qCeTSXaVc3lRXDAojazkdV5SbbLwwNMu4jwdwrdeYJ
         Fgbhx89Iki7QdtmPEUbmw6bWNJF49pWGilphk3F6z8baPtTPSnKhaMnfQit8R/CbRYl4
         pkes6y18xGBKSx8rR4KHr4rcMFHdx/UwVJppdHJcaFtdnNq5LabiA+hSM80DSaVAoWnY
         s0djSVLr0c7TuqL8Oxtca8Bjz5KwNZVYqvwZCbKDMoxiU8AHZw6uS2F5+IHD2YRS2dXr
         FfuGyng++iZKLzNFXrEVIewKh99x/tPMYb++6TDhSFmbcGrhk7PSlP4IRo3S7l59iVSn
         ajMA==
X-Gm-Message-State: AFuF++k7QdnqHZcFj4SgW6ipA5bCdn6+hltWonBc4m09gLiGY0/BbW2P
	b8UoElyrp3x9TH9nnnuPd8hxDGqFBjr0zAPT6zUY9ThvjR4RZZUEtHyiu+rOTr3x
X-Gm-Gg: AYBFou1hgBMu1jhXd8CF/oBJrSlTZU6rG0xBWRVOSx6SBIeYY//rJrXr/C05vl2rdXj
	Kfb7xnaCf8wHLxwbFErn5Q3RiJlE4zZ/zsKn1tvwqmyUhVBK5QPVOvXfdAd9GWiVCJSERePYtQ8
	iu22UrfeI7FV/6E18dA8MoXvTqE4etv5VhOX/2Pvh7VeRW3SwbK9nz0xbEePTnml5OvoQ5g7x51
	JlpnjlJxWKrzzMjSojcYhqQxowtwlE/APh0Z4+eEMlKA1o1C6FF/6EAR9Aiiqth6YfiMPjHQXen
	qguQ40Y4aq5hqyF5Cpv73uQKp7vtW2zT4FHa9loUeLB5q678v7xdhvkO0yaKDI/u4v06AodcXUo
	Gv3D7+ejX4EDiZCLc/WHnj1o/CaGYkMWvRPXFrjTjDgldNghbMWH1kEfXv3NYgqUGHeRLNGssCN
	nqCE0TOEJ09PoXfoz5W5CL3i2cyUhMoAfBi/eWIQdiAWcblZrwm3mIhUYac6UQTGs6y9GRLWuGE
	r/LkbH1h3TplcM2XBinriRxA8EL8hyfT0wS9bvbMH58CZNxluanVAEgEnUit1XHtSC60Kz2O0IX
	S5flsKzGmm5lGaFd
X-Received: by 2002:a05:600c:1909:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49eb733983bmr35504315e9.32.1789576066976;
        Wed, 16 Sep 2026 09:27:46 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd262912sm2047065e9.15.2026.09.16.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:27:46 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
Date: Wed, 16 Sep 2026 16:27:45 +0000
Message-ID: <20260916162746.308008-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8733v9mdro.fsf@bootlin.com>
References: <8733v9mdro.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_092749_125223_BEAFF450 
X-CRM114-Status: GOOD (  11.38  )
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

Hi Miquel,

Thanks for the review. v3 sent as a reply to v2.

> This sentence does not mean anything, I'm sorry.

Rewritten: the count goes out as a single bus word, CMD() replicates it
into every device lane, and an x8 part reads it off eight data lines, so
anything above 255 is truncated there.

> failed? do you have hardware that actually triggered that issue?

Yes - a Cavium Octeon CN6335 board whose NOR is an M29EW strapped to x8.
The log in the commit message is from it, and the clamp fixes it. v3
names the board.

> That's incorrect. It indicates until when we need to backport it.

Added. I checked the code is really there: 1da177e4c3f4 already sends
CMD(words - 1) and already takes the chunk size from MaxBufWriteSize.

Vignesh is on To: for v3.

Thanks,
Orgad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
