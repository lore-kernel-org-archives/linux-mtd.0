Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av8tV-0001Rz-MB
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 19:43:38 +0000
Subject: Re: [PATCH] ubifs: Switch to generic xattr handlers
To: Andreas Gruenbacher <agruenba@redhat.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <1461345240-24117-1-git-send-email-agruenba@redhat.com>
Cc: linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <571FC4CF.5000104@nod.at>
Date: Tue, 26 Apr 2016 21:43:11 +0200
MIME-Version: 1.0
In-Reply-To: <1461345240-24117-1-git-send-email-agruenba@redhat.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.04.2016 um 19:14 schrieb Andreas Gruenbacher:
> Hello,
> 
> could you please review the following change which depends on the work.xattr
> branch of vfs.git:
> 
>   https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git/log/?h=work.xattr
> 
> I will send the change on to Al once it has been reviewed.
> 
> Thanks,
> Andreas
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/ubifs/dir.c   |   6 +--
>  fs/ubifs/file.c  |  12 ++---
>  fs/ubifs/super.c |   1 +
>  fs/ubifs/ubifs.h |   7 +--
>  fs/ubifs/xattr.c | 143 ++++++++++++++++++++++++++-----------------------------
>  5 files changed, 79 insertions(+), 90 deletions(-)

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
