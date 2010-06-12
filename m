Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONRd4-0002po-Qq
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 14:24:11 +0000
Subject: Re: [patch] mtd/sst25l: check for null consistently
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20100522201626.GJ22515@bicker>
References: <20100522201626.GJ22515@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 17:21:01 +0300
Message-ID: <1276352461.19028.120.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Andre Renaud <andre@bluewatersys.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-05-22 at 22:16 +0200, Dan Carpenter wrote:
> The rest of the function assumes that "data" can be null.  I don't know
> the code well enough to say whether it can actually be null, but there 
> is no harm in checking here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Pushed to l2-mtd-2.6.git, Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
