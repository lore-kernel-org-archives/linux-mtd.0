Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSWq0-0002M5-2P
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 16:03:04 +0000
Received: by ewy3 with SMTP id 3so904645ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 09:03:02 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>, Roman Tereshonkov
	<roman.tereshonkov@nokia.com>
In-Reply-To: <20110602064832.GA7319@july>
References: <20110602064832.GA7319@july>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:58:52 +0300
Message-ID: <1307116732.3069.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-02 at 15:48 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> There's no case to use the subpage for 4KiB pagesize.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

I think Roman was testing subpage support with 4KiB pages and it worked,
but I'm not sure and I did not read the specs. Let's ask Roman.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
