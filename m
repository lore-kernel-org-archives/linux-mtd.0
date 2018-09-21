Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3Lsc-0006Uh-GW
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2018 13:54:02 +0000
Date: Fri, 21 Sep 2018 15:53:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] UBIFS fixes for 4.19-rc4
Message-ID: <20180921135342.GA13900@kroah.com>
References: <3383200.5o9oegka29@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3383200.5o9oegka29@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 21, 2018 at 11:33:15AM +0200, Richard Weinberger wrote:
> Greg,
> 
> The following changes since commit ae596de1a0c8c2c924dc99d23c026259372ab234:
> 
>   Compiler Attributes: naked can be shared (2018-09-20 15:23:58 +0200)

Wow, bold move, new patches with less than 24 hours in your tree.  That
means linux-next didn't see them :(

> are available in the Git repository at:
> 
>   git://git.infradead.org/linux-ubifs.git tags/upstream-4.19-rc4

Now pulled, but really, don't you think that they should at least go
through 0-day first?  Maybe no one runs ubifs on mainline kernels...

thanks,

greg k-h
