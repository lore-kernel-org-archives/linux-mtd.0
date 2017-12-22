Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSUWQ-0002Kq-KF
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 21:06:28 +0000
Received: by mail-wr0-x231.google.com with SMTP id l19so16535022wrc.2
 for <linux-mtd@lists.infradead.org>; Fri, 22 Dec 2017 13:06:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <945d325a2239efcd55273abb2bac41cfc7264fea.1512041070.git.dongsu@kinvolk.io>
References: <cover.1512741134.git.dongsu@kinvolk.io>
 <945d325a2239efcd55273abb2bac41cfc7264fea.1512041070.git.dongsu@kinvolk.io>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 22 Dec 2017 22:06:13 +0100
Message-ID: <CAFLxGvwzRBGJf0-jCAwGts1HwV_nT072+yhHLP079sxQezoTFQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] mtd: Check permissions towards mtd block device
 inode when mounting
To: Dongsu Park <dongsu@kinvolk.io>
Cc: LKML <linux-kernel@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Linux Containers <containers@lists.linux-foundation.org>,
 Seth Forshee <seth.forshee@canonical.com>, Alban Crequy <alban@kinvolk.io>,
 "Eric W . Biederman" <ebiederm@xmission.com>, Sargun Dhillon <sargun@sargun.me>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dongsu,

On Fri, Dec 22, 2017 at 3:32 PM, Dongsu Park <dongsu@kinvolk.io> wrote:
> From: Seth Forshee <seth.forshee@canonical.com>
>
> Unprivileged users should not be able to mount mtd block devices
> when they lack sufficient privileges towards the block device
> inode.  Update mount_mtd() to validate that the user has the
> required access to the inode at the specified path. The check
> will be skipped for CAP_SYS_ADMIN, so privileged mounts will
> continue working as before.

What is the big picture of this?
Can in future an unprivileged user just mount UBIFS?
Please note that UBIFS sits on top of a character device and not a block device.

-- 
Thanks,
//richard
