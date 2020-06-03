Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C28C433E1
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 07:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E41892077D
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 07:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QA5JFhJ1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwDhT0K2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E41892077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUjvH8BVU5GgtihSxqj9/h9XLTG0qf+Egvwre7K/TOs=; b=QA5JFhJ1/f4b8x
	+r4SzTWAUEfcavvYu/PUi4hMXjjbOI7F99+x9EG+5r/E+zQTPTadcBLNrpUCNe1NluTih7vnWfoRo
	BxGq1g2PJYb7VjFawgJw+I1eWElhj8wmAlyulNVWeeHtW9tABbh3vRzLVf3Khpd9sMYTNAsxmSfk1
	ZdQGqA7IFfTAmSHUgK99MLW2sKVhCLC14SagFZpE09qKhkuFSaEh2Ys+bAUDfbH5KIoxs14hsQOTH
	nVYd6kST4M9TDzpmeQkEkBV2X7PGpiHf6VCE9oUf/ifbEggInFb9phK47x3EgUJ70fbXquQcLuT+f
	7qXsv2t9+3jY1ZmbPkOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgNfh-0005tN-B8; Wed, 03 Jun 2020 07:18:45 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgNfe-0005ss-5Z
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 07:18:43 +0000
Received: by mail-qk1-x744.google.com with SMTP id q8so1150104qkm.12
 for <linux-mtd@lists.infradead.org>; Wed, 03 Jun 2020 00:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=upUYfRAA3OB+55Uid8yeg7Ykm1ooNkzjA3YEgCJr99I=;
 b=IwDhT0K292/Bw6J/zj0jh9gBcuBIJl5QMCTXZQwICBLE9l8ck8ixucykHzavVL170l
 GwGcTb8RqvvbWSXOotRntL7qZtuSKCnHcnb+XjMrfVo0ZmWQPH3G0o7IQjNuZIsCFgpT
 KBsy+6Ha+U1JN5ac6VzHaGuSaXiEm/rX8praMgfXOlSkWVRMBTHLhTUv2WDgv1AyuQOg
 M7x0krg0Ab0VmHJZPlaUbvwNxY1sMI43Sx4ovBjHRLtqp6ioG/I/Nos+mdKwzmmLrJp0
 kAm6wrY8i+NcozOWXiE+PkLWhn1nGFisvrcLZgOLMCZsWDxz8Dl4tHopSzHo0XlfEIZz
 8vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=upUYfRAA3OB+55Uid8yeg7Ykm1ooNkzjA3YEgCJr99I=;
 b=Uu53E1VWQZFCj6kTef/wMOBfBhpbIw5gZaE97BMLbrj/d7UJUNBrcdxhl9xQB14yh7
 L6Y4gyGIrijhU2hIN1kANdS8GYd+DjTe+AmuU7TrIGm2fjkephoIbjj636OpFkNaLwLL
 H7I08KIz5sGkcy+prA7hwm/9fzQosW1ak5kzCU9gWlIvFV3TRdFM181AsOdTFIiAb3/9
 IQOBW8b5fZb2MyD/7TPMg/zwab9HGFmEQyXuycq72X+0mQsuDIouOWJWg7W+QPSBROCE
 67Ox98/JdR1cZavMpDzd9/uVdPOLPTjjkkOKea119GuP7B14YLHGEzKjgDp+YSaEEudS
 Uo5g==
X-Gm-Message-State: AOAM53055dn8VcEEoMY9BIe9JmV1jq5Dd1UkiuRyGe20+lF3uqlXrkkm
 8yT9vKKpb6xqtWH+PbRauXLiwhj2gGWlNMK9GxIvYX66
X-Google-Smtp-Source: ABdhPJw8caa0RkmT/kcE/lPlKwmQw7I0GVvEKAwuuSomY0LIBhKDbsb5isrygm8OpzPqI144baZWIiqEMdxh87QEAYo=
X-Received: by 2002:a05:620a:15f4:: with SMTP id
 p20mr26731572qkm.283.1591168720536; 
 Wed, 03 Jun 2020 00:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200529033809.113516-1-lizhe67@huawei.com>
In-Reply-To: <20200529033809.113516-1-lizhe67@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 3 Jun 2020 09:18:29 +0200
Message-ID: <CAFLxGvzkMp3JJHiE3g3LrxVJUgh2Fj6tbGFPSdv-1W2PiYqGjQ@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix nothing output for "ls" command
To: Zhe Li <lizhe67@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_001842_226702_7D5C1B83 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 29, 2020 at 5:38 AM Zhe Li <lizhe67@huawei.com> wrote:
>
> Recently I find a bug that I get nothing with shell
> command "ls". The test steps are listed below.
> 1. cd $JFFS2_MOUNT_DIR
> 2. touch file
> 3. ls
>
> Finally I find that when command "ls" going into
> function jffs2_readdir(), it get non-zero return
> value from function dir_emit(). So I get nothing
> from "ls", absolutely.
>
> After checking my file system image, I find a raw
> dirent node with nsize = 0. The full_scan mounting
> process do not check nsize and the return value
> of strnlen(rd->name, rd->nsize) carefully, which
> causes function jffs2_readdir pass 0 to parameter
> namelen of function dir_emit when we use command
> "ls".
>
> Of course it should never happened to find a raw
> dirent with nsize = 0. In my opinion, this abnormal
> phenomenon maybe cause by bad driver or bad medium.
> But for rebustness reason, jffs2 should handle it.

Well, if driver or medium are bad, the filesystem will die and lose
data. Instead of papering over the issue and delaying the inevitable
loss of data, please address the root cause.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
