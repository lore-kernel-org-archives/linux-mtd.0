Return-Path: <SRS0=jI2T=XW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124FBC4360C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 14:31:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9A42146E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 14:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yk+E+699";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MivFx0gN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9A42146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wEaZKs2h6QZoL8FiWW2fdapjGmlOEliedotqNGm5a4=; b=Yk+E+699EHyyWZ
	f9NQ0zLkNKl276qq7lMMwB9SC9sfTMzz4ckntYxZECrIkSEpA7tHze3Gc7IuZbNYb0l6yD5m/VBpH
	8F2+2YbsVs8xNgAh8I1QaDrgO5jLu/BOAiX7zRlGJljUbNPZyl11551AMGjGrlrKbMmkeOQpoWer3
	CIViKVExXvpM2lFiAmFmtmKZd7LImAiz5xYrzRIbdlaEF2bCvKMxmK8KJ5VTU1fPYSWvYSvhB29hY
	1AvcSwFYncP3OfOSBxETBLWogi95WNFpGsBfoENa68TVQgPEHHQpb1yPs/c15Au4uczl2Vk61iiFg
	8fk8xwvDrCbAHv12EnFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDrHK-0007I0-96; Fri, 27 Sep 2019 14:31:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDrHH-0007HO-F5
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2019 14:31:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id b9so3079801wrs.0
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2019 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1FvHYN7wzPpsYkZSNdmXsKNfH9TPXckobvgB3IyusBY=;
 b=MivFx0gNReVHc+sn0cgTfdqWHXeN6haBLVoKf+bfQcPuhr4dytIsXkoHPvDr0JPBgH
 yFMGrBdUXP57VSsIs63MxC/UB+rulKNNf3G8MxAh8WrVXC5wTV1ZQF8755rP64avcpuP
 GqefoUZPeR6KvqYcK1oDX+OAPEkuPstQim4Sbgc/Ftxpb3TL8H6hgXTJ4c7hPQWhOA7P
 hNxlWbPa+DrCtYDxgtbxMPzuwRDkrN9HNuKtHLfzucQN0DCdMLdju8sX1GbJJ+MiLiKC
 4VBKAD6X2w3L5Xj9XIztsY4FLPZLA7lrTWPhJLYFGPO6lraWiAqed1P3Xd65bMHe0OxA
 gPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1FvHYN7wzPpsYkZSNdmXsKNfH9TPXckobvgB3IyusBY=;
 b=GO7X5ZqCM42rwt2NizzqKxe+9WiDP6U5VJUqlsk2/oKUoeR7RS53et7Q7doFgBE9DV
 +V6qP25eoJT9cerwtEDJtqQIpMZJ/eWU+Rr13eu6DqZj1Nekq9FbbfBhtm1/CPLYA+H+
 cIChYrNn/Qxq0r58fxlSGKoszFGEJjf/vtYlWi13aG3xqoREczE7lnpLK01vwzoyWjRp
 uc+qRJZMgqMZzH47hAnDOwWNGGoQbaXQ1IH1t6nFr4LvcQ/P3FnXqI1bjPrkd+cxxRuD
 z6CZAejkXzb4/VM/pV+jLEp7j6x9wLpY7KODlpPcUQJYBVw18A27UgwrXSZMdtNkkt1D
 iZJQ==
X-Gm-Message-State: APjAAAVESp2z0TbZTsj5wvj/jUMKCcqjCxbZcv2GvoYY3/Y/BFb9MJRx
 LMpXvqm4G+ib2YknmzRnKpal7kZ8AFRXpchc8lKevwvL
X-Google-Smtp-Source: APXvYqw24XVo+ys15imY93xBTvbbr5SaXIs3Z8SnPTsv+z4rhCI7aV7OIz81mSluPNmzPzFylGpqjqiMvnYE2afXwJM=
X-Received: by 2002:a5d:5352:: with SMTP id t18mr3410173wrv.72.1569594681520; 
 Fri, 27 Sep 2019 07:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <1fc7208e-145f-aeb5-61c5-cc6a8a8aedf6@mclink.it>
In-Reply-To: <1fc7208e-145f-aeb5-61c5-cc6a8a8aedf6@mclink.it>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 27 Sep 2019 16:31:09 +0200
Message-ID: <CAFLxGvy67vrX9t==UK5U+P+LW=h0aGt_MGFFfAvCspi9GnayRQ@mail.gmail.com>
Subject: Re: mtdpart add/del usage
To: Mauro Condarelli <mc5686@mclink.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_073123_527380_D6A25F4B 
X-CRM114-Status: UNSURE (   6.04  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 27, 2019 at 3:21 PM Mauro Condarelli <mc5686@mclink.it> wrote:
> / # mtdpart del /dev/mtd3 3
> mtdpart: error!: Failed to issue BLKPG ioctl
>          error 22 (Invalid argument)
> / # mtdpart del /dev/mtd3 4
> mtdpart: error!: Failed to issue BLKPG ioctl
>          error 22 (Invalid argument)
> / # mtdpart del /dev/mtd3 2
> mtdpart: error!: Failed to issue BLKPG ioctl
>          error 22 (Invalid argument)

Is /dev/mtd3 really the master partition?

IIRC you can only apply such changes on the mtd master
partition.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
