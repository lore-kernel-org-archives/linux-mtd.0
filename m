Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuiV3-0002XL-Lr
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 07:28:44 +0000
Subject: Re: [PATCH 1/4] [MTD] Update sysfs documentation
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <a95a62fe0904082251n45504a51r1847cd25b9d88583@mail.gmail.com>
References: <a95a62fe0904082251n45504a51r1847cd25b9d88583@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Apr 2009 10:28:17 +0300
Message-Id: <1239953297.3390.242.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>, greg@kroah.com,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-08 at 22:51 -0700, Kevin Cernekee wrote:
> Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
> 
> ---
>  Documentation/ABI/testing/sysfs-class-mtd |  125 +++++++++++++++++++++++++++++
>  1 files changed, 125 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-mtd

Pushed, to l2-mtd-2.6.git. This does not guarantee anything,
it just mean I'll ping dwmw2 to pull from that tree.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
