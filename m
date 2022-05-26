Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18052C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 26 May 2022 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9AQQgI/0Q3M7rVIgS9gbQ+UtiCBA9yoxA75GC2i8J8=; b=Ijj3efu9N2jIfr
	owpGZ2YJvZ0qdHb4loAqxFZuBMeKpvPwMyyPDOXNttk/I86PjvW7aY+8dg3UQ3rCpPYkfuCe5sa1P
	hOzEvJoQVtwDexg+awdcSH3ppkUPyX2nT7MQcLhYQ2mKeCawLP7f0T60ZaQNVFJrdkUeDGmddFxgN
	GhVUNJerohLTH8PhCd3ciYfemYRe29B746eZELw4DLKKUd6gI/t5YbiisCMIQ4B9EqrsW0RVkrIPA
	rC8d48+wlb0LXgnLMvjWB3qAZmDHo9HhnWQUH+2dpyter3g5o5kVA+Pr3jJEpNp3KJ5kYyC34UXy2
	upCx3EEPlYMx27z8bkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuEUM-00F7oc-Fr; Thu, 26 May 2022 14:29:22 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuEUK-00F7nT-Hs
	for linux-mtd@lists.infradead.org; Thu, 26 May 2022 14:29:21 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id g72so3273036ybf.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 May 2022 07:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydnp/SkEaNui6oKHTmT2ANWb4DcH7fhI+J8O3cY/vm8=;
        b=lHoB8lWPRbxH8mzNXQ/OqDB1zLwRJRT60HTzLHg49lTanRVW+wFH9jXxaw4Guu5N1g
         +/6P9fIyX4dhl8p0sOnYMqqtWA5Vl6ptE5q31qPpmcW8B4WbSjWuzpUcDVx2FD2Ik+jx
         upku+j0FjvWOzFRmfYZZqGvijEVYSLPQXbUYrt0hvpj6dnW8J0VlSBXd2bZ5Ezr6IOcp
         1NX9ADMUhNk/ZDUhb0/S6jUYf7XYwEzrEvxcM66ESnYna6VQaev7E5it1ashPTkoHHGk
         TNvROvmiYcPNa5O0k64jMN/OXksW+V9Nel8hhLiyIU9YzWw9GaXVQ+W2DBEMWk96cPWU
         FXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydnp/SkEaNui6oKHTmT2ANWb4DcH7fhI+J8O3cY/vm8=;
        b=j4KVqnnrLuUio2d1p696myrfCuWPVPXgHJfcekBcsCT2QKBjlucQXmhi+Uo13RV2rf
         muo4Aurd9I7yWqAApYwxn8I+W1LTjt3iPiQnI/sciCgMmmxQKic+6FvjxJju0LSmNHZQ
         8DbiOIaN4NSiKt/aernRckGKydd1UvDf8zKMeUAHbct5/YOzo+DbIoKmWYg78BOlX56A
         OL9qu/0wBIkT9QzddfFyS1sTjoIzNa3/ugwWW5kWm4RqugOYdKfuQcGz1+Qpe6NipHWg
         P1ibi1aByspoMlo71iRdLvzU86Jpz78a3zULsRFrmqAzvJRwL23iWFHTWuKjSwilzIlK
         HOGQ==
X-Gm-Message-State: AOAM533NydlWZyO8gSpevbmQQM2UXuOMyLvE5Z6OBE6nd3HEQyc1Pu2h
	mZRN9FgthbZ8q6dIM5ALW0rPGdfpFQSPSi9Wq/48Sw==
X-Google-Smtp-Source: ABdhPJzt1NOUwWqS9KMSfdhdmLFRvdVLkaRsRaWTXrveTqJ7fnZnUYJ7debsK2tbIb1BOC6ZpyW3j0vki0nJwktj1bo=
X-Received: by 2002:a5b:691:0:b0:64d:ab44:f12e with SMTP id
 j17-20020a5b0691000000b0064dab44f12emr35447124ybq.533.1653575357508; Thu, 26
 May 2022 07:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220526110652.64849-1-linmq006@gmail.com>
In-Reply-To: <20220526110652.64849-1-linmq006@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 May 2022 16:29:06 +0200
Message-ID: <CACRpkdapKGvc75KV6ryJTLZdWCk=_dNrkzv_g0DnyNJm=1DvXw@mail.gmail.com>
Subject: Re: [PATCH] mtd: partitions: Fix refcount leak in parse_redboot_of
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Corentin Labbe <clabbe@baylibre.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_072920_641137_AD5A9F30 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, May 26, 2022 at 1:07 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 237960880960 ("mtd: partitions: redboot: seek fis-index-block in the right node")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
