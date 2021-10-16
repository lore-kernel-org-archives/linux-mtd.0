Return-Path: <SRS0=/XBI=PE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A093C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 00:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD926120A
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 00:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBD926120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRYv63ltHmWAgdN3BMJZmK1uX3zeGBn6H3eEipNaP6o=; b=FkQ5vldv+lnRE7
	S2Ll9cHYHbasn9p0hSbCU069+JF/xWuY+05NrMR59UaEySCBQUnAMagyMmQQe1ltr7Pm8/3Sj4H7E
	lzv1AQB4LTq6wGfDQLC4ezs+nbhwZQrPHq5kpBGV3rteiZnPt802IGxLF6aS2FrKF6X90RdrnUEbT
	a0WU+BzNRmv8ORg3c0zqyO/Z/h1NqHYY+0v5JtSE4D6mWHlNkm5tj+Sj6+LY1qexxmtBgxKIA7AkH
	BRzA/eZePVIWzej2piAkth6TsR2/fY8jD7QGKM/DNTOkO4ASRtbXkKleRnfCsVC+7hkxVMbzsoMlE
	uk4Ck/KahEpgZZgZbPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbXTz-009MhQ-FZ; Sat, 16 Oct 2021 00:23:27 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbXKo-009Jet-Ta
 for linux-mtd@lists.infradead.org; Sat, 16 Oct 2021 00:14:00 +0000
Received: by mail-pg1-x536.google.com with SMTP id q5so9975188pgr.7
 for <linux-mtd@lists.infradead.org>; Fri, 15 Oct 2021 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQCqnCKj+Qob3RGhvKowF7vjQkMvz3jzVYQ6ojJDBgk=;
 b=22FCMxDjuptu5z2WXUhWAGeGxsQDD/V8j37BH7gzChQavhMTsYfwOs16+0368VAEwm
 H9Kn5GtjOlGOoLtQHyP63Q2TpGtOd+bYEeoJ7yrQrZF8Gd5SjSTBe4bjtPPHCkHVAMnX
 IKOrAb7pR6jb0J/r9z7kk4abkd4nzTZJqkNyspbONodFaBFVZGgHceRMhIUL1AnjE8EE
 QtZ+EolKR2dxl4bSkgWIlNfGf3FEfjjORJKFElmg1CgQAa4omqi87tX+bb0lzqw7atj/
 9H8nfrhpQOc6LGhupM+SVewu7XdQegTluU6pnHJSo4uAockAmkpsZzfTuVIRBEfs5F0h
 AY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQCqnCKj+Qob3RGhvKowF7vjQkMvz3jzVYQ6ojJDBgk=;
 b=LUAct7xr+hP+KKkWh2O7Q05v3IBBtpny8S2+NUFwkusgJAk5BKG25jh6v3qtiUtfjw
 wi8yU78U5hSTBVbZvzZMH6e82w65jz1NuOyW7/HiWUsbSRwjOKpSWu2/M6QvM8O5xy3F
 GrLtpP952sfegMKbV6OHSl43dT85F6DmYGgyZPLUJAKJFOlmGGa3jhh6N/pZwrtXhQM+
 mOLu0tUYeG5ezTmMd4IgbD/giK08TMKZcv23/Zwhfmiy9WPgUvy7kK72nayAKBdlh9vx
 qSslPUJ7gxnzGtExt54BZiHp715JItgsZ//RnOqYIb2pk07M8zQod87w1a9FR4UQH0zO
 XjPw==
X-Gm-Message-State: AOAM530N2TwF2ktt8GEDaIzKxQOUHbdwqGbtlJ5BXYA8HQe964GgqWm/
 8bl56xOK/8x061FPKEFdPTAWZlwWOOQevIFjaFkBBw==
X-Google-Smtp-Source: ABdhPJyHjqiChiYGgEV/QjEsOo/jEjfBLMsWIS4VVM51yMBTI+afNI+/nTgDPsjRchZ2uu+6VeHhZ/gjMvW7ySA684s=
X-Received: by 2002:a63:6bc2:: with SMTP id g185mr6607076pgc.356.1634343237273; 
 Fri, 15 Oct 2021 17:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-7-mcgrof@kernel.org>
In-Reply-To: <20211015235219.2191207-7-mcgrof@kernel.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 15 Oct 2021 17:13:48 -0700
Message-ID: <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
Subject: Re: [PATCH 06/13] nvdimm/blk: avoid calling del_gendisk() on early
 failures
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, 
 Nitin Gupta <ngupta@vflare.org>, senozhatsky@chromium.org, 
 Richard Weinberger <richard@nod.at>, miquel.raynal@bootlin.com, vigneshr@ti.com,
 Vishal L Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 "Weiny, Ira" <ira.weiny@intel.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mtd@lists.infradead.org, 
 Linux NVDIMM <nvdimm@lists.linux.dev>, linux-nvme@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_171359_053240_E780EC86 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> If nd_integrity_init() fails we'd get del_gendisk() called,
> but that's not correct as we should only call that if we're
> done with device_add_disk(). Fix this by providing unwinding
> prior to the devm call being registered and moving the devm
> registration to the very end.
>
> This should fix calling del_gendisk() if nd_integrity_init()
> fails. I only spotted this issue through code inspection. It
> does not fix any real world bug.
>

Just fyi, I'm preparing patches to delete this driver completely as it
is unused by any shipping platform. I hope to get that removal into
v5.16.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
