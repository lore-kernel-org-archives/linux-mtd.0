Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eSjLq-0000ab-RD
 for linux-mtd@lists.infradead.org; Sat, 23 Dec 2017 12:56:33 +0000
From: Richard Weinberger <richard@nod.at>
To: Dongsu Park <dongsu@kinvolk.io>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Linux Containers <containers@lists.linux-foundation.org>,
 Seth Forshee <seth.forshee@canonical.com>, Alban Crequy <alban@kinvolk.io>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Sargun Dhillon <sargun@sargun.me>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 02/11] mtd: Check permissions towards mtd block device
 inode when mounting
Date: Sat, 23 Dec 2017 13:56:51 +0100
Message-ID: <65834980.AClogkzgvk@blindfold>
In-Reply-To: <CANxcAMtVqgLmQaTtfJocGGgsn5dSX2CDwzh6bwv6OnjUUwsTrg@mail.gmail.com>
References: <cover.1512741134.git.dongsu@kinvolk.io>
 <CAFLxGvwzRBGJf0-jCAwGts1HwV_nT072+yhHLP079sxQezoTFQ@mail.gmail.com>
 <CANxcAMtVqgLmQaTtfJocGGgsn5dSX2CDwzh6bwv6OnjUUwsTrg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dongsu,

Am Samstag, 23. Dezember 2017, 13:18:30 CET schrieb Dongsu Park:
> Hi,
> 
> On Fri, Dec 22, 2017 at 10:06 PM, Richard Weinberger
> 
> <richard.weinberger@gmail.com> wrote:
> > Dongsu,
> > 
> > On Fri, Dec 22, 2017 at 3:32 PM, Dongsu Park <dongsu@kinvolk.io> wrote:
> >> From: Seth Forshee <seth.forshee@canonical.com>
> >> 
> >> Unprivileged users should not be able to mount mtd block devices
> >> when they lack sufficient privileges towards the block device
> >> inode.  Update mount_mtd() to validate that the user has the
> >> required access to the inode at the specified path. The check
> >> will be skipped for CAP_SYS_ADMIN, so privileged mounts will
> >> continue working as before.
> > 
> > What is the big picture of this?
> > Can in future an unprivileged user just mount UBIFS?
> 
> I'm not sure I'm aware of all use cases w.r.t mtd & ubifs.
> To my understanding, in these days many container runtimes allow
> unprivileged users to run containers. (docker, lxc, runc, bubblewrap, etc)
> That's why the kernel should deal with additional permission checks
> that might have not been necessary in the past.
> This MTD patch is one of those special cases.

My fear is that a corner case is forgotten and all of a sudden someone can do 
funky things with MTD in a container...

Thanks,
//richard
