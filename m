Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abvHD-00038z-Oe
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2016 19:20:40 +0000
Subject: Re: UBIFS Dump Stack on Android
To: Han Xu <xhnjupt@gmail.com>
References: <CA+EcR23cFb_cY=CAHGcpaq9P9KU2mTDXbTh-OiuK3Oq_o3idDA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56D9DFEE.7040106@nod.at>
Date: Fri, 4 Mar 2016 20:20:14 +0100
MIME-Version: 1.0
In-Reply-To: <CA+EcR23cFb_cY=CAHGcpaq9P9KU2mTDXbTh-OiuK3Oq_o3idDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Han,

Am 04.03.2016 um 03:21 schrieb Han Xu:
> Hi Richard,
> 
> We found an issue on Kernel 4.1 when running Android on UBIFS. Android
> required to enable SELINUX and exposed the issue, one ubifs_assert()
> function failed and caused dump stack.
> 
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -309,7 +309,6 @@ static int setxattr(struct inode *host, const char
> *name, const void *value,
>         union ubifs_key key;
>         int err, type;
> 
>         ubifs_assert(mutex_is_locked(&host->i_mutex));
> 
> It may related to your recent code change
> UBIFS: Kill unneeded locking in ubifs_init_security
> 
> We also noticed Google maintained Kernel 4.1 AOSP didn't cherry-pick
> the patch either. Could you please help to check this issue, Thanks.
> 

Well, does reverting my patch make the issue go away?
How to do you trigger it?

Thanks,
//richard
