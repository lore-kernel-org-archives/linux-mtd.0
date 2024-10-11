Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5047BD24477
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0ZsNbQQDEIMs7DETMwcY1niOO170IaY+ILFkKgNsps=; b=vk4MjCfr0IVy8c
	J0eTlYlGy8eLFxo1m2JIxMpomVrhz+TO9+n3cD5KG/RKXdcEgbn8D1AZMYNX1HSuO4f0+1iU5WP/h
	vWjDgJKKKcYTbizjGUw9Dm1DsfoNfJDQmVRC50/BiqIGtB+coJ/f1wMAoILPEejwY5b5XRdurx1JO
	nRO4ypadC0KwgzOKPnXTPJy9C6csImQbYqmlT2IUO+7hvf8zxxvM6XAIurcfhawA+/biiKKYLRJB8
	lImJXUUupgSoDJWDcx5eGiV8Mx/5Su268kHJCSgcCJkH2Pdz7yF3nyN94NJBnlM4KKN5pQO9fmZ2v
	tkR6OBisagD6tGn55FcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz8Iw-0000000FJP6-3EVT;
	Fri, 11 Oct 2024 05:35:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz8Iu-0000000FJOo-2Vf5
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 05:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AB1EA44F19;
	Fri, 11 Oct 2024 05:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B72C4CEC3;
	Fri, 11 Oct 2024 05:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728624906;
	bh=EzwkqNZrlJLyElgrPq1WFgO7iWG3Z6QM+/UrNYPT1n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKuhK9SOVKasXYwTQdwkUz5nUJTiNfacQNQn04AYCZaVO01mJ5GveiPNFHYB7v+GN
	 FKaTJzhupBfpWHb5gyV5kO3y3GwNDL7xGm20HHQDYKX7ku8LzwgA35G6thCUrzl1cU
	 Nawf5SoI6/nFbTk4/vQl+YYh+UEiDPiJks7T2kPQ=
Date: Fri, 11 Oct 2024 07:35:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at,
	miquel.raynal@bootlin.com, Zhihao Cheng <chengzhihao1@huawei.com>,
	vigneshr@ti.com, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com, Zijie Zhao <zzjas98@gmail.com>,
	rafael@kernel.org, akpm@linux-foundation.org
Subject: Re: [Linux Kernel Bug] memory leak in ubi_attach
Message-ID: <2024101141-mooned-crestless-8ce2@gregkh>
References: <CALGdzuo8_EXr4aUAw6X9S+yzMPi25Y82netPLWsd+3n-Ov9Pnw@mail.gmail.com>
 <10779b09-3413-6374-b4a1-1efd8821c5f2@huawei.com>
 <CALGdzuryBbCqGAhox9ZWaQHD5dSQNApfGmCP+rYZ7O4MCRH+rw@mail.gmail.com>
 <7138a98c-1562-3059-07b6-4d918bec9d1a@huawei.com>
 <CALGdzuokUpWhUk7uvWcDT2tXRRMk07dmKGS-rFANOE6ZwZZW8w@mail.gmail.com>
 <0171b6cc-95ee-3538-913b-65a391a446b3@huawei.com>
 <CALGdzuoWvy5WvpttC1pab309kZ9cUyfT5O7JB8VjsqwU2HD0Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALGdzuoWvy5WvpttC1pab309kZ9cUyfT5O7JB8VjsqwU2HD0Xg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_223508_791409_D918439F 
X-CRM114-Status: UNSURE (   9.67  )
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

On Thu, Oct 10, 2024 at 08:23:22PM -0500, Chenyuan Yang wrote:
> Dear Linux Kernel Developers for UBI and Kernel Object,
> 
> I am writing to inquire if there have been any updates regarding this
> memory leak issue. This issue remains reproducible on the latest
> Linux version (6.12-rc2, commit
> 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b).
> 
> Thank you for your attention to this matter.

Can you create a patch for this as you seem to have a good reproducer
for the problem.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
