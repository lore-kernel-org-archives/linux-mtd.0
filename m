Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140EDC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 14:48:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658F1206F9
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 14:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GK/s7hEn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWoPDQgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 658F1206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=foknoYahVLi7OEw3k5TaAg5T7V4yMW9EvOg+Tv5YYmA=; b=GK/s7hEnSm7FpJ0b0F0R7ZF/L
	V4a9q2r46Fm4Sle4Axstt3t5lljEryeFE2dh6BsLwgE91mbOKcPcKcdZ1EvfuK2MPkMTt+LEmphY6
	tlft6yoQEvxDvkTiuSrI25wuTOruh/2W9Q3HuaSwFR/ugTo6aj+uto76CibA7VZ/WNOUdD1Zh/629
	PdJ8qhaSwODl951YZuge4w4tcuGkJrnfmXafypDLFOICpNZb5iCu5Mjfs1CpVTRnFSoIoGT5Ds+iz
	npaC1EfmXNgDaoZG3UZNQtPw8pTX2bK6U5hkfXf0N1x6Sj+WWijk5dFHp14rB20yN8YjXgHAE1Ay4
	gKAWqQJLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khZbo-0005ao-Or; Tue, 24 Nov 2020 14:47:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZbf-0005WA-HV; Tue, 24 Nov 2020 14:47:48 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5073206F9;
 Tue, 24 Nov 2020 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606229266;
 bh=KHWIOvsVxIgxzJ3ANvrXr+IcifXvCH3d9eC+5p4MJwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tWoPDQgvsKVPCfxibPNl9c0zBQ9NfBrnsDyv8UIAtPJxHLfF4o1CuP3vwUt19y/P8
 Y66kkjj2Cim4kMyRQiiYzb1whNr+v/N+nMKfcHqv3RaX8mBnUDrFmNddDbw9/dIVnH
 xirANyC4hb8bYXXRvxw8qG9eYp8JWf8UX9D38PQM=
Date: Tue, 24 Nov 2020 08:47:54 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201124144754.GL16084@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <160616392671.21180.16517492185091399884.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160616392671.21180.16517492185091399884.b4-ty@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_094747_780810_FAD2BCE0 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 dm-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
 Nick Desaulniers <ndesaulniers@google.com>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-rdma@vger.kernel.org, bridge@lists.linux-foundation.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 oss-drivers@netronome.com, linux-mmc@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 samba-technical@lists.samba.org, linux-fbdev@vger.kernel.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 linux-ide@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, GR-everest-linux-l2@marvell.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 08:38:46PM +0000, Mark Brown wrote:
> On Fri, 20 Nov 2020 12:21:39 -0600, Gustavo A. R. Silva wrote:
> > This series aims to fix almost all remaining fall-through warnings in
> > order to enable -Wimplicit-fallthrough for Clang.
> > 
> > In preparation to enable -Wimplicit-fallthrough for Clang, explicitly
> > add multiple break/goto/return/fallthrough statements instead of just
> > letting the code fall through to the next case.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [1/1] regulator: as3722: Fix fall-through warnings for Clang
>       commit: b52b417ccac4fae5b1f2ec4f1d46eb91e4493dc5

Thank you, Mark.
--
Gustavo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
