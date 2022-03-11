Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC406C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaKn9qhWxdX80W8BHU34Fz+KJNJM+48zQZhxHMqe4zk=; b=ARPMXEsqJfLN6w
	AoiWmjNpHGr9MbF3RQ93q9SdbR45SmW40bL8howhznJh5vcxkgp1OSKY0IPXCq46/RkseIvfVyJwh
	8od39ltdtpZfWfQ5ursr45r02gjWuNCpNvQa9gJnZbCXrB0z0Q89yGOIfwqiZi+VVT++fzyAh3HBb
	sGwwb7vf/+nKzQW+d1OZWTmOtTSi8qXsdIh7kh/MElqLlXx7LGzH5m8+0hcJPJUE7PnpVEVk+6ToQ
	r6OUDmxukLPAfkrQdGc29dYi2lmHRDf2xdzx44wvEIXNPMJKwWFBfC5h727teSk8BOJ9Jts+I22nY
	EDh46ZHxZWgOjgvPD7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nScGh-00FvZZ-Ko; Fri, 11 Mar 2022 10:13:07 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nScGd-00FvXr-SA
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 10:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1646993584;
 x=1678529584; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=StZfRVd0d1zSRSJuYQP+XpRtxzfPsHSLjEbIXgq6bj4=;
 b=EqXoqNOH9kokBGlWYxu5WfNIjQPDZPjbC3XVX+wLKvT4CglDseti2Udt
 trPM12lidWXvXn08tfrPZlxVDVXNHYT7oRVxVskhJKDkCtuJb1ic3JydP
 w6cxY+WBk0V3rRKexcSefuvdNo1wyVMNdhQr8kR+CWspJMDkTqqMqWCJf
 pBlj4y3Z9KUZUnwGoZslgOj6/0yiCnR+7AeC7m4/gJVzQaR4oIoXxzgXX
 35pKj6PI7hsMUUr7pT4knL1PgbsZEPWBWdxl2Xnn3u/WZz+Pa3moxOsCC
 spQ1HWqp4G5yzfDxlIewYmQ5X2xJySNNHqSoI2H5j0uApb0jSGLrzN5He w==;
Date: Fri, 11 Mar 2022 11:13:00 +0100
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Rob Herring <robh@kernel.org>
CC: "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "joern@lazybastard.org" <joern@lazybastard.org>, kernel <kernel@axis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/4] dt-bindings: reserved-memory: Add phram
Message-ID: <20220311101300.GA32274@axis.com>
References: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
 <20220307141549.2732179-3-vincent.whitchurch@axis.com>
 <YipmkgOuLZGVqH7S@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YipmkgOuLZGVqH7S@robh.at.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_021304_260416_54468411 
X-CRM114-Status: GOOD (  15.33  )
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

On Thu, Mar 10, 2022 at 09:58:58PM +0100, Rob Herring wrote:
> On Mon, Mar 07, 2022 at 03:15:47PM +0100, Vincent Whitchurch wrote:
> > Add bindings to allow MTD/block devices to be created in reserved-memory
> > regions using the "phram" driver.
> 
> What does 'ph' mean? Please define somewhere for the binding.

Judging from the Kconfig description it means "physical", as in
"physical memory" (as opposed to virtual memory I guess).  I will added
a note in the next version. 

[...]
> > +examples:
> > +  - |
> > +    reserved-memory {
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        phram: flash@12340000 {
> > +            compatible = "phram";
> > +            label = "rootfs";
> 
> That's an odd example...

If it's the "flash" name which is odd for RAM, that's mandated by the
mtd schema.

If it's the "rootfs" label which is odd, I'm not sure I understand why.
I use this feature to pass the rootfs to the kernel when booting from
RAM.  It is much faster and requires less memory than initrd (which is
on top of that being deprecated), and it allows the same disk images to
be used when booting from RAM, unlike initramfs.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
