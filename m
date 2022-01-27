Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22349C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 18:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4WmYXftcDXBQH1bN9YifKgB7v1qYoidp930bEWdKQ4=; b=WFKyk73WbLZ/g2
	XvO3HAnOFNajDfM4nRTkneRtU34wbuOkZwOj6rjO9s1E5HHGsxr1DdpkVnJT9NgRtxQZWX9JIrqBA
	Z8r9AnEyt9l5Z0qX8daGVU48VGon8jtkUCDMGIIvKvZvWRjuLAdHA5W0MtNM2eOIcnZqBz6lB12em
	RG5aI4vHg8YLHF9hb/EpWXOouIqaWHWhTJRBad2SUZYKl9kSMs2ksumuXa3cqgIitrDS6NP/1h1UN
	Qo77UTqLdlSA0dRafPdGo/R9+Zedf5LOB8BRsXMTeRBqghLXpSCLpMs52oRyAFSstDDd+G3ISNjTQ
	UXefI2UFbnKxLJ3cAupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD9Ue-00Gpp1-Up; Thu, 27 Jan 2022 18:27:37 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD9Ub-00Gpnj-80
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 18:27:34 +0000
Received: by mail-pg1-x530.google.com with SMTP id p125so2970730pga.2
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 10:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MNivNvUnaKSgwbpns2UVVvnIdkdqtYkTnr6WB2iM4KA=;
 b=gllWnbpFTXspZZKWYL6D48c9RKSRla76rbNqeiKJIyMWso3urPfaXYf5mlKmhLEPv3
 jQwCpWjIxNGi0Z9FulEM0RO5iOavTe4RxwN54bCywkhSZWBTe/tb94ihD2e3PHT7TKUd
 heFlTy9zaEA+v/ID6Ehh6ShWwd1yysTdneZvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MNivNvUnaKSgwbpns2UVVvnIdkdqtYkTnr6WB2iM4KA=;
 b=hu5XfBAKbue4HwVGab0kiXHVvrc611K8dEZIOIFnrYJg4V8mBU8g5sg6xrwPbi2m6l
 jt6HzTqy9869+JWweJLOOzRLbX0xv5uj8CExxugBdE0JbZYhVFgh00dl3ocZjW88HB5x
 g859PS+KeI42YF+6ThS7fk17/fksNG1cODdJeNxAgx0gPuk+brFyWEQaywnRJLZeoj50
 zKbm+O83iPpsj4OD4gGYwoFefAZYsTmQECJnABoPlaBkjgps5QToryVdN9lzeCbMCa1N
 QRl+QxopaTPw6x9uwdwFIymUjG/zRF/siQyZWFCaGmvkK2Gp1LtIzy4mSyoy3M6C8hEV
 jtCA==
X-Gm-Message-State: AOAM532JeQUv71njftUCq0sC2ejYZjro4h9sOkXSV0nbOY4SElkFiZo8
 7ACHX0lS3OQwY+ujz1ZLefLq1oxc2nNKNYDcGxgrkAlpuQ7GMg==
X-Google-Smtp-Source: ABdhPJyvr4XXBdjJYE2+bPzEi7tzwtlCduA2yyQMlSEcrrOWF+pcjcs4b1mo2C1oHfWzkn1FHwI3cX8JzQl+5Sbuxvs=
X-Received: by 2002:a05:6a00:7ce:: with SMTP id
 n14mr4408175pfu.11.1643308048948; 
 Thu, 27 Jan 2022 10:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20220126073227.3401275-1-chentsung@chromium.org>
 <8625876c695685fc5409997403130194@walle.cc>
 <CAMu4cy5onQ2JNKhoLVmR4Nb7Cqv2L59SoE=2Q9CK8bhfPvvHTQ@mail.gmail.com>
 <ea37e84c8c83350d089c6c9ed4474851@walle.cc>
In-Reply-To: <ea37e84c8c83350d089c6c9ed4474851@walle.cc>
From: Chen-Tsung Hsieh <chentsung@chromium.org>
Date: Fri, 28 Jan 2022 02:27:17 +0800
Message-ID: <CAMu4cy5qkxuXnPnS5TsLYp3ME0jruaUWLt1QOSmZR78BzYVQzw@mail.gmail.com>
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_102733_319576_E43E1039 
X-CRM114-Status: UNSURE (   9.85  )
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

On Thu, Jan 27, 2022 at 5:18 PM Michael Walle <michael@walle.cc> wrote:
> Ah that ring a bell... Anyway, could you dump the SFDP data please?
> See [1], you'll find the files in sysfs. I wonder why that flash is
> using the 16bit write at all.
>
> [1]
> https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

Dump SFDP data:
# xxd -p /sys/class/mtd/mtd0/device/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0344eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14c4e96376337a757a75
f7bdd55c19f75dffe930f880ffffffffffffffffffffffffffffffff0000
f0ffffffffff
# md5sum /sys/class/mtd/mtd0/device/spi-nor/sfdp
5294c4d4eb2b1c89c6fd8573d8ceaa2d  /sys/class/mtd/mtd0/device/spi-nor/sfdp
# cat /sys/class/mtd/mtd0/device/spi-nor/jedec_id
ef8017
# cat /sys/class/mtd/mtd0/device/spi-nor/partname
w25q64jwm
# cat /sys/class/mtd/mtd0/device/spi-nor/manufacturer
winbond

"bfpt.dwords[BFPT_DWORD(15)]" is 0xff5df719, and flag
SNOR_F_HAS_16BIT_SR is set here:
        case BFPT_DWORD15_QER_SR2_BIT1:
                /*
                 * JESD216 rev B or later does not specify if writing only one
                 * byte to the Status Register clears or not the Status
                 * Register 2, so let's be cautious and keep the default
                 * assumption of a 16-bit Write Status (01h) command.
                 */
                nor->flags |= SNOR_F_HAS_16BIT_SR;
                params->quad_enable = spi_nor_sr2_bit1_quad_enable;
                break;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
