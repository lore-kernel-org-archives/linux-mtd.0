Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cji5P-0000jK-7T
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 07:57:13 +0000
Subject: Re: [PATCH] ubifs: add CONFIG_UBIFS_FS_SECURITY to disable/enable
 security labels
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1488527043-7195-1-git-send-email-hyc.lee@gmail.com>
Cc: kernel-team@lge.com, Artem Bityutskiy <dedekind1@gmail.com>,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Hyunchul Lee <cheol.lee@lge.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <e1ee0413-9c20-b511-5cb8-453e4b0c107a@nod.at>
Date: Fri, 3 Mar 2017 08:56:40 +0100
MIME-Version: 1.0
In-Reply-To: <1488527043-7195-1-git-send-email-hyc.lee@gmail.com>
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

Hyunchul Lee,

Am 03.03.2017 um 08:44 schrieb Hyunchul Lee:
> From: Hyunchul Lee <cheol.lee@lge.com>
> 
> When write syscall is called, every time security label is searched to
> determine that file's privileges should be changed.
> If LSM(Linux Security Model) is not used, this is useless.
> 
> So introduce CONFIG_UBIFS_SECURITY to disable security labels. it's default
> value is "y".

Can you please explain what the benefit is and why UBIFS needs this (and why not
all other filesystems)?
I guess some performance issue, do you have numbers?

Thanks,
//richard
