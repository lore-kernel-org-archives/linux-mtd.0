Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B481099B58
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2026 01:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YntYwbJGjzjEACDBCR4a5bng8qal6zIdSO7cq6WKDEY=; b=g0XIt9NNMdLvDU
	3Fw97coSRusTaVnyIQu6fVGBjvi0qBj9OP5HEMMxRMN0gPN/pzZrO1ks+BaNFUj+WjbcqjDSY6STm
	76PJs3rsGW4rLAUU93XBlNskXoWGhnNCaXsos1wf4fNcuZNIfgOGBhowZRErO6w/Yu79xqrGESYaM
	/+ysLXHoEPem+YoKc5wuMVyG8WY1wXpr7U4SGZusS7Zyh4/W1h+chG+8V9R8GNsNdoGb7pB85vyaz
	8DQyjpDmh5tDHZkpFRxpwkc/0AFwO+pAQSHZZDLIywhetp+hC+nhawJKZX9h7SsfXWmzmdVbOuwGa
	BmL03axgrzeqN/ZGaeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3l1Y-0000000DsUU-3CtN;
	Sat, 21 Mar 2026 01:21:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3l1X-0000000DsU7-2Dfc
	for linux-mtd@lists.infradead.org;
	Sat, 21 Mar 2026 01:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0336560126;
	Sat, 21 Mar 2026 01:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B92C4CEF7;
	Sat, 21 Mar 2026 01:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774056065;
	bh=sFDu7MTIvw/KC9d5DLL4z/6GA5pNlruDO4eiSreCgjI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SJBluO7aBY7Q5/y8Uqg7Xxw6nLIKUtY0mMLTqSiEgLQ8kG0W05CwuOe3gZcTbcV3M
	 aYyrthDGiFAJHr8EKGZ4IjgUu1V3EopI+cVko4J7hHQV0UpxHM8iOtP/vGvfYXx3CK
	 i99aihsIvC5B2V418bCfkgIyBpiHtXQitWDVm8IQ=
Date: Fri, 20 Mar 2026 18:21:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: richard@nod.at, chengzhihao1@huawei.com, hch@infradead.org,
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] lib/list_sort: Clean up list_sort() scheduling
 workarounds
Message-Id: <20260320182104.fc8ec409731591d7021c6777@linux-foundation.org>
In-Reply-To: <20260320180938.1827148-1-visitorckw@gmail.com>
References: <20260320180938.1827148-1-visitorckw@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Fri, 20 Mar 2026 18:09:36 +0000 Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Historically, list_sort() included a hack in merge_final() that
> periodically invoked dummy cmp(priv, b, b) calls when merging highly
> unbalanced lists. This allowed the caller to invoke cond_resched()
> within their comparison callbacks to avoid soft lockups. 
> 
> However, an audit of the kernel tree shows that fs/ubifs/ has been the
> sole user of this mechanism. For all other generic list_sort() users,
> this results in wasted function calls and unnecessary overhead in a
> tight loop.
> 
> Recent discussions and code inspection confirmed that the lists being
> sorted in UBIFS are bounded in size (a few thousand elements at most),
> and the comparison functions are extremely lightweight. Therefore,
> UBIFS does not actually need to rely on this mechanism.

Thanks.  AI review found a now-unused local, which I'll fix.

https://sashiko.dev/#/patchset/20260320180938.1827148-1-visitorckw@gmail.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
