Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239CDC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 22:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nH9PVIi0Hu4xZlgkyOAhT+mvWngEenpdIUkl+MZPIY8=; b=TNLiXmIw19IjVX
	oOr1zLVqSYQk/8oBH7tlbCljAFgN9NiQxmgELX85DaJ3S75OKywOS7ZW4LPXNr1iapCyGjXgq+80r
	t6El/Guazlu8f6SoujVLmNiqQdW6i6+27/43fh2Y/tHFDq0wqTV6Tvq4RA+juVRD4fkxjolkcv60U
	oMpoukdhAEotmzLOrMhRc45zDoIh5kRHHFWP01NWszzlhuVq/E9YRJT0duLtdmUxapjPL0+zC4EcX
	TgYEkwclZvQ7ulCnH/+guf/6Ep8LCFMla5xG7a5kXAThTIHodm46JEiR3gi6TtjoO5xfz+mbZOafm
	HdQjb8mEiUaQSvRI/HJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4sEM-00D1lL-TT; Tue, 04 Jan 2022 22:24:34 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4sEK-00D1kt-7s
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 22:24:33 +0000
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 204MNJe9016479
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jan 2022 17:23:20 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 7EBF315C00E1; Tue,  4 Jan 2022 17:23:19 -0500 (EST)
Date: Tue, 4 Jan 2022 17:23:19 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Walt Drummond <walt@drummond.us>, aacraid@microsemi.com,
 viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de,
 bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com,
 bristot@redhat.com, dave.hansen@linux.intel.com, dwmw2@infradead.org,
 dietmar.eggemann@arm.com, dinguyen@kernel.org, geert@linux-m68k.org,
 gregkh@linuxfoundation.org, hpa@zytor.com, idryomov@gmail.com,
 mingo@redhat.com, yzaikin@google.com, ink@jurassic.park.msu.ru,
 jejb@linux.ibm.com, jmorris@namei.org, bfields@fieldses.org,
 jlayton@kernel.org, jirislaby@kernel.org, john.johansen@canonical.com,
 juri.lelli@redhat.com, keescook@chromium.org, mcgrof@kernel.org,
 martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de,
 oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org,
 rth@twiddle.net, richard@nod.at, serge@hallyn.com, rostedt@goodmis.org,
 tglx@linutronix.de, trond.myklebust@hammerspace.com,
 vincent.guittot@linaro.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, ceph-devel@vger.kernel.org,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-security-module@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Message-ID: <YdTI16ZxFFNco7rH@mit.edu>
References: <20220103181956.983342-1-walt@drummond.us>
 <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu>
 <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_142432_467292_2D967589 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, Jan 04, 2022 at 04:05:26PM -0600, Eric W. Biederman wrote:
> 
> That is all as expected, and does not demonstrate a regression would
> happen if SIGPWR were to treat SIG_DFL as SIG_IGN, as SIGWINCH, SIGCONT,
> SIGCHLD, SIGURG do.  It does show there is the possibility of problems.
> 
> The practical question is does anything send SIGPWR to anything besides
> init, and expect the process to handle SIGPWR or terminate?

So if I *cared* about SIGINFO, what I'd do is ask the systemd
developers and users list if there are any users of the sigpwr.target
feature that they know of.  And I'd also download all of the open
source UPS monitoring applications (and perhaps documentation of
closed-source UPS applications, such as for example APC's program) and
see if any of them are trying to send the SIGPWR signal.

I don't personally think it's worth the effort to do that research,
but maybe other people care enough to do the work.

> > I claim, though, that we could implement VSTATUS without implenting
> > the SIGINFO part of the feature.
> 
> I agree that is the place to start.  And if we aren't going to use
> SIGINFO perhaps we could have an equally good notification method
> if anyone wants one.  Say call an ioctl and get an fd that can
> be read when a VSTATUS request comes in.
> 
> SIGINFO vs SIGCONT vs a fd vs something else is something we can sort
> out when people get interested in modifying userspace.


Once VSTATUS support lands in the kernel, we can wait and see if there
is anyone who shows up wanting the SIGINFO functionality.  Certainly
we have no shortage of userspace notification interfaces in Linux.  :-)

   	   	       		 	      - Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
