Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4314FC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 02:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zR3EltElQZtasimGj8z2geUOdROgQ28jzGPiXZ9vjzY=; b=AsFTyk/xM7iwMk
	OwZKmkuXONxPAMYMbY1y18QXG4TF7y/QY0Qto0b6ntn7C3vNmaYwyyiVxdfh69kG4SHI1eNNK3Y1N
	zKw1m/TGlaGVx6irj3uuON/Pucnfub+C+uqcPIcXUuU1pacrpKSExxXku3V7kEp3eUOf0rJdBeXzC
	loz3/UrktoaHUz+DYyAZFCsKYaoaD2/hN28jvm9U9+MGNo9E6JfMWBobjo2yrhWH5V04Md13SQXl8
	2UtlUC5otdi0/H0QhAQOK6YRAR+3PDm4/9aR7QydXIhM+hQ2+/OQjwngI7okt5aofmDfqohDYrTO0
	BGqBpXW57VoqnInnebZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiVa-00GwNC-Rn; Fri, 22 Jul 2022 02:35:18 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiVV-00GwJL-Fv
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 02:35:15 +0000
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26M2Yw2W049849;
	Fri, 22 Jul 2022 11:34:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Fri, 22 Jul 2022 11:34:58 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26M2YvQu049844
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 22 Jul 2022 11:34:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <18701775-c174-96ce-31ce-478d8783b575@I-love.SAKURA.ne.jp>
Date: Fri, 22 Jul 2022 11:34:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] linux-next boot error: general protection fault in
 add_mtd_device
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <00000000000040624a05e2a6f2db@google.com>
Cc: linux-mtd@lists.infradead.org
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <00000000000040624a05e2a6f2db@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_193513_797942_A92980E2 
X-CRM114-Status: UNSURE (   6.19  )
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

mtd_check_of_node() was added by commit ad9b10d1eaada169 ("mtd: core:
introduce of support for dynamic partitions").

I guess that sometimes (depending on probe timing) mtd->parent is NULL.
Please check what mtd->parent == NULL means.

+	/* Check if a partitions node exist */
+       parent = mtd->parent;
+       parent_dn = dev_of_node(&parent->dev);

On 2022/06/30 18:32, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    6cc11d2a1759 Add linux-next specific files for 20220630
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1640f850080000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=54f75b620e3845dd
> dashboard link: https://syzkaller.appspot.com/bug?extid=fe013f55a2814a9e8cfd
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
