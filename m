Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9B0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 18:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 767A26101D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 18:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 767A26101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcIZOvPsmL8Q/AMfJhpgpV0cqaIS8pgBl50HUOYj+VQ=; b=fbBrQwFv3Ns4E8
	q3X+mNy+Mb/WEQ6avQVk2rdmDGQj2PP4v/M+yqUaQ3lepBHZi3F1/rGKZGLZq98sePVWPPB+2UfAb
	f5Kz6YpC+txd7SpURVMVM5n3mwqLX5tqM07Yb06mx3czDiv7zLGXUjgxzQ9k5aZ0mvLtVbVPndSm/
	GAWQaz0S/MsZ3i3Zi9+4kXpXkrJs5/m3XJ9JyDxTVqqFhBj0uVLMDEekRhDqw38LIR269fVGcLg5N
	UTocKEFv29hJoVSi8cxNWvIjABUoq541KFYI3sd+S2nLlJyFoZjWZ0pPyUmAgvfWiLNcNiM6i9Nds
	kBCZ1J8bjQy7t1/rMMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maMqI-00DnQv-EM; Tue, 12 Oct 2021 18:49:38 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maMqF-00DnPg-K2
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 18:49:36 +0000
Received: by mail-ua1-x929.google.com with SMTP id r17so505454uaf.8
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 11:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4kUtfp3H5GSUAINL9ZlTXdmm6nQlA3alJD1HkhEN17Y=;
 b=BE9TkAn9CWkILNMSxRZNrL3BucUaTmKja+sHQ6rTl7VvCv7FS9cbOSYE6f3P7uSGcu
 yG39yakmvYSkDoQtQNnLcuHY6bX2aEDXsrW8GF4OeM7IIOdA2J3yPcEwM+zI143xNuTo
 kLeEYDFaWFLj4ujpxYnc9altRsZWN2EZDOXN0M2Fr7ZYEFbXOBUwthx7OBlnzG+9wcMV
 /wWj/AoS5nc7dxR2+3MbvGSwMeAhBxqlYV0T2g99TftJN30wXmLu8lzng2X1tSL2vYJQ
 bPmSGHIpR+zek9qqvXjeV5mZe3/wZFpACrCbEPKa55PznZa6KZFsaW1PiThR2fEOfbxc
 bYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4kUtfp3H5GSUAINL9ZlTXdmm6nQlA3alJD1HkhEN17Y=;
 b=22x7kMO06tWx3OOhJ/xdxAVwPYvEptIfkPM62ACG5UdaqL+NRQfkHKAinPejVRm2Th
 pc+cU90HUXTDG2X+STFQ/WZQbGBLkSWj0rf+aQRe2dLMggfeWT5PbXcXDAKthbUaGbY3
 y/MFrFB/qlDgCqTHGJuC+YeHAWxUeYeeCBfVIetRW+3nGKpkt7+nePX7r4QBS/0oeJqT
 zyLT6BtxLkF+PW3Lul4zJ0kStXEcIRTTq2vroZREktv0ugumz+IW7QoTXBHgd6R2Qu7V
 g9PQH+f+pGgzBejEs+ZgCXErFO/bkxfL7dgRVtepqRkFcLcG5SdjufHy7+Zmu07iTRJ3
 CWJw==
X-Gm-Message-State: AOAM532he8NtWtQn88EcMYxHbRU8wl1Q37AP16+GXZhr1RXE5+bHwGT+
 5V6VlJ+sAQ/lZZYzSFw76octd3/gEaR4NkjwH5S5XQ==
X-Google-Smtp-Source: ABdhPJxP6PaDnpfe1GV2kJAHss8zrzOzBgcuTdv/5lJXJJnABkEoHAt2AvoHY8ikK5qYw27oeMpZvAAlX4n70PaT46c=
X-Received: by 2002:a67:f74f:: with SMTP id w15mr32770975vso.61.1634064573327; 
 Tue, 12 Oct 2021 11:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-2-mika.westerberg@linux.intel.com>
 <CAArk9MPWh4f1E=ecKBHy8PFzvU_y_ROgDyUU_O3ZQ0FuMhkj5Q@mail.gmail.com>
 <YVqOjF/xjqFV+Dl3@lahna>
In-Reply-To: <YVqOjF/xjqFV+Dl3@lahna>
From: Mauro Lima <mauro.lima@eclypsium.com>
Date: Tue, 12 Oct 2021 15:49:22 -0300
Message-ID: <CAArk9MPY+rCQse+JXtvb4KqunN9FZ=toK_v=PV-ro4cO6=5s7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: intel-spi: Disable write protection
 only if asked
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, 
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_114935_684000_45144528 
X-CRM114-Status: GOOD (  18.51  )
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

Hi Mika

On Mon, Oct 4, 2021 at 2:18 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Fri, Oct 01, 2021 at 05:23:23PM -0300, Mauro Lima wrote:
> > Question for maintainers: With these changes is it safe to remove the
> > *(DANGEROUS)* tag from menuconfig?
>
> I don't think we want to remove that. This driver is not for regular
> users, at least in its current form.
Do we know why this is still dangerous for the user?
My plan is to make a sys/class driver to query write protection status
of the SPI, this will be
used by fwupd to gather information about vendors, also should be easy
for the user to use
'cat' and see the information from userspace. For this to be possible
we need kernel engineers
to compile the kernel with this driver enabled, but the (DANGEROUS)
tag is a no go for most
of them.
Is there anything I can do to make this possible?
Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
