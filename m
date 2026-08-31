Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C105C61DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnsNUB5V4pOkIzvesuzT/4+5jG42h0H90hgwF/A+3rE=; b=GVUBGj+wLuK+K8
	Muj3iiLqnomIyrJjk0rf4EjiTdDTKgfzI0glWegYCcYyBAh1t85RfsbjmeTwdz/NiEmcj0Nbe20dN
	E9RLPOlXsZBCp4RcOdlZ4l5lbFwDz8ruXvMDf5vWfjFaYc5LD7OLMXKPvdwwakmIbADV1ztggwlLf
	ukFhYhMq1VtrzlqCyzT8zALmQQHP+PepfpeUxuWoj61gsS2RtAGrbUHxeNg1KjafR9z82tB0fy5vl
	PvJgfslv1MC+GtNBenbgytgI9j6mjko8MqP+pRcgiDPQwU+QhPJcJe5wriDdpns5YZHwhngv/L3f1
	JSJOjD/VeAd2ESULTkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Mx-00000009Dsd-11WJ;
	Mon, 31 Aug 2026 11:40:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Mu-00000009Dr3-3Ok1
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 11:40:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso2822239f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2026 04:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176402; x=1788781202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJC3AC7cDhd2NDGw7j31xCBSsHw5QjNiOrz3sSWpOIM=;
        b=MNPHXf+twGYz7oChBTRZlr8+L70U98EVicZvdXb2OeHN93rB20kEaPqob0ISuQogl2
         fElNNGrzaNzAfnqZfRQOz4UGteWZ3KJ3TeHRMS+tT34YVg+MXNGLe27QKlU8KKXZCxpV
         DKnr+DMyAIicW153j80Tl3+omcNPILl1oS6guE1hf6U6wSKK5+f0zXFCIjK8QSuu1VjD
         6pDVGt9YhJ4mBeynnzk1dwMOhlI39lVAcXb4LE53fs/X595PWUqBy0sr2htJMvYpkMWv
         RKquH+5D2cJJPvv0WuKZiIMJ7fo7hqHP1L+Ed8SawwwT36rrp98NSB885wxo+tFTeDxk
         Ifew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176402; x=1788781202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJC3AC7cDhd2NDGw7j31xCBSsHw5QjNiOrz3sSWpOIM=;
        b=Mzzq6FWGeD6xB8vpyg/Gzvsv2itMsJieDfaAcSphbK1FNREa6ALvMoB+zYrzMkAULW
         x1oYPPV8pmDJe7+hO/o0ImCErep5Q8/a3NGBIu4egytYlxZ55p1ussl9LH+vGdNvX0ME
         +nt1flYpLymziMtcQq+k6zG+bZ8Wp8ujZczVfnrEBe0ckco5PzYPhNFFaFukR0N+djTu
         aNCn31du3nKmFSKRbCAOJq+9/CaiWLbZOLNNokZYdC10ic3b2zzDXpa/YRXsI3z1yyJf
         lkyqcIMis4T0TeY+0AATu9BQQvRt+/EimfSVSDU0OS3EReQN/s1Vmd5LxEVhEHp0A4cs
         vGIw==
X-Forwarded-Encrypted: i=1; AKwUvBwUY8Wsg2CDkEL40L75TlpwRROGB9N4jqtrr4owgVCFcMWHBXuw/USf1Y/eVdgUIQg0aIoDSTgOwfM=@lists.infradead.org
X-Gm-Message-State: AFuF++n6CKWyt7QLioDoBX8dfIhhx5tljxtRXZwfFtAX/qOfPUdawKP6
	n1qWNDxa3Unklz74pSpAH1e3CJiV7JrsTedE0ujie/v1zM8wNSBwe5MG
X-Gm-Gg: AYBFou1+aGYhIKQ76vMTsxD4dEJXsyx6aPy0XUb68JmrhXM6l9DxadPegwkjEnp+9+N
	dxnaYcq7Akl2ZloWnJ55BMyZS2Pwuh8YgamIaGi6xR0+kGKLVZ4N6oFTcEp7iEG6sZNCvme73Oy
	r6GnLF/Z3Eur0b0kiGVyoM/Y6pO7Zf48CbB+pQpuyQbr+hkzve00LE4iHdAVP9eG6SqsDFqIGbM
	0eUB2AhHgXLnzs/xExidxGFGORBEm3KJBpPTW3fM+MyZe4hYyJyhk/ptsQ5I489KPiw/bhYUlpX
	PBwOTwvDhtnxsdWOlZlLWMEmgZps9/zCWJ6bUdtyx7UBvuPDYBrcjxkTTV3KFlnqdhejAMwe/r/
	eIVK3Vvdrp5i4YH2PvklvZKGxAds2rfv7pXmj1WKKq31vmFLoLHgZdet6zrB1PAfQlaDf5tqjJT
	COn5TQIhgHgUaMI3qUEWUdnbTOT3cQaijkISmb2T0zvWC+j2ljqQo8GKl6Vj+BF7HX8pc=
X-Received: by 2002:a05:6000:468a:b0:484:36c1:2881 with SMTP id ffacd0b85a97d-48440fcd8f7mr134976f8f.2.1788176402312;
        Mon, 31 Aug 2026 04:40:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm11201044f8f.37.2026.08.31.04.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:40:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Mon, 31 Aug 2026 13:39:58 +0200
Message-ID: <20260831114000.1844796-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87pkyybtmy.fsf@bootlin.com>
References: <20260828085337.3916199-1-mehmet.fide@gmail.com> <87pkyybtmy.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_044004_874338_FC58B8C4 
X-CRM114-Status: GOOD (  16.09  )
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

> Sashiko says:
>
> > New issues:
> > - [High] Kernel heap memory is leaked to userspace during out-of-band
> > (OOB) reads when the NAND chip's OOB size is larger than 64 bytes.
>
> Probably right, to be checked.

Checked, and Sashiko is right. vf610_nfc_read_page() fills only the
first 64 bytes of oob_poi while the core is free to copy the full
mtd->oobsize from it on an MTD_OPS_PLACE_OOB read, so the remaining
bytes expose whatever the buffer held before. The raw paths are fine,
they bypass the engine and transfer the chip's real spare area. v3 will
fill the tail of oob_poi with 0xff after the copy, which also matches
what raw reads see on flash, since the write path only ever programs
the first 64 spare bytes.

> > - [Medium] Integer underflows occur in OOB layout functions when the
> > flash chip's spare size is smaller than the required ECC bytes + 2,
> > leading to an inflated `mtd->oobavail` and potential heap buffer
> > overflow.
>
> Cannot happen.

Agreed: the layout is only installed in the hwecc path, where
attach_chip() rejects chips with less than 64 bytes of OOB, and the
largest ECC mode uses 60 bytes + 2, which still fits.

> > Pre-existing issues:
> > - [High] `vf610_nfc_write_page()` completely ignores the `oob_required`
> > parameter and fails to copy the caller's OOB data into the controller's
> > SRAM, leading to stale data written to the flash.
>
> Probably true.

It is true, and it is exactly what the first patch of the other series
I posted the same day fixes:

https://lore.kernel.org/linux-mtd/20260828085340.3916239-2-mehmet.fide@gmail.com/

One correction to that series' cover letter while we are here: it calls
the two fixes independent of this one, but its first patch uses the
vf610_nfc_spare_size() helper this series introduces, so it only builds
on top of it. Apply order is this series first.

Thanks,
Mehmet

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
