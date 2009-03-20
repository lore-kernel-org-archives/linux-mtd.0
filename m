Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LkZrZ-0005ew-8d
	for linux-mtd@lists.infradead.org; Fri, 20 Mar 2009 08:14:04 +0000
Message-ID: <49C34F9E.2090701@nokia.com>
Date: Fri, 20 Mar 2009 10:11:10 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [PATCH 1/2] [MTD] CORE: New ioctl calls for >4GiB device support
	(take 2)
References: <a95a62fe0903192237u64b67efdubd328c8f0cd61b49@mail.gmail.com>
In-Reply-To: <a95a62fe0903192237u64b67efdubd328c8f0cd61b49@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kevin Cernekee wrote:
> Extend the MTD user ABI to access >4GiB devices using 64-bit offsets.
> Add compat_ioctl support to the MTD ABI.
> 
> New ioctls: MEMABIINFO MEMGETINFO64 MEMERASE64 MEMWRITEOOB64 MEMREADOOB64
>             MEMLOCK64 MEMUNLOCK64 MEMGETREGIONINFO64
> 
> Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
> ---
>  drivers/mtd/compat_ioctl.c |  233 +++++++++++++
>  drivers/mtd/compat_ioctl.h |   89 +++++
>  drivers/mtd/mtdchar.c      |  817 ++++++++++++++++++++++++++++---------------
>  include/mtd/mtd-abi.h      |   69 ++++-
>  include/mtd/mtd-user.h     |    4 +
>  5 files changed, 921 insertions(+), 291 deletions(-)
>  create mode 100644 drivers/mtd/compat_ioctl.c
>  create mode 100644 drivers/mtd/compat_ioctl.h
> 
> diff --git a/drivers/mtd/compat_ioctl.c b/drivers/mtd/compat_ioctl.c
> new file mode 100644
> index 0000000..ee98f71
> --- /dev/null
> +++ b/drivers/mtd/compat_ioctl.c
> @@ -0,0 +1,233 @@
> +/*
> + * MTD compat_ioctl implementation

That is not how it is done.  See fs/compat_ioctl.c

<snip>

> 
> +struct mtd_abi_info {
> +       uint32_t major;
> +       uint32_t minor;
> +       uint32_t patchlevel;
> +       uint32_t res0[8];
> +};
> +

ioctl versioning is unlikely to be accepted by the wider community.
Try posting to LKML for more feedback on that.
