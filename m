Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYcdE-0001Ex-5f
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 10:22:33 +0000
Subject: Re: [PATCH 01/25] r852: remove casts from void*
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kulikov Vasiliy <segooon@gmail.com>
In-Reply-To: <1277806498-30738-1-git-send-email-segooon@gmail.com>
References: <1277806498-30738-1-git-send-email-segooon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 12:57:56 +0300
Message-ID: <1279015076.31639.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Kernel Janitors <kernel-janitors@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-29 at 14:14 +0400, Kulikov Vasiliy wrote:
> Remove unnesessary casts from void*.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Pushed whole series to l2-mtd-2.6.git / master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
