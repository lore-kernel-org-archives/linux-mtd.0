Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRcVC-0004MS-IK
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 08:44:14 +0000
Message-ID: <1439887431.31419.110.camel@gmail.com>
Subject: Re: [PATCH v4] ubifs: make ubifs_[get|set]xattr atomic
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, richard.weinberger@gmail.com
Cc: linux-mtd@lists.infradead.org
Date: Tue, 18 Aug 2015 11:43:51 +0300
In-Reply-To: <1439872716-4810-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439872716-4810-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

On Tue, 2015-08-18 at 12:38 +0800, Dongsheng Yang wrote:
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
> Then ubifs_getxattr() would get a non-sense data. To solve this
> problem, this commit make the xattr of ubifs_inode updated in
> atomic.

Picked this one, thanks!
