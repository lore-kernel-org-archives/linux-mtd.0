Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP97a-0001Es-7q
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 12:57:38 +0000
Message-ID: <1439297835.31419.31.camel@gmail.com>
Subject: Re: [PATCH v3] ubifs: make ubifs_[get|set]xattr atomic
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, richard@nod.at,
 linux-mtd@lists.infradead.org
Date: Tue, 11 Aug 2015 15:57:15 +0300
In-Reply-To: <1438927640-14931-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <55C444EA.7090305@cn.fujitsu.com>
 <1438927640-14931-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-08-07 at 14:07 +0800, Dongsheng Yang wrote:
> +	mutex_lock(&ui->ui_mutex);
>  	kfree(ui->data);
>  	ui->data = kmemdup(value, size, GFP_NOFS);
>  	if (!ui->data) {
> +		mutex_unlock(&ui->ui_mutex);
>  		err = -ENOMEM;
>  		goto out_free;
>  	}
>  	inode->i_size = ui->ui_size = size;
>  	ui->data_len = size;
> +	mutex_unlock(&ui->ui_mutex);


Just one note - should kmemdup() be called outside of the critical
section, to make is shorter (memory allocation is a potentially slow
operation)?

Something like:

buf = kmemdup()
mutex_lock()
kfree(ui->data)
ui->data = buf
mutex_unlock()

Artem.
