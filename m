Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cfo0C-0005bV-OT
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2017 13:27:43 +0000
Subject: Re: [PATCH] Remove UDEV_SETTLE_HACK
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1461707257-22727-1-git-send-email-richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <4546298d-aa52-01e8-5c1e-af9d6a1ecfa8@sigma-star.at>
Date: Mon, 20 Feb 2017 14:27:19 +0100
MIME-Version: 1.0
In-Reply-To: <1461707257-22727-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/26/2016 11:47 PM, Richard Weinberger wrote:
> UDEV_SETTLE_HACK addresses a problem which does no longer exist on Linux.
> These days we have devtmpfs. New devices will automatically created on
> the kernel side and user space has no longer to wait for udev.
> As udev has a hard dependency on devtmpfs we can depend on it too.
> People which don't use udev nor plain devtmpfs are anyways on their own.
> Android, I'm looking at you...
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  tests/ubi-tests/Makefile    |  7 +------
>  tests/ubi-tests/README.udev | 25 -------------------------
>  ubi-utils/libubi.c          | 29 -----------------------------
>  3 files changed, 1 insertion(+), 60 deletions(-)
>  delete mode 100644 tests/ubi-tests/README.udev
> 
Applied to mtd-utils.git.

Please note that I fixed the paths, as libubi has been moved from
ubi-utils/ to lib/. Also, I dropped the Makefile fix, as the new
Automake file uses the regular libubi for the tests and didn't make
use of UDEV_SETTLE_HACK.


Thanks,

David
