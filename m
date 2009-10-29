Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3Wrq-0007mu-Ch
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 15:24:55 +0000
Subject: Re: [PATCH v12 1/4]: mtdoops: Keep track of used/unused mtdoops
	pages in an array
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091029134111.315e6fdc@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134111.315e6fdc@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Oct 2009 17:24:43 +0200
Message-Id: <1256829883.29885.857.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-29 at 13:41 +0100, Simon Kagstrom wrote:
> This patch makes mtdoops keep track of used/unused pages in an array
> instead of scanning the flash after a write. The advantage with this
> approach is that it avoids calling mtd->read on a panic, which is not
> possible for all mtd drivers.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>

Pushed this one to my tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
