Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqHVz-00050V-5b
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 07:13:56 +0000
Received: by mail-pb0-f47.google.com with SMTP id um1so7054092pbc.20
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 23:13:32 -0800 (PST)
Date: Mon, 9 Dec 2013 23:13:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 19/39] mtd: denali: remove DEFINE_PCI_DEVICE_TABLE macro
Message-ID: <20131210071324.GA11489@norris.computersforpeace.net>
References: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
 <002801ceefb4$cef24a20$6cd6de60$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002801ceefb4$cef24a20$6cd6de60$%han@samsung.com>
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 03, 2013 at 08:18:28AM +0900, Jingoo Han wrote:
> Don't use DEFINE_PCI_DEVICE_TABLE macro, because this macro
> is not preferred.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed to l2-mtd.git.

Brian
