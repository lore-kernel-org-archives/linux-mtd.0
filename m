Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD66C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 22:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dO1FmGuHQSVxnMkwAHX0tbcVN2GfqcFuFa4CeiHPB30=; b=XSn4SO7rZmNO97P85z1mKU4KiQ
	qSA3On3obaUvY0dAL9uYfUvTDuMgkjhb4BQg3Iz4mKH4gYDHy3AstNgJevwMjtE6Nyqfv+sWRhAMV
	2Ujc2P5V2+ZG5t10PMGPd3H0IicSr0RNcd4Ai3VgIkYCrmjbLUXXWKqAsj62XieVDk1Y3D29O1Svk
	+McCoAFxG2ywMpk0sZeCB8xabKvoDyKdFWImEKmPXD9NkaB1JnWn4WX18CImD7ZBGmH1Xjc/5CdhY
	HLl803orptTdh1qrT1KwmBfpiobwM7qnDrmFp9m3mV6VKdcsiYtxwOTCxo+Hyz4+CS7muvMNLrwmo
	vt2piHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4rwv-00CzBV-BM; Tue, 04 Jan 2022 22:06:33 +0000
Received: from out03.mta.xmission.com ([166.70.13.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4rwr-00Cz8o-WE
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 22:06:31 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:60612)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n4rwg-00GRl6-My; Tue, 04 Jan 2022 15:06:18 -0700
Received: from ip68-110-24-146.om.om.cox.net ([68.110.24.146]:39706
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n4rwe-00AJrs-EY; Tue, 04 Jan 2022 15:06:18 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Walt Drummond <walt@drummond.us>,  aacraid@microsemi.com,
 viro@zeniv.linux.org.uk,  anna.schumaker@netapp.com,  arnd@arndb.de,
 bsegall@google.com,  bp@alien8.de,  chuck.lever@oracle.com,
 bristot@redhat.com,  dave.hansen@linux.intel.com,  dwmw2@infradead.org,
 dietmar.eggemann@arm.com,  dinguyen@kernel.org,  geert@linux-m68k.org,
 gregkh@linuxfoundation.org,  hpa@zytor.com,  idryomov@gmail.com,
 mingo@redhat.com,  yzaikin@google.com,  ink@jurassic.park.msu.ru,
 jejb@linux.ibm.com,  jmorris@namei.org,  bfields@fieldses.org,
 jlayton@kernel.org,  jirislaby@kernel.org,  john.johansen@canonical.com,
 juri.lelli@redhat.com,  keescook@chromium.org,  mcgrof@kernel.org,
 martin.petersen@oracle.com,  mattst88@gmail.com,  mgorman@suse.de,
 oleg@redhat.com,  pbonzini@redhat.com,  peterz@infradead.org,
 rth@twiddle.net,  richard@nod.at,  serge@hallyn.com,
 rostedt@goodmis.org,  tglx@linutronix.de,
 trond.myklebust@hammerspace.com,  vincent.guittot@linaro.org,
 x86@kernel.org,  linux-kernel@vger.kernel.org,
 ceph-devel@vger.kernel.org,  kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org,  linux-arch@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,  linux-m68k@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-nfs@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-security-module@vger.kernel.org
References: <20220103181956.983342-1-walt@drummond.us>
 <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu>
Date: Tue, 04 Jan 2022 16:05:26 -0600
In-Reply-To: <YdSzjPbVDVGKT4km@mit.edu> (Theodore Ts'o's message of "Tue, 4
 Jan 2022 15:52:28 -0500")
Message-ID: <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1n4rwe-00AJrs-EY; ; ;
 mid=<87pmp79mxl.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.24.146; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+pTOQLVEgfzdSQ3AESBxxTFfoB2eTGC7k=
X-SA-Exim-Connect-IP: 68.110.24.146
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_140630_066752_C7252C2D 
X-CRM114-Status: GOOD (  18.44  )
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

"Theodore Ts'o" <tytso@mit.edu> writes:

> On Tue, Jan 04, 2022 at 12:00:34PM -0600, Eric W. Biederman wrote:
>> I dug through the previous conversations and there is a little debate
>> about what makes sense for SIGPWR to do by default.  Alan Cox remembered
>> SIGPWR was sent when the power was restored, so ignoring SIGPWR by
>> default made sense.  Ted Tso pointed out a different scenario where it
>> was reasonable for SIGPWR to be a terminating signal.
>> 
>> So far no one has actually found any applications that will regress if
>> SIGPWR becomes ignored by default.  Furthermore on linux SIGPWR is only
>> defined to be sent to init, and init ignores all signals by default so
>> in practice SIGPWR is ignored by the only process that receives it
>> currently.
>
> As it turns out, systemd does *not* ignore SIGPWR.  Instead, it will
> initiate the sigpwr target.  From the systemd.special man page:
>
>        sigpwr.target
>            A special target that is started when systemd receives the
>            SIGPWR process signal, which is normally sent by the kernel
>            or UPS daemons when power fails.
>
> And child processes of systemd are not ignoring SIGPWR.  Instead, they
> are getting terminated.
>
> <tytso@cwcc>
> 41% /bin/sleep 50 &
> [1] 180671
> <tytso@cwcc>
> 42% kill -PWR 180671
> [1]+  Power failure           /bin/sleep 50


That is all as expected, and does not demonstrate a regression would
happen if SIGPWR were to treat SIG_DFL as SIG_IGN, as SIGWINCH, SIGCONT,
SIGCHLD, SIGURG do.  It does show there is the possibility of problems.

The practical question is does anything send SIGPWR to anything besides
init, and expect the process to handle SIGPWR or terminate?

Possibly easier to implement (if people desire) is to simply send
SIGCONT with an si_code that indicates someone pressed the VSTATUS
key.  We have a per signal 32bit si_code space so that should
be comparatively easy.

> I claim, though, that we could implement VSTATUS without implenting
> the SIGINFO part of the feature.

I agree that is the place to start.  And if we aren't going to use
SIGINFO perhaps we could have an equally good notification method
if anyone wants one.  Say call an ioctl and get an fd that can
be read when a VSTATUS request comes in.

SIGINFO vs SIGCONT vs a fd vs something else is something we can sort
out when people get interested in modifying userspace.

Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
