Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nwydk-0008Sl-2A
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 14:11:28 +0000
Subject: Re: [mtd-utils patch] mkfs.jffs2: fix --enable-compressor
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Bunk <bunk@kernel.org>
In-Reply-To: <20100224133229.GA23442@localhost.pp.htv.fi>
References: <20100224133229.GA23442@localhost.pp.htv.fi>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 31 Mar 2010 16:50:03 +0300
Message-ID: <1270043403.15073.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-02-24 at 15:32 +0200, Adrian Bunk wrote:
> The short option -X was working, but the documented long option
> --enable-compressor was missing.
> 
> Signed-off-by: Adrian Bunk <bunk@kernel.org>

Pushed to the mtd-utils.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
