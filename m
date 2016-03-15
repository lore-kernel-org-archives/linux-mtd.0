Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afpIW-0006Ae-69
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2016 13:46:09 +0000
Received: by mail-ob0-x234.google.com with SMTP id ts10so17454843obc.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2016 06:45:47 -0700 (PDT)
Date: Tue, 15 Mar 2016 08:45:45 -0500
From: Seth Forshee <seth.forshee@canonical.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Andy Lutomirski <luto@amacapital.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>, devel@openvz.org,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-security-module@vger.kernel.org,
 linux-mtd@lists.infradead.org, selinux@tycho.nsa.gov,
 linux-fsdevel@vger.kernel.org,
 Konstantin Khorenko <khorenko@virtuozzo.com>,
 Pavel Emelyanov <xemul@virtuozzo.com>
Subject: Re: [PATCH] fs: remove excess check for in_userns
Message-ID: <20160315134545.GB27754@ubuntu-xps13>
References: <1451930639-94331-4-git-send-email-seth.forshee@canonical.com>
 <1458043740-14229-1-git-send-email-ptikhomirov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458043740-14229-1-git-send-email-ptikhomirov@virtuozzo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 15, 2016 at 03:09:00PM +0300, Pavel Tikhomirov wrote:
> If in_userns returns false mnt_may_suid also returns false, and we
> will reach second(removed) if-check only in case it does not trigger,
> so remove it.

We had a somewhat lengthy discussion previously where one of the
conclusions was that we'd have that check in both places even though
it's redundant. Iirc the reason was that though they're doing the same
test they're doing so to answer different questions, so we should have
the test in both places (or something along those lines).

Thanks,
Seth
