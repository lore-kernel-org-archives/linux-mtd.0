Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA20ECE579
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqJJn9udKQopDlZO/UpJMI3tZA0Py1r5+5HHbrTIQ+c=; b=Mg0Ql1QST+G8jR
	zjdS6JPR+MrV629WMhD3p90uOKZVO+VBk50++8yh7OMDmpozej7pe2tObrHvQSwJst4zxE+SMqID8
	WAwwr/NRfkkfLNhp5GGY5FMCCoOp9Sf/fqMG5Z8sq2DCYPNHK8gWhwiMrr4n9ZWHY+dNkIpQz9l7a
	s62VZMqMkelCGOuEGj0qdCAYmQd6x/RkaodY6J1E/u82lSY28+SSKveuJdbrtJa3NjCUMg5vBpclo
	ZgNzfGHUd4EDJpEbsI389ECG1AxqO5iOqEL1Prxnv78h9CcmTc/CJ7T8KJrZW0SiYEFw1gV0Ok61H
	cRvIpTP4MgQADnpu4KDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne6F-00000001zVg-35ZF;
	Mon, 09 Sep 2024 13:06:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne2f-00000001ykc-3NZ5
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 13:02:55 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a7a843bef98so199620566b.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725886971; x=1726491771; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mMqU87htuX/vKBzsNQkDBJ4RpNR7Zr8uFLI9xAQvGQ=;
        b=aF6SOgoEiOl4KMRPKnazYD38lGXvAMEd8+blZfbZ/NT5GkXOWLKL0KDOIhN7OZoXpo
         Sr/OBy85Diy4TMtCTTjP7kEuU2hP6bP19F2RqmXqk75YGs1GiksJdERFCVzQWCXIzLU2
         X0XRW+50e+cuin6GmV6T4NMNazgn2+zVxuN7E1h0VLqJaaCX4CDN1NkThh5PH1fJHBRC
         zfnAXJ6F4WmLYJiQdGztSyErMkrvr/Eh2YLhKQEryVsv4kbNSo0a7jAQn/pr6QuWgsZk
         rtyoW+EaGdi6jRluF2FFEqTI6XIKoOF4ZwIg5Y6EFr8a7ZnsN3RzmKlTurY8IL8qWF39
         AxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886971; x=1726491771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mMqU87htuX/vKBzsNQkDBJ4RpNR7Zr8uFLI9xAQvGQ=;
        b=fjEhZuG4O5SF1Z4UgdKDl+R5qnyrh7/2jyB24r9fcry7wQzhEwYC3fok2BbvLQXAco
         8DYEPEQoXp31r2SuYLsP0xRpZeO5rfsITcwWyYFh+KMwdDXu6b8wXnS29TmOSB2Nso6D
         J4a7PF86ZvESY36raEHjNcFq0l5GBtrNtZJcAvf0bqcNvneZN+XE5cyVAHWaG8J9SRT4
         ssTG0rDMODoyrxVMrBI5VQQJPlLBuXsgAcBK+WdpZPLKKibPHtCZqj7EUiD0+PtRMJde
         WTmigoXXWtRoBbPNCQNFElrr0HwwNWEBRkLS5jdaKUaOUM3WvB9wAHhwI0V31+uefHaL
         1WgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7KGqagZyYVZlfoOB97xC3I3ECkib2RWF9fCg5M5wXBK48Jg7hriiBxIWXb78T69gp47O7+f7iS+s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+jqyegWDJerE8kTNT1IVuCVWoIew+CyQvLmD4Ex2AwQtugi/I
	I/LHIXvfc9AebwqKc8AeyuXBz466UREIR/WUaF46Hl8DsH5+apZRTivAdfwwXOs=
X-Google-Smtp-Source: AGHT+IGBCWEcHjOnjDa3tv0OU9sQsIWi0rYKMo1x8pgZwqnvO0g9WWezq8axRIpo3yitGDVIG7HaOA==
X-Received: by 2002:a17:907:368a:b0:a86:8953:e1fe with SMTP id a640c23a62f3a-a8a8884be2cmr906103366b.47.1725886971281;
        Mon, 09 Sep 2024 06:02:51 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d54abbsm337715666b.203.2024.09.09.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:02:51 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:02:49 +0200
From: Petr Mladek <pmladek@suse.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND v2 16/19] lib/test_scanf: Include
 <linux/prandom.h> instead of <linux/random.h>
Message-ID: <Zt7x-dJF6RzEByBO@pathway.suse.cz>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-17-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240909075641.258968-17-ubizjak@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_060253_862524_30FB97F2 
X-CRM114-Status: UNSURE (   9.21  )
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

On Mon 2024-09-09 09:53:59, Uros Bizjak wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>

I have just acked v1 and missed that there already is v2.
Just for record:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
