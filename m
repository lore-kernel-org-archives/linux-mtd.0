Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E51CC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pB4mgGOiPzLpa6CeJkH7BkWS80bG32xWoQoyVopEo0Q=; b=hn5JKnhGVpVV3Q
	//6bMXpBnlxkKBcocRLnZOO94yIK9wNpY165GZF1U9MbXOiQXfF1qGTFypf/TyR5wNoaH/vByglIk
	rx+aaRWBx+o8u+nQBePiQYFZ80SiFYPeMv/em/CB3CCme9kvqEJ+vTUW7g3i71NouQJOSNbdRMjmz
	gFXefLiBi3QFBTlp6/Vd40uo8NJJtRg20NPmxCAF6GIpgUEv+j5IYiLF4erxMttwrbcnKi0iu+hRv
	8CIxdE/0xcr9KmpzaFpKrBry1ND4bHlP6I+FXpwKusrWThw5yREkFpZBRH3ntYd7nSWktPu+YY4Zw
	hfeiZ6f1cJqO5rGOPoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoZw-001KC1-W8; Fri, 22 Jul 2022 09:04:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoZt-001K4D-Ps
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 09:04:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id l15so1560621wro.11
        for <linux-mtd@lists.infradead.org>; Fri, 22 Jul 2022 02:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=AnjYxt8Eb+V4pviwGNhZjo2QWtiQZcBwXW7dX72r5xI=;
        b=pwlYlZ1qKmcwdLL+u7BfE+CtAq4rQY9SH4aL1lkbuJGR32gcx5ao8yVkagXELiBQ30
         pL02JlfzjuAj9y/EkuM1fNICSAdG4jRt9qNNhKC9J8dACd+XUIhTxgNSZO6feqg+EBbd
         CpWLrW2EHjvlz9NfntYXEM9BdS325K8TzXlTlcDwAQddzUDyPV+xEgx/UTiTwksG0eMB
         P/68Q3sBdp3J3HDzm9mGL0RaGAHBfR5bFa7HcYbGJlsTo73zTa/XY/zf7ySU9X5vGF1F
         AXsDgpheWKmxDIciXHcZwqA8GP+KBF6plGyNP+tj0Be6T/Vyaenigp081KziZGqKD5D7
         3n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=AnjYxt8Eb+V4pviwGNhZjo2QWtiQZcBwXW7dX72r5xI=;
        b=w0NXzoQ1jYd1XCiY0BZ9C4XzUuGjmx4fm7KVEo3LrEqRl3FfuH91frJJNHwp0ddkuY
         X9QXn0mjNOr61dtJRoiiZ8+y3TrSy94LFYQtPiOs6niCvsSJrIcziB/ta27fJJDIkaNs
         hWje58Y/iesOhBwB0L9HBEh3UwryI2OhjZNRMmbpgXUySj6JUL7lj9mk4hFB3pbUjBzd
         m+6esPMUrpKrIHH3cjLjWQWTqBtTD+NbxJZJQYPU4ddewM6UovzygOwyUY+nSoKlPpIL
         btTTImxGhHkm+668bSFBcn9QKJo72NswaIhCPAdcA88Iabo8agnEMN5HJUkjr/fbtU47
         JpzA==
X-Gm-Message-State: AJIora97TwJvWr3aTCpriUjNBIo5QVf9+9kcaeWJXX3Br/pjUs3nqiEt
	BLahKYU5gkgT4qGBzAPmCH8w/G4WR2g=
X-Google-Smtp-Source: AGRyM1trd1DJD/L1X7xHWXtR6xBGsjmqGbRl4i5wRjMhBhaOcKkM9Js5irK4ZDgx5/8fprlfYWME0Q==
X-Received: by 2002:a5d:4b87:0:b0:21d:7019:80c6 with SMTP id b7-20020a5d4b87000000b0021d701980c6mr1715711wrt.234.1658480643532;
        Fri, 22 Jul 2022 02:04:03 -0700 (PDT)
Received: from Ansuel-xps. (host-87-7-207-127.retail.telecomitalia.it. [87.7.207.127])
        by smtp.gmail.com with ESMTPSA id a14-20020adfface000000b0021da61caa10sm3896552wrs.56.2022.07.22.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 02:04:03 -0700 (PDT)
Message-ID: <62da6803.1c69fb81.2a10f.9bf1@mx.google.com>
X-Google-Original-Message-ID: <YtoQwiq7vO+ZS3Gn@Ansuel-xps.>
Date: Fri, 22 Jul 2022 04:51:46 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [syzbot] linux-next boot error: general protection fault in
 add_mtd_device
References: <00000000000040624a05e2a6f2db@google.com>
 <18701775-c174-96ce-31ce-478d8783b575@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18701775-c174-96ce-31ce-478d8783b575@I-love.SAKURA.ne.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_020409_879527_73FA821D 
X-CRM114-Status: GOOD (  13.08  )
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

On Fri, Jul 22, 2022 at 11:34:57AM +0900, Tetsuo Handa wrote:
> mtd_check_of_node() was added by commit ad9b10d1eaada169 ("mtd: core:
> introduce of support for dynamic partitions").
> 
> I guess that sometimes (depending on probe timing) mtd->parent is NULL.
> Please check what mtd->parent == NULL means.
> 
> +	/* Check if a partitions node exist */
> +       parent = mtd->parent;
> +       parent_dn = dev_of_node(&parent->dev);
>

Currently there is thix [1].

Anyway you comment means a device may probe defer and have the parent
still set to NULL? How can we check that?

Return PROBE_DEFER always when no mtd parent is found?

[1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20220703095631.16508-1-ansuelsmth@gmail.com/

> On 2022/06/30 18:32, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    6cc11d2a1759 Add linux-next specific files for 20220630
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1640f850080000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=54f75b620e3845dd
> > dashboard link: https://syzkaller.appspot.com/bug?extid=fe013f55a2814a9e8cfd
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
