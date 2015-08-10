Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOi5G-0001Ro-MJ
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 08:05:27 +0000
Message-ID: <1439193902.26877.96.camel@gmail.com>
Subject: Re: [PATCH v3] ubifs: make ubifs_[get|set]xattr atomic
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, richard@nod.at,
 linux-mtd@lists.infradead.org
Date: Mon, 10 Aug 2015 11:05:02 +0300
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

Right now, AFAICS, UBIFS uses the "host" inode mutex to serialize xattr
operations. May be the terminology is not the best, but "host" is the
non-xattr inode (say, a file inode) which "carries" the extended
attributes. So one "host" may have many xattrs.

Now, obviously, locking the entire "host" to change one xattr is very
coarse, because operations on other xattrs get blocked by operations on
other, unrelated xattrs.

So the host inode has fields like "xattr_size" - this needs to be
protected with the host mutex, but operations on individual xattrs may
be protected by xattr mutexes. However, this would be a more complex
locking scheme.


So my point is - use the "host->ui_mutex", not the xattr's mutex,
because this is how it is implemented now.

Re-working and improving locking could be a separate piece of job.

On Fri, 2015-08-07 at 14:07 +0800, Dongsheng Yang wrote:
> This commit make the ubifs_[get|set]xattr protected by ui_mutex.
> 
> Originally, there is a possibility that ubifs_getxattr to get
> a wrong value.
> 
>   P1                                  P2
> ----------                  	----------
> ubifs_getxattr                      ubifs_setxattr
> 					- kfree()
> - memcpy()
> 					- kmemdup()
> 

...

>  
> +	mutex_lock(&ui->ui_mutex);

Or to put it differently, you need to use 'host->ui_mutex', not 'ui
->ui_mutex', because 'ui' is the xattr inode here.
