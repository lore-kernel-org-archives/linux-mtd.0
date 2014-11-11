Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo9Lf-0004s5-5q
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 11:10:59 +0000
Message-ID: <1415704235.22887.138.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] UBIFS: add ubifs_err() to print error reason
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ben Shelton <ben.shelton@ni.com>
Date: Tue, 11 Nov 2014 13:10:35 +0200
In-Reply-To: <1414781431-2911-5-git-send-email-ben.shelton@ni.com>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
 <1414781431-2911-5-git-send-email-ben.shelton@ni.com>
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

Pushed this, but made some amendments.

Now all 4 are in the master branch. Would you please re-test them again
and confirm that they are fine. Then I'll push them to the linux-next
branch, unless you report that my amendments broke something.

Thank you!

On Fri, 2014-10-31 at 13:50 -0500, Ben Shelton wrote:
> @@ -100,24 +100,32 @@ static const struct file_operations empty_fops;
>  static int create_xattr(struct ubifs_info *c, struct inode *host,
>  			const struct qstr *nm, const void *value, int size)
>  {
> -	int err;
> +	int err, xattr_name_list_size;

Renamed this to a shorter names_len.

> -	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE)
> +	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE) {
> +		ubifs_err("ubifs xattr_cnt %d exceeds MAX_XATTR_PER_NODE (%d)",
> +			  host_ui->xattr_cnt, MAX_XATTRS_PER_INODE);

Improved this message - made it more user-friendly, and print the inode
number.

> +	if (xattr_name_list_size > XATTR_LIST_MAX) {
> +		ubifs_err("xattr name list too large %d > %d",
> +			  xattr_name_list_size, XATTR_LIST_MAX);
>  		return -ENOSPC;

Ditto.
>  
> +	if (err)
> +		ubifs_err("cannot initialize extended attribute, error %d",
> +			  err);

Refactored this message and added the inode number.

Artem.
