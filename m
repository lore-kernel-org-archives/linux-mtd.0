Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F26C43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 17:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2576A20835
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 17:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlDkWA1S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="c9cRJ1QZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2576A20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCcxyNJpq5vv9UXGiE3GZznhsASoqSNjgDS0o1C397A=; b=TlDkWA1S79gJJn
	cKWmgcT5/rvordSD0BtLxaMmASdl/JkHNZhDkk/tyTRjrsN0ufyFhgO2cXlTO3z7wRumwl2TasJ/R
	++BzApALrIw/WgRIZGE2BlFZhFzGs7Sw0JxTGIQ7Sh7DKnzCt8n3FBjggmjhqL5uH+ak7R7xtlPpU
	Mg0lWkorpRCWxqqpm0TeY1tqzrwG2zHSgpe/F415FIhYkJtT2NqTjItakmmpLUFI9JJTb2wBFoqyn
	uMlCfDiRHS6wAcCDntYLM6SpOQxZ5LaYPMlsW+yqPlh12SjF3MIN1m/aGATF67bSpDQIoZwdPghKz
	gA5gy1KV+P+iJGhxG1vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLsau-0000R3-9k; Wed, 01 May 2019 17:00:32 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLsar-0000Q3-I5
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 17:00:30 +0000
Received: by mail-vs1-xe31.google.com with SMTP id y196so4072293vsc.10
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKeHm+YnMFQhnE5COYYd2wTHTYE5yGwHo3lDdnebjM4=;
 b=c9cRJ1QZQtCO0/mYbd0/5i4CUar4BNukWTS+G7jpwqDiNzZNV1I2edB+dOMbqXzfQN
 mhW68V4DfHLuHMdUGgFuw3BtCW6wAMRLTGARVl9g24jKKOObBPLzumTeE6Ku3J/zC/Rs
 3kKoRtXLz+OH40U9zaDIKNjnYtAm3sAsF9MfgJr3YB/1AReKlm/skRORZDQ9HVlkxL+f
 zJz1f4+jYMAYy/PU6bHdIuWRtCw1kB8ks9BemTUwcrrGzu34XCiyKAqYhPCuMUja77PS
 L1YKR17HUUy1neMNs0cNdR37rpUDpDaPudaVB9kgFJZXXZ1cWQBxdLvqV5CVr3BdlKhF
 liLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKeHm+YnMFQhnE5COYYd2wTHTYE5yGwHo3lDdnebjM4=;
 b=M/y8wfBvXwgoc/5FzG0MtJIapiZRPKZX3RKc4XjlLqLxwCEtt6BLQ9m82m8DIgHoHD
 LnZKH2wQL/Rbwg50peyPVpnGEgTDHg6u+36oouvx/a2At2WohTDf92vmshIdXnR9q3W7
 ajdvo332lkCfUF1F7kx3hmWYc8m9p8+ogiIOOTqx9fDBFt9QNc5RALglmqF+cUDD8yre
 ycHi7J2CZiPSOn3u0h2OcS0W4yf/G+7qWA4K22XTzh32Q1ITYt9NiBxZiwHIRMe5lIwv
 /VZsfftFgOJY2Vv2gL6ROWWZT163V5qbZtqAxbuayCtGS6TdV1Z2VJ+aX8cgdQ51cmB2
 feNg==
X-Gm-Message-State: APjAAAURf08+04r3vqDIiGMymLF8oH9rFy+EAId08JW1WnvaAIVAcqsZ
 byE935ooAL4LMiFTtDNBktwUXqJrFRUul4HAYNRD7g==
X-Google-Smtp-Source: APXvYqyUqlL9jpVL90DkvvlHC4IlULAcsEjfbXtupVrOhb+mGnoHYGwhZSQ0zSjaCUnEraTNpHXEENzrDsXLSmJMKA0=
X-Received: by 2002:a67:7444:: with SMTP id p65mr38135332vsc.104.1556730021507; 
 Wed, 01 May 2019 10:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190501160636.30841-1-hch@lst.de>
In-Reply-To: <20190501160636.30841-1-hch@lst.de>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 1 May 2019 10:00:10 -0700
Message-ID: <CABCJKudfkFB4QGp4J6E5r2Td+Wqw0dTYfMZkxVh9DgR7N=JwyA@mail.gmail.com>
Subject: Re: fix filler_t callback type mismatches
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_100029_601814_2B9FABDA 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: linux-nfs@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 1, 2019 at 9:07 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Casting mapping->a_ops->readpage to filler_t causes an indirect call
> type mismatch with Control-Flow Integrity checking. This change fixes
> the mismatch in read_cache_page_gfp and read_mapping_page by adding
> using a NULL filler argument as an indication to call ->readpage
> directly, and by passing the right parameter callbacks in nfs and jffs2.
>

Thanks, Christoph! This looks much cleaner.

I tested the patches on a kernel compiled with clang's -fsanitize=cfi
and the fixes look good to me. However, you missed one more type
mismatch in v9fs_vfs_readpages (fs/9p/vfs_addr.c). Could you please
add that one to the series too?

Sami

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
