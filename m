Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yxgnr-00086k-42
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 19:15:47 +0000
Received: by pdea3 with SMTP id a3so23531858pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 12:15:25 -0700 (PDT)
Date: Wed, 27 May 2015 12:15:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: blktrans: use better error code for unimplemented
 ioctl()
Message-ID: <20150527191429.GF27753@ld-irv-0074>
References: <1431498556-21275-1-git-send-email-wenlin.kang@windriver.com>
 <20150520193325.GK11598@ld-irv-0074>
 <CAFLxGvyy4UZWAZ9FaNCnF6-L664x3t72R_Kg_zEmD-HfkJqxrA@mail.gmail.com>
 <20150521080511.GF11112@norris-Latitude-E6410>
 <555DB0AB.2000801@nod.at> <20150521175431.GC11598@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150521175431.GC11598@ld-irv-0074>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Wenlin Kang <wenlin.kang@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 21, 2015 at 10:54:31AM -0700, Brian Norris wrote:
> In commit 50183936254b ("mtd: blktrans: change blktrans_getgeo return
> value") we fixed the problem that ioctl(HDIO_GETGEO) might return 0
> (success) for mtdblock devices which did not implement the feature and
> would leave a blank (zero) result.
> 
> But now, let's get the error code right. Other code paths on this ioctl
> tend to use -ENOTTY to notify the user that the ioctl() is not supported
> for the device, so let's use that instead of -EOPNOTSUPP.
> 
> Suggested-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Against l2-mtd.git (linux-next)

Applied.
