Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17D6C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 01:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+xPTtc29mZrxyX+3eUmc+RvIXfUOmWg/kwwTZHjpj0=; b=YKjyC4HoyyAZxA
	dJ0HZAB64pnBmcLJarWfDj4S3AVfKJvs38qzb3i9G2jn8r8v3WGGchUHiOA+OFUvqHonB/YLCbwWg
	hYxAWvh/wKdFEjudkb84EpFqEIVUyUAejP/74yX60DNweECAFSIBz3fGeAsgIj79EcYikpwkNo0aW
	f9HL9k3ZbzAM7rD2zL+2guC98kpr3GJxqDtjGJo9/G7sdDvhq6XZkM+nYAwCHO5QjRgkAM0CkHkea
	jPQnR9vfRweDXJfRALp2FwLXQojGQ9YketyED3ndtdAzwD5u0KEReZMUNhoYcBbPncRIeq/joD5Xd
	CIplnfPJQAoHi+ysmxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Yyb-00ACSu-Pc; Tue, 04 Jan 2022 01:51:01 +0000
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4YyZ-00ACS4-Ps
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 01:51:00 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n4YxK-00H3st-Q5; Tue, 04 Jan 2022 01:49:42 +0000
Date: Tue, 4 Jan 2022 01:49:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Walt Drummond <walt@drummond.us>
Cc: aacraid@microsemi.com, anna.schumaker@netapp.com, arnd@arndb.de,
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
Message-ID: <YdOntksAAhc/oaU1@zeniv-ca.linux.org.uk>
References: <20220103181956.983342-1-walt@drummond.us>
 <YdNE6UXRT02135Pd@zeniv-ca.linux.org.uk>
 <CADCN6nx4VWtR79TBDTENRExjsa=KAGuUpyz06iu2EGmSTPyc+Q@mail.gmail.com>
 <YdOf4WBwR1H93GAt@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdOf4WBwR1H93GAt@zeniv-ca.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_175059_857440_EC3E9CC4 
X-CRM114-Status: UNSURE (   9.14  )
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

On Tue, Jan 04, 2022 at 01:16:17AM +0000, Al Viro wrote:
> On Mon, Jan 03, 2022 at 05:00:58PM -0800, Walt Drummond wrote:
> > I simply wanted SIGINFO and VSTATUS, and that necessitated this.
> 
> Elaborate, please.  What exactly requires more than 32 rt signals?

More to the point, which system had SIGINFO >= SIGRTMIN?  Or signals
with numbers greater than SIGRTMAX, for that matter?

I really don't get it...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
