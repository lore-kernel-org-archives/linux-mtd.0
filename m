Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecH2S-0007nz-DK
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 20:43:58 +0000
From: Richard Weinberger <richard@nod.at>
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: ubifs: noatime support?
Date: Thu, 18 Jan 2018 21:44:33 +0100
Message-ID: <1996634.ggXeMYieCh@blindfold>
In-Reply-To: <20180118193015.GA24748@amd>
References: <20180118193015.GA24748@amd>
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

Pavel,

Am Donnerstag, 18. Januar 2018, 20:30:15 CET schrieb Pavel Machek:
> Hi!
> 
> Ubifs seems to have atime support these days:
> 
>           sb->s_flags |= SB_ACTIVE;
> #ifndef CONFIG_UBIFS_ATIME_SUPPORT
>           sb->s_flags |= SB_NOATIME;
> #else
>           ubifs_msg(c, "full atime support is enabled.");
> #endif
> 
> Which can be configured at compile-time, but no option to disable it
> at runtime. What is going on there?
> 
> UBIFS: parse noatime
> UBIFS error (ubi1:0 pid 94): ubifs_parse_options.constprop.5:
> unrecognized mount option "noatime" e
> mount: mounting ubi1:log_volume on /mnt/log failed: Invalid argument

Filesystems don't parse the "noatime" string, it is job of the mount tool to 
translate it to the MS_NOATIME mount flag.

Thanks,
//richard
