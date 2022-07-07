Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A93C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	In-Reply-To:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=6YPnmLOGXCyVzFExCLJLBlhK1osO3wW8jHVF/dsjtZE=; b=3uE
	NfTOPukKvo0ftcSSHjf4eW20EJgt+HjxgtSY1408PkfrD3ozAJ2fN69ANXe/ciyvEuqURs1m26uKs
	UsK6rKawjSU+A88zKiSzXZj6CrM/LX05rV4GK1qNZ+62YH/WLsp06NzVoVIkgvjF234tNgXI8BLKZ
	3C7SjfQNWfJM6BPoMWPPyg80M6q7UQEyZmnyLzRcnYDcfNlXcxJNkWSy2PGJZt39ZEmGnO8h/C3no
	Iyr1v9Iuw3WBYPxPTYNn0kwrOvl8rME9XxaYsYnKOxjYar0VPbjfgil/gqTQDDLzT1bMoPeok1Fno
	Y+iWHuGGgRCG3vcSRWT9aS0NBQwXcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9U1i-00GsD3-GI; Thu, 07 Jul 2022 16:06:50 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9U1f-00GsA7-Ot
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 16:06:48 +0000
Received: by mail-il1-f197.google.com with SMTP id l4-20020a056e021aa400b002dab8f7402dso9591908ilv.18
        for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2022 09:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=Ef6EaxbhRWWl9yGrcwKYUAdX/pBweihX45OfiVsisKs=;
        b=Sf7P3W4MMvdB/hI1moGUztmRjeuyBznYtv7F9O5OiX5h06anMXLDjSMwjN0Xnss6HC
         gIKgj64+qJnUA9iUKu57Px/qvfDMI3jvs07l3nONtO1bMC2fSx843ZWeJtmEOzd7PnVQ
         Cd2y/9wcGlCYvt59OV6dMI7ZXCMspvyr9ZU25GElHQZeHo7NC/JF0HMQSDfp/jErbXmW
         9EMrWywrVs9WsJrHizfpu4bEEbsvNjNFn0eGc5dhcpz4ja9V64UT6q76jmDps8B4ZfZw
         ly6zW9owdLm/mJBkMnK47py8cQUD7TX2bBjNbUp3tm1mDe4HVRCsNMMszt+dJJyC94rO
         hEAA==
X-Gm-Message-State: AJIora/yyQadJFGlvb+kJp5v8v1aDfkxaM70xC6Sgx7jOraKAD3Ca57T
	zT5D/BQlMkJiOPcJvYr6OQmfGpOTNkjbvVgKApabwgHB6PXd
X-Google-Smtp-Source: AGRyM1vkNnDgKntPM6HUPetN4DNdMynXMRpG/oOB+J/sKZ78p6g+lQqAwILEx+ChV3Fpo28F7D7DSvqk9IFongu276gGFPQ8e6Fl
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1310:b0:33f:1f49:26be with SMTP id
 r16-20020a056638131000b0033f1f4926bemr1563287jad.141.1657210000099; Thu, 07
 Jul 2022 09:06:40 -0700 (PDT)
Date: Thu, 07 Jul 2022 09:06:40 -0700
In-Reply-To: <20220707160545.7731-1-code@siddh.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005fcfa605e339458c@google.com>
Subject: Re: [syzbot] linux-next boot error: general protection fault in add_mtd_device
From: syzbot <syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com>
To: Siddh Raman Pant <code@siddh.me>
Cc: code@siddh.me, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-next@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_090647_844951_F595364B 
X-CRM114-Status: UNSURE (   3.54  )
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

> #syz test linux-next master

"linux-next" does not look like a valid git repo address.

>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
