Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9510CC25B74
	for <linux-mtd@archiver.kernel.org>; Sat, 18 May 2024 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rl6c2j9KEN5RFkrQyU5rwM8qcPlLD+APo+lkpddHqzM=; b=jBxAAdtxpFcgxZ
	EJRir7LXouPAghCTGAc9Am0r8ojowD90C/SeXt/U53G3nLq2vZOoQd3pbjUub0QwO5BDQXbGi5K0P
	XRQBcwd+zG/XZfdP1mO6fatK3ommkdeTfWRAGSwIVgruoBnbLRh/ZjT7ONjC8z6isOhY8Ksj8+1CZ
	/IEP7SYu08goNQjKwIY06/R2xUzgJoMQ1/dW0HTxLVrzKJpwbwgVSQZJ+QDWArg+lKEd7qDUGvAVS
	3NSZJUd0kVT1cXUQZVtKbneIooMx7ak2ctiim8c8zW5DwYk8qArPaRW8P4VUu2sEut1yKAxBOLoa/
	F0gwF/dsv3f0HOmtVx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8PiC-0000000AdEX-3g3R;
	Sat, 18 May 2024 19:27:20 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8Pi7-0000000Ad8e-0hyI
	for linux-mtd@lists.infradead.org;
	Sat, 18 May 2024 19:27:16 +0000
Received: from fpc (unknown [5.228.116.47])
	by mail.ispras.ru (Postfix) with ESMTPSA id E487C407851F;
	Sat, 18 May 2024 19:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E487C407851F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1716060403;
	bh=jOuQ5uZjSUgcbnmh6vGDVilCcRsMB9GTgJKB/mLHvz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=p9pkjPzRYueAW/qA9RLCr9VyLG0JUvqnZMAeuYGEveDyd3SrHjHE+OgF8Fk78so/5
	 Yu0CskVgF7YMBxcx6/tyX09Opr7VzZFDnDMsEA2DqbDSNceQ0iL5l5Xbj21J5XCK7U
	 1LT5COj5QkN5hurI6MDKVAOHWbjgK419mQ1J81fk=
Date: Sat, 18 May 2024 22:26:38 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: syzbot <syzbot+f516089d7815b10197c9@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mtd?] WARNING: zero-size vmalloc in
 ubi_read_volume_table
Message-ID: <20240518-f6ee39c99afd546f45cc692b-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000a7f84306150bc9d5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_122715_394006_81B10274 
X-CRM114-Status: UNSURE (   3.09  )
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

#syz fix: ubi: Check for too small LEB size in VTBL code

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
