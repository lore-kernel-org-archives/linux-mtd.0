Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1tQv-0005bP-8x
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 09:33:29 +0000
Message-ID: <1433755985.28854.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Mon, 08 Jun 2015 12:33:05 +0300
In-Reply-To: <1433752038-17276-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1433752038-17276-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: richard@nod.at, linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-06-08 at 16:27 +0800, Dongsheng Yang wrote:
> Currently, ubifs does not support access time anyway. I understand
> that there is a overhead to update inode in each access from user.
> 
> But for the following two reasons, I think we can make it optional
> to user.
> 
> (1). More and more flash storage in server are trying to use ubifs,
> it is not only for a device such as mobile phone any more, we want
> to use it in more and more generic way. Then we need to compete
> with some other main filesystems. From this point, access time is
> necessary to us, at least as a choice to user currently.

Hi,

Could you please re-send this patch with the following list in CC:

linux-fsdevel@vger.kernel.org

This patch will probably need VFS-scope discussion, this is why I am
asking to CC the general linux file-systems development mailing list.

Thanks!
