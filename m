Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E8CF3383D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2xRy9nf+1o8oeEDem2YRNhkBEtKk7PM6n9ltsPAQVw=; b=QGmsCUwAvERdbI
	2oXIa8tTDpzl33xqmcXkGfa/lMy/RzIyrsRCrQQ+sL58LLqvX6iZ6L49PjwtNjcBlxKNV3F6tI+dQ
	e4aoPHCZq2uCxyswKfDIHaQfkhB55hnwpDyHzzpHiFR7uiL9KA0GIgstrMCSkYEj5a+ce81Nvhh/p
	560lbbgEyK9LfhxrrK6X4XrD5bRfmZaHvA0SJnJulKems8FTd2wipOy7JjTsKFaKfKf3GDKjOXqpE
	/qsHjdKd1I/Gft5fOD4ihbCuKOmM9uq/qCFF5dWJUTuInO1c7SLdTISeopLtkCbLmmO5Q0nuLlB0W
	Ctv+m8SZHEoKTaB0UJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vam-00000006dTm-1IK0;
	Tue, 17 Mar 2026 14:40:20 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vak-00000006dTJ-1KSi;
	Tue, 17 Mar 2026 14:40:18 +0000
Date: Tue, 17 Mar 2026 07:40:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	jserv <jserv@ccns.ncku.edu.tw>, eleanor15x <eleanor15x@gmail.com>,
	marscheng <marscheng@google.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
Message-ID: <abln0mfbHdueNgtD@infradead.org>
References: <20260315193900.218737-1-visitorckw@gmail.com>
 <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at>
 <abhGF65wCbI7CsTm@google.com>
 <abljlKim3-hPngCG@infradead.org>
 <218787364.49542.1773758321128.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <218787364.49542.1773758321128.JavaMail.zimbra@nod.at>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 03:38:41PM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> >> For UBIFS, this patch doesn't alter the frequency, timing, or behavior
> >> of the cond_resched() calls at all, so I am confident that this won't
> >> introduce any regressions.
> > =

> > I'd be tempted to drop the workaround and remove the cond_resched
> > from ubifs given that entirely non-preemptible scheduling models are
> > on their way out.
> =

> arm32 still has no preempt-lazy.
> This is one of the biggest platforms where UBIFS is still used.

Time to fix that if it wants to stay alive.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
