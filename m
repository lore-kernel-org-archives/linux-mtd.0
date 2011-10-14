Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REilu-00067P-4b
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:30:02 +0000
Received: by wyi11 with SMTP id 11so3787017wyi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 07:30:00 -0700 (PDT)
Subject: Re: [PATCH 1/1]  Add security.selinux XATTR support for the UBIFS.
	Also fix couple of bugs in UBIFS extended attribute storage.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <subodh.nijsure@gmail.com>
Date: Fri, 14 Oct 2011 17:29:30 +0300
In-Reply-To: <1318359142-26759-1-git-send-email-subodh.nijsure@gmail.com>
References: <1318359142-26759-1-git-send-email-subodh.nijsure@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318602578.12351.146.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
	Subodh Nijsure <snijsure@grid-net.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-10-11 at 11:52 -0700, Subodh Nijsure wrote:
> From: Subodh Nijsure <snijsure@grid-net.com>
> 
> TESTING: Tested on MX25, MX28 based platforms using Micron MT29F2G08ABAEAH4 NAND
>          With these change we are able to label UBIFS filesystem with security.selinux
>          and run system with selinux enabled.
> 
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>

Did not have time to actually review your code, but would you please
amend it a little and make it be of the same style as UBIFS code. I'll
take a deeper look later.
 
> +static void ubifs_init_security(struct dentry *dentry, struct inode *inode,
> +		struct inode *dir)
See how we align the second line with tabs and then few spaces if
needed. Change globally please.

> +{
> +	int err;
> +	char *name;
> +	void *value = NULL;
> +	size_t len = 0;
> +	struct ubifs_inode *dir_ui = ubifs_inode(dir);
> +	const struct qstr *qname = &dentry->d_name;
> +
> +	mutex_lock(&dir_ui->ui_mutex);
> +	mutex_lock(&dentry->d_inode->i_mutex);
> +	err = security_inode_init_security(inode, dir, qname, &name, &value,
> +		&len);
ditto.

> +	if (err) {
> +		if (err == -EOPNOTSUPP)
> +			return;
> +		ubifs_err("unable to retrieve security context, error %d", err);
> +		mutex_unlock(&dentry->d_inode->i_mutex);
> +		mutex_unlock(&dir_ui->ui_mutex);
> +		return;
> +	}
> +
> +	if (strncmp(name, "selinux", strlen("selinux")) == 0) {
> +		kfree(name);
> +		name = kstrdup("security.selinux", GFP_NOFS);
> +		if (!name) {
> +			ubifs_err("unable to set security context %.*s error",
> +				dentry->d_name.len, dentry->d_name.name);
Ditto.

And many other dittos for the same kind of thing.

Could you try the integck as well and check that it passes?

-- 
Best Regards,
Artem Bityutskiy
