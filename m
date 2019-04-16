Return-Path: <SRS0=Gd7z=SS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE6CC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 20:31:53 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9522C20880
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 20:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SliXyDdC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrVovOzU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9522C20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9SNku+PYfDbrhc08Cyg5QVUrdQVeY+ZLmCbsaYPVW0=; b=SliXyDdCZavYNE
	ga7AOYGwz0i5CH4ukkpuNod8n1pWyP9iHbTWe1avx9NNzoVwOYZCT7cFzqeV9oRspEJ0JnAcZn9oR
	Hvr3gINfNRODT2GoVSOpd+sKacwL/qCEa2V9o0R6ei8aCeJkH/QwJY9fPh0ilcQgRvdJ085m+8Bja
	uCQYi7LpM2HYiolYyQqkr4jjNPVWZInIZBOnpRkuwcZSyIwsxgAwkk7px3mQym6D16UM2HjJ3+D88
	RQz8pOUs3VUl32jtGU1gToVFdATZlt2kORnp5Atbt6JJdt05rEU9D/gjp1y1zciEV9Q1Z8A9dZ9Oc
	AqXlkHpcpiwJKbgih6qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGUk2-0004N1-EK; Tue, 16 Apr 2019 20:31:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGUju-0004Eh-40; Tue, 16 Apr 2019 20:31:35 +0000
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCBAC20663;
 Tue, 16 Apr 2019 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555446693;
 bh=guNqNmDD90m6Dxpy5lwwkbAOV+qQQDQzRqzAmRH6YIY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rrVovOzUYGfP61k5urmNDdXALZi/woXaMj2Scx68wYp07N6NQVVJo6WjBL7MXozQR
 zlJ3I4IErCi92KnrUW0cPNPoTw5fEhmoBu8zERbmdDlmr6fQDljhTsKgWnePw5ojdt
 3kgROB3+0M12LauMWlIf3+eIZqMo2Blkb2GHCnkQ=
Date: Tue, 16 Apr 2019 22:31:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 09/26] compat_ioctl: move drivers to
 compat_ptr_ioctl
In-Reply-To: <20190416202013.4034148-10-arnd@arndb.de>
Message-ID: <nycvar.YFH.7.76.1904162230560.9803@cbobk.fhfr.pm>
References: <20190416202013.4034148-1-arnd@arndb.de>
 <20190416202013.4034148-10-arnd@arndb.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_133134_176012_A87DF562 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: linux-usb@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-mtd@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 Jason Gunthorpe <jgg@ziepe.ca>, y2038@lists.linaro.org,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Jason Gunthorpe <jgg@mellanox.com>, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Willem de Bruijn <willemb@google.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 16 Apr 2019, Arnd Bergmann wrote:

> Each of these drivers has a copy of the same trivial helper function to
> convert the pointer argument and then call the native ioctl handler.
> 
> We now have a generic implementation of that, so use it.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/char/ppdev.c              | 12 +---------
>  drivers/char/tpm/tpm_vtpm_proxy.c | 12 +---------
>  drivers/firewire/core-cdev.c      | 12 +---------
>  drivers/hid/usbhid/hiddev.c       | 11 +--------

For hiddev.c:

Reviewed-by: Jiri Kosina <jkosina@suse.cz> 

-- 
Jiri Kosina
SUSE Labs


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
