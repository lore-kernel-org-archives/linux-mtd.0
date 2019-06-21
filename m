Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A060C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 18:39:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C17692089E
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 18:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SLr8zWIb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJzR+dy0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C17692089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5L0zt9jwb+fHpkEcfl2sHyHPMOmEuGcMKSBpnPbz7M=; b=SLr8zWIbra/XMm
	K4fUMJpC5Iu2tKvIcy3CbaiAQhiPkb2b7VjzHa6umYG2lp4GlCzrMPz5xG4fylj3ghCPtQhhtIZw1
	kKh1Ae52iF6cBfEycQSPNd7ybYf1mcs0AEdZ88Odx+0fIFm0ChRyM0h8qZyQZ9wIpKb6Lx9tbPtgH
	CJznvnP50zaa8jgJFbP7yfgIhgkOcAcI4c69Kyw6PFSL/CZgEQ+VYD5djhrmFELAWgwROE0nOUV3J
	MNaCLvMPHyawd3lU9G3RvPMWyO8+wehpa3x2ZiPco0tIT3hfkU6HRrdYAEwJoSh7zI0yjvUaxEzcF
	AENtr7Zsosoc3rr7+Yvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heORZ-0000zw-1p; Fri, 21 Jun 2019 18:39:25 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heORW-0000zT-6b
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 18:39:23 +0000
Received: by mail-lj1-x244.google.com with SMTP id p17so6855518ljg.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hS3Yn/Pg9Vyd+5OCe8K1axR7QXXqNQHnHQglJ4jWvSI=;
 b=dJzR+dy0DkMGo/KNw8FdearhkB9MkWhVtf4HmC2doL7B9A50yUZRoKw8pCH2PAUT66
 BxIymE241wOVbZFqEU2fbx43gf61UgRA2K1nQ2gNKFkyl4KEtCEY+8YVIQOtHNKbChxh
 bnzeq9Rb5hrMssQmL5s4hq8wv3S2ST5rFy343Xs5IIo4fre5wE7q3MIcvRQA2Tfk30BM
 VYVnH5Qymz0npBGAUq9K1onG8gzFAOjj74APWQ0ZYCncTupuaqcJTcQGubDm6N/jDWKM
 aiIDsyFVRVyHZzctE+Z8/Uri0bNzWbJhJCdue8D167BwIAjWRKWNGHrLwSCn2WLQYy4B
 Gujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hS3Yn/Pg9Vyd+5OCe8K1axR7QXXqNQHnHQglJ4jWvSI=;
 b=M57llQQyY7iTun7cH11lj3Y4b/BD9p6g6ajCcTjMMN7Shl0blAyuRL4+mAwemZMbzb
 PaMLUOgBvLCMmw3YQ93L8KvCeZ0hBbESxa4lVQ54vhEL1syRfOB5JtZtPI0AMfnesWum
 BJeT8nRwWt1h/hqUm2FzQGIBtBNahUC+UTA7aqxvlWooj3WSBiyD0BaLJo65NmJPvVWr
 3cGZa0YeM4BmqKBcoPP/PmTnw2Eqd1mLnt206rCJcQGIRCCNhP2C8vbqEgb2pZ87sX3I
 vV/mbo7r4xQWjA5eZz0zbf+DMTKxm/fzeIn7MdPbSVWCHxxOblBWeuEFGPu6xMf5fu99
 fOFw==
X-Gm-Message-State: APjAAAWZ5lDj1W5rdQTdwfV7NtCZHOxfI/HC6vHq+s5BFe7zHjG1z3rU
 aR0j0gWJXGCJLgDg9IZI3QRclm+oA/A=
X-Google-Smtp-Source: APXvYqw/JndEuye4ZLxyULWluJDgTJxvyVUcMp6X+jKhyOwU65RraTH5t+zspjWXF7qZgIjTvVPWrg==
X-Received: by 2002:a2e:3a05:: with SMTP id h5mr63504882lja.114.1561142360075; 
 Fri, 21 Jun 2019 11:39:20 -0700 (PDT)
Received: from laska.lan ([93.185.27.99])
 by smtp.gmail.com with ESMTPSA id c12sm488850lfj.58.2019.06.21.11.39.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 11:39:19 -0700 (PDT)
Date: Fri, 21 Jun 2019 21:39:14 +0300
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd/ubi: fix initialization order of ubi subsystems
Message-ID: <20190621213914.5b0023fd@laska.lan>
In-Reply-To: <CAFLxGvyvFL6iHOgQzw2wqpTYOTY8eW57ORuVQnkjn+Gmub=cbQ@mail.gmail.com>
References: <20190620132753.19538-1-mikhail.kshevetskiy@gmail.com>
 <CAFLxGvyvFL6iHOgQzw2wqpTYOTY8eW57ORuVQnkjn+Gmub=cbQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_113922_271532_4B01455B 
X-CRM114-Status: GOOD (  17.86  )
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
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 21 Jun 2019 19:26:37 +0200
Richard Weinberger <richard.weinberger@gmail.com> wrote:

> On Thu, Jun 20, 2019 at 3:28 PM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@gmail.com> wrote:
> >
> > during ubi initialization we have a following calling sequence
> >
> > 1) ubi_attach()
> >
> >    ----------------------------------------------------------------
> >    err = ubi_wl_init(ubi, ai);
> >    if (err) goto out_vtbl;
> >
> >    err = ubi_eba_init(ubi, ai);
> >    if (err) goto out_wl;
> >    ----------------------------------------------------------------
> >
> >    As we can see "eba" subsytem is NOT initialized at the moment of
> >    initializing of "wl" subsystem
> >
> > 2) ubi_wl_init()
> >
> >    it call ensure_wear_leveling() at some moment
> >
> > 3) ensure_wear_leveling()
> >
> >    ---------------------------------------------------------------
> >    e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
> >    e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
> >    if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) goto out_unlock;
> >    dbg_wl("schedule wear-leveling");
> >    ---------------------------------------------------------------
> >
> >    so, if no wear-leveling is scheduled than everything is OK
> >
> >    and a little bit below
> >
> >    ---------------------------------------------------------------
> >    wrk->anchor = 0;
> >    wrk->func = &wear_leveling_worker;
> >    if (nested) __schedule_ubi_work(ubi, wrk);
> >    else schedule_ubi_work(ubi, wrk);
> >    ---------------------------------------------------------------
> >
> >    as result we enter to wear_leveling_worker() function
> 
> Well, we schedule work, but don't execute it since the ubi-thread
> is still disabled.
> 
> Can you please share a little more about the problem you are facing?
> Also produce_free_peb() should not get called at this point.
> So before we flip the order of initialization I'd like to understand the
> problem better.

We faced a cycle rebooting in u-boot during ubi initialization. The problem
appears approximately once per week on a random router from our test farm.
We never trigger this problem in linux (only in u-boot).

From the other side ubi code in u-boot is almost the same as ubi code in linux
kernel (it backported from linux periodically), so it make sense to fix it in
linux as well to help with future porting.

PS we send the same patch to u-boot.

Mikhail

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
