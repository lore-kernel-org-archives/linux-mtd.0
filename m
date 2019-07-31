Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600EBC32751
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 08:38:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E0F206A2
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 08:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aK8NQEMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34E0F206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PjD39Q4B3TDAL2LjMm+oY73d/VFQp8lcOSaIXuHkDM=; b=aK8NQEMvU1bYKS
	/zqT73l+mNKR9KOYHonkJsucAh6HbN8SK49YYI0ckt1dGz+fSeUmxkwPYNUofrfcGUnnWDmft+dqW
	ijDnN4kmmHUhpnQEfzOATQNys5UTF3+zu+U0Tlo5R18OepNNuI+PgewzQD/GRfBkpfQjqUw8QsV8F
	xX9kNEmQ+MRdNnesrgax2zeJQXI3+j8MBZY3f7q8ZYGdABQND8CDb0nibQTySF1l1yWndu0amIMay
	A/hneQeVaeYg7qhbMy35JJeDn5obJUNf1JrSjezV/1A7Vbnpsxb2AADh36LU5yXDApOJxm0ucO7Q6
	/LzpaTkz5N72mbzpAPKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsk7n-00047y-4j; Wed, 31 Jul 2019 08:38:19 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsk7W-0003vm-58; Wed, 31 Jul 2019 08:38:04 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CD99FC007359;
 Wed, 31 Jul 2019 08:38:00 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30EE16012E;
 Wed, 31 Jul 2019 08:37:54 +0000 (UTC)
Date: Wed, 31 Jul 2019 10:37:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 12/29] compat_ioctl: move drivers to compat_ptr_ioctl
Message-ID: <20190731103751.3cc53132.cohuck@redhat.com>
In-Reply-To: <20190730195227.742215-1-arnd@arndb.de>
References: <20190730192552.4014288-1-arnd@arndb.de>
 <20190730195227.742215-1-arnd@arndb.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 31 Jul 2019 08:38:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_013802_226112_6066F728 
X-CRM114-Status: GOOD (  12.10  )
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
Cc: devel@driverdev.osuosl.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-input@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
 ceph-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 Jason Gunthorpe <jgg@mellanox.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jul 2019 21:50:28 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> Each of these drivers has a copy of the same trivial helper function to
> convert the pointer argument and then call the native ioctl handler.
> 
> We now have a generic implementation of that, so use it.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> Reviewed-by: Jiri Kosina <jkosina@suse.cz>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

>  drivers/vfio/vfio.c               | 39 +++----------------------------

vfio changes:

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
