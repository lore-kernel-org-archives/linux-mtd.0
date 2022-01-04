Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3AFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDTvcDrno5KCHRneRoU7wh5wMfVV6p+aAuiLn/3w3f4=; b=2Ys4QlpTkAnE0t
	aogUhWatYU7mcgzG1oxYcNpHfHE28cwMkZbEFBSFxYbmBKpeqL+xS+6Ut70fcEOVnBUZ4aCeVLk4p
	Dv/uEp9h0a7fJGeuNvIT0vfndXyb4Lw+xGNqnlPf8j86xIK9B0YAHmVKHrbOb5rRZhh7YZqrstvkd
	Gx7guOI6/NxhlHfXJxNyryQ5V56oCoOgDUq8b0jgyuQQkcQM453Jya9+xdPHvqpliINjyscI1i9se
	ChX4OeQrA6JJjTiXvfKByzJlybB/22U8fUygapS5pEKUVZcBruSzLTUafXjnSlKPkCpVerDBWEmgZ
	m9iWQCFyaWaXkiBMtZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4sLX-00D2Ur-Ve; Tue, 04 Jan 2022 22:32:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4sLV-00D2U5-BN
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 22:31:58 +0000
Received: by mail-lf1-x12b.google.com with SMTP id h2so74290749lfv.9
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jan 2022 14:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=drummond.us; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WCROm2fnDVp3gJHoFF4FSh0CLwqqTwPGgd5WC3cykAE=;
 b=SpNAIy18+a+BDF8ohbOhhPTgn+rzzWGPHdpXue1Z95/qQvcACFPfls+EhsBOb9bJ5I
 J4obAOpt6rzp6Cc6ysV/HzbOKr1fr3e+TeLO6bRMnYdo3Gyh9nb1rzv1ICxH2cvlIvP1
 O7zLwOaJVfjhHVFevNE78XtRHOJLnOt4OvZNOrtO4+Qth9yQuKO3Y0zMqJxHhe1sPN68
 AsVbfWMCG2xnfSZ0gRMgCWFuQi9faGM0w08EmIWjCfBZLojXQfuuYl5i08TleIW/7b/n
 nzMZzBq9PSmCXV2xi+HfGLAjucKoCMHpfD9Bcb6PeCRSN1t/e4GZt0e33JDtOpwXUI3r
 +ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WCROm2fnDVp3gJHoFF4FSh0CLwqqTwPGgd5WC3cykAE=;
 b=jG27WpiANKDrqtKa1gFepU77BghdFS0ivjp9+J9qp8MusRDLuvY9g7elSYCdTwwd4H
 RpPAFtqB9oIePc+D58KKEGWnZD+NOeH4mNQqDzDDehgGRY/wFXpvoK0tmfjgLGuM2Rdh
 dYOOtH4Klp1oxwrFEj6IVV/RxAgZ2O4p9dRcz1ta+Osn4Ka8NIiSpifBpIWpJAm2gKzq
 hMI4nf9D33vpNAx+bSab0cVTADcF2o0m1ujzRI2Wo+VuQvFnGVAoknqCi/GLkKzy7y4h
 rk5j4oti0LhzKbycVt8UqNrEGn2GjCL2IeXjwGTF1JNbS/UrpnsgGqwcfVjGbIqzY9zg
 PjBQ==
X-Gm-Message-State: AOAM531bmYWQ0k3XgcCNKHly+gyj6qqT4TGyC2tpSh2nMSuCuZcJBXHr
 X9R2xczbDwrzDxFtPZ473++EJ0j9HtygvidauBHOrg==
X-Google-Smtp-Source: ABdhPJx1kX6sFLTseOkg2YWGeBhi1W6ClRmDNwQ/+U2YIr6vghHpml3Y6bKghVPjgaFOMW5MDitHq9bLobHNxLYmId8=
X-Received: by 2002:a05:6512:ba9:: with SMTP id
 b41mr43938123lfv.529.1641335515666; 
 Tue, 04 Jan 2022 14:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20220103181956.983342-1-walt@drummond.us>
 <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu> <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
 <YdTI16ZxFFNco7rH@mit.edu>
In-Reply-To: <YdTI16ZxFFNco7rH@mit.edu>
From: Walt Drummond <walt@drummond.us>
Date: Tue, 4 Jan 2022 14:31:44 -0800
Message-ID: <CADCN6nzT-Dw-AabtwWrfVRDd5HzMS3EOy8WkeomicJF07nQyoA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, aacraid@microsemi.com,
 viro@zeniv.linux.org.uk, 
 anna.schumaker@netapp.com, arnd@arndb.de, bsegall@google.com, bp@alien8.de, 
 chuck.lever@oracle.com, bristot@redhat.com, dave.hansen@linux.intel.com, 
 dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org, 
 geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com, 
 idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, 
 ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, 
 bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, 
 john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, 
 mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, 
 mgorman@suse.de, oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org, 
 rth@twiddle.net, richard@nod.at, serge@hallyn.com, rostedt@goodmis.org, 
 tglx@linutronix.de, trond.myklebust@hammerspace.com, 
 vincent.guittot@linaro.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
 ceph-devel@vger.kernel.org, kvm@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-m68k@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-security-module@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_143157_420695_23A34ECC 
X-CRM114-Status: GOOD (  26.01  )
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

The only standard tools that support SIGINFO are sleep, dd and ping,
(and kill, for obvious reasons) so it's not like there's a vast hole
in the tooling or something, nor is there a large legacy software base
just waiting for SIGINFO to appear.   So while I very much enjoyed
figuring out how to make SIGINFO work ...

I'll have the VSTATUS patch out in a little bit.

I also think there might be some merit in consolidating the 10
'sigsetsize != sizeof(sigset_t)' checks in a macro and adding comments
that wave people off on trying to do what I did.  If that would be
useful, happy to provide the patch.

On Tue, Jan 4, 2022 at 2:23 PM Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Tue, Jan 04, 2022 at 04:05:26PM -0600, Eric W. Biederman wrote:
> >
> > That is all as expected, and does not demonstrate a regression would
> > happen if SIGPWR were to treat SIG_DFL as SIG_IGN, as SIGWINCH, SIGCONT,
> > SIGCHLD, SIGURG do.  It does show there is the possibility of problems.
> >
> > The practical question is does anything send SIGPWR to anything besides
> > init, and expect the process to handle SIGPWR or terminate?
>
> So if I *cared* about SIGINFO, what I'd do is ask the systemd
> developers and users list if there are any users of the sigpwr.target
> feature that they know of.  And I'd also download all of the open
> source UPS monitoring applications (and perhaps documentation of
> closed-source UPS applications, such as for example APC's program) and
> see if any of them are trying to send the SIGPWR signal.
>
> I don't personally think it's worth the effort to do that research,
> but maybe other people care enough to do the work.
>
> > > I claim, though, that we could implement VSTATUS without implenting
> > > the SIGINFO part of the feature.
> >
> > I agree that is the place to start.  And if we aren't going to use
> > SIGINFO perhaps we could have an equally good notification method
> > if anyone wants one.  Say call an ioctl and get an fd that can
> > be read when a VSTATUS request comes in.
> >
> > SIGINFO vs SIGCONT vs a fd vs something else is something we can sort
> > out when people get interested in modifying userspace.
>
>
> Once VSTATUS support lands in the kernel, we can wait and see if there
> is anyone who shows up wanting the SIGINFO functionality.  Certainly
> we have no shortage of userspace notification interfaces in Linux.  :-)
>
>                                               - Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
