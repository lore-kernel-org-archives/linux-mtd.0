Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCacb-0000Sq-Vk
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 15:14:38 +0000
Subject: Re: [patch 2/4] mtdpart: memory accessor interface for MTD layer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200911172245.nAHMjm2s001889@imap1.linux-foundation.org>
References: <200911172245.nAHMjm2s001889@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Nov 2009 17:13:56 +0200
Message-Id: <1258989236.18407.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org, sudhakar.raj@ti.com,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-17 at 14:45 -0800, akpm@linux-foundation.org wrote:
> From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> 
> Implement memory accessor interface in the MTD layer which enables the
> kernel to access flash data.
> 
> This patch adds two new members to the mtd_partition structure, a function
> handler which will be called during setup of the partition and an argument
> to be passed to this setup function.

This patch was refused by David Woodhouse.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
