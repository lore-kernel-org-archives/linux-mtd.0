Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAbXM-0007Sx-9U
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2018 14:02:15 +0000
Date: Thu, 11 Oct 2018 16:01:46 +0200
From: "gregkh@linuxfoundation.org >> Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
To: Hou Tao <houtao1@huawei.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 4.4-stable] jffs2: return -ERANGE when xattr buffer is
 too small
Message-ID: <20181011140146.GA2158@kroah.com>
References: <d05f826c-5b68-2409-ac96-01f0885d0617@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d05f826c-5b68-2409-ac96-01f0885d0617@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 05, 2018 at 03:13:20PM +0800, Hou Tao wrote:
> Hi Greg,
> 
> The problem had been fixed by 764a5c6b1fa4 ("xattr handlers: Simplify list
> operation") in v4.5-rc1, but the modification in that commit may be too much
> because it modifies all file-systems which implement xattr, so I create a single
> patch for jffs2 to fix the problem. Which one is your preference ?

This single patch is good.  But the tabs are all converted to spaces and
this does not apply :(

Please fix up and resend.

thanks,

greg k-h
