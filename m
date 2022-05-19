Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21468C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 19 May 2022 12:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rII+dRDWvEE7lZiOT0btANztJVWCHAdtEFGEUoO4sUQ=; b=h+LnF69yUxXqUI
	UHVdyVg036zbZMc6I7icjPqJIlEQNt7R6Lpch0pL6FLL75V3R4GhAnR2pwQI366unmo+xydKXf4yc
	dSMy/mzk0eX9GfVjnZaYH/BwoGsQsjOQhl7695ZJHJRufyDY+Z71YADn8XCiFj3wVamnX4eJobJ34
	QIk812Okot2puQU6MzusceInTm6wyie0eQDGxRJeDO7vOaQxnUyS9cCnXOWH3in/AnvPhIbDEevdE
	LndOjRpo0+tTsKo1P+OLGXF+3Rc5QxN4vHC+hVckf1mCPYnZ+EdZf5ZgZwg6z6ZQ4q0Vi5qtCyL+x
	V1vFzftAuALoK0AHozvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfGD-006fW4-V6; Thu, 19 May 2022 12:28:09 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfG9-006fTd-L5
 for linux-mtd@lists.infradead.org; Thu, 19 May 2022 12:28:07 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 20D5C1C0B92; Thu, 19 May 2022 14:27:58 +0200 (CEST)
Date: Thu, 19 May 2022 14:27:46 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Walt Drummond <walt@drummond.us>, Theodore Ts'o <tytso@mit.edu>,
 "Eric W. Biederman" <ebiederm@xmission.com>, aacraid@microsemi.com,
 viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de,
 bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com,
 bristot@redhat.com, dave.hansen@linux.intel.com,
 dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org,
 geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
 idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com,
 ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org,
 bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org,
 john.johansen@canonical.com, juri.lelli@redhat.com,
 keescook@chromium.org, mcgrof@kernel.org,
 martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de,
 oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org,
 rth@twiddle.net, richard@nod.at, serge@hallyn.com,
 rostedt@goodmis.org, tglx@linutronix.de,
 trond.myklebust@hammerspace.com, vincent.guittot@linaro.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 ceph-devel@vger.kernel.org, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-m68k@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Message-ID: <20220519122746.GA3904@localhost>
References: <20220103181956.983342-1-walt@drummond.us>
 <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu>
 <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
 <YdTI16ZxFFNco7rH@mit.edu>
 <CADCN6nzT-Dw-AabtwWrfVRDd5HzMS3EOy8WkeomicJF07nQyoA@mail.gmail.com>
 <YdiUiHAhLyfgpvVY@cello>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdiUiHAhLyfgpvVY@cello>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_052805_867776_3BA27BCB 
X-CRM114-Status: GOOD (  14.51  )
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

Hi!

> > The only standard tools that support SIGINFO are sleep, dd and ping,
> > (and kill, for obvious reasons) so it's not like there's a vast hole
> > in the tooling or something, nor is there a large legacy software base
> > just waiting for SIGINFO to appear.   So while I very much enjoyed
> > figuring out how to make SIGINFO work ...
> 
> As far as I recall, GNU make on *BSD does support SIGINFO (Not a
> standard tool, but obviously an established one).
> 
> The developers of strace have expressed interest in SIGINFO support
> to print tracer status messages (unfortunately, not on a public list).
> Computational software can use this instead of stderr progress spam, if
> run in an interactive fashion on a terminal, as it frequently is. There
> is a user base, it's just not very vocal on kernel lists. :)

And often it would be useful if cp supported this. Yes, this
is feature I'd like to see.

BR,							Pavel

-- 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
