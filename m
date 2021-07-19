Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A43C12002
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 09:10:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B14D61006
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 09:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B14D61006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFkOIFOU1ma8mvx5kmAQZTujIb8LIw4o2RME0hkRI1I=; b=24Dl5bvl28aUFR
	3rntISe0vdILT0x8AOZg7D4ZuztAsQFBLhO4l82SPg5yvuZJTu7Mxdlb9xH1cSZ7VKvehzaj8Kkd8
	EybgH27OAi/21Q5xVo75kMfuzUYDdo0QsabIVRCHPAoyBgQyuqRwpyUFAdqCKHpVrWnkTFwa4mg6Q
	EhPk29nYE32qG0R0ORIcrqTASKnk+vv3UTOt4Zpqn9NpDjqqj2uTfK/FN7I5XjXy00Lbf5pEbDq9K
	nNSY2+WpVW5DW/rh+0siZUZyqP0/8M0kPtJ8BvwQTTNCXUBCHJyT/w6mwdKLxJGm2KWZcLuA42Xi2
	r1pCnlzPeN7ptHqVIPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5PHn-0091Oa-3y; Mon, 19 Jul 2021 09:10:03 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5PHk-0091Nd-KT
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 09:10:01 +0000
Received: by mail-ej1-x632.google.com with SMTP id hc15so27509814ejc.4
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBSq6zJFuhCvZnOd2gsZfOMT0eqyDUMuVPMMsfBiF1k=;
 b=tyuwkC2PzoZWVuCqm9kCcz3M9SCCkXn/k2TPyTvNUCyrH//h97IumALBHO8pcUpWgj
 OIWRiPnAheYYrXvjryxDIP6hOU9+DElevR87h88njDFs3ujo0voRJaw5/Ll1x8qjwGgv
 zd1xKrFqSC+6ZSuU5Wyn9GEwDDm+eQGmeUJu/ZCU1tnUkp/B08O/yyMYbk60PfjNWBRs
 HtRbPlO/whptCcPo2L3HmnD6a9KfspVqDB+1IKiFAVxZtb9cttM5npNsK/uS0YEHudjQ
 v3detn/3H/nsLpPwP9PVzSAFnGO6NtzfUIcxd+tPhJ0i6uwXc9BWELDB/9jK/hpPQpXX
 GHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBSq6zJFuhCvZnOd2gsZfOMT0eqyDUMuVPMMsfBiF1k=;
 b=ItfBkvAMLuE1KTT77/rXK973y25LmGtG7AXHs511HhJUxhqN7oh1qz2MsQozHTUqCc
 m8JhDp+WYbgtFkch583pAAlgk6TCPYeq9EaWmPwRh/8aIH1uRurc9LGBAYpAozWUAmgZ
 8A3OY+zvdLcPsfNso3Ysw1IOze2Wd0RjhR9GfS0kIAa13W9ZNaDeV4xktuHDES7t2LIv
 BtY1ZKRUQpT/if+FeRJUEB5zPkJR33V1jeDiJhl+W3zdMtpkhfj7ARzpOsUlxn4j+mu/
 rLBiaMF+mR9JMJ7EeTcwpVt6GbxqjRzmG4/x1G6vZno7bCVFUd4w4vaVmkpiPLZyUtjt
 bYNA==
X-Gm-Message-State: AOAM533KVjN2BcQnUTFxLajFPjuas5BMUPOvXRJU01xGhAp2PDUpkvSQ
 b8s1dIOPZV8C/52559ATTGy1RHPLK2n25Bh5sgvP0kvl
X-Google-Smtp-Source: ABdhPJwubtgEMes7Ng29QD5qA/jN51mjW/q7+dtbpcLGkpLbDjrv1aOLcqCXW12Mc7+LVAk5fM+b/NX/9+Yz96jFMnM=
X-Received: by 2002:a17:906:9d17:: with SMTP id
 fn23mr26835249ejc.191.1626685798074; 
 Mon, 19 Jul 2021 02:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
In-Reply-To: <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 19 Jul 2021 14:39:46 +0530
Message-ID: <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Richard Weinberger <richard@nod.at>
Cc: Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_021000_713777_159F08BB 
X-CRM114-Status: GOOD (  13.45  )
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

On Fri, 16 Jul 2021 at 21:56, Richard Weinberger <richard@nod.at> wrote:

> >> My requirement:
> >> To find the checksum of a real image in runtime which is flashed in an
> >> MTD partition.
> >
> > Try using the dm-verity module for ensuring that a block device really
> > is properly signed before mounting it.  That's what it was designed for
> > and is independent of the block device type.
>
> MTDs are not block devices. :-)
>
Is it possible to use dm-verity with squashfs ?
We are using squashfs for our rootfs which is an MTD block /dev/mtdblock44

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
