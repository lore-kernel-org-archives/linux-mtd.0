Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONPJh-0004B3-As
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 11:56:01 +0000
Subject: Re: [PATCH 4/8] fs/ubifs: Use ERR_CAST
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005221200050.13021@ask.diku.dk>
References: <Pine.LNX.4.64.1005221200050.13021@ask.diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 14:53:28 +0300
Message-ID: <1276343608.19028.118.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-05-22 at 12:00 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use ERR_CAST(x) rather than ERR_PTR(PTR_ERR(x)).  The former makes more
> clear what is the purpose of the operation, which otherwise looks like a
> no-op.

Pushed to the ubifs-2.6.git tree, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
