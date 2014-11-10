Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnpXw-0003i1-Mv
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 14:02:21 +0000
Message-ID: <1415628106.22887.122.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/4] UBIFS: Add xattr support for symlinks
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ben Shelton <ben.shelton@ni.com>
Date: Mon, 10 Nov 2014 16:01:46 +0200
In-Reply-To: <1414781431-2911-3-git-send-email-ben.shelton@ni.com>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
 <1414781431-2911-3-git-send-email-ben.shelton@ni.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-10-31 at 13:50 -0500, Ben Shelton wrote:
> From: Subodh Nijsure <snijsure@grid-net.com>
> 
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Acked-by: Terry Wilcox <terry.wilcox@ni.com>
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> ---
>  fs/ubifs/file.c  |  4 ++++
>  fs/ubifs/xattr.c | 17 ++++++++++++-----
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index b5b593c..4a1d4cf 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1573,6 +1573,10 @@ const struct inode_operations ubifs_symlink_inode_operations = {
>  	.follow_link = ubifs_follow_link,
>  	.setattr     = ubifs_setattr,
>  	.getattr     = ubifs_getattr,
> +	.setxattr    = ubifs_setxattr,
> +	.getxattr    = ubifs_getxattr,
> +	.listxattr   = ubifs_listxattr,
> +	.removexattr = ubifs_removexattr,

Could you please re-test this with any kernel and carefully verify
symlinks. I think this should not work, because in case of symlinks we
already store the link target path in the inode, and with this patch the
target patch will be over-written with the SELinux label. I expect this
to be seen easily on testing - symlink targets should be corrupted.

Artem.
