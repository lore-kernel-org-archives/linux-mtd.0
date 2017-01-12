Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRbgx-00016b-6t
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 09:29:09 +0000
Date: Thu, 12 Jan 2017 12:27:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 18/18] mtd-cfi_cmdset_0020: Add some spaces for better
 code readability
Message-ID: <20170112092744.GB15314@mwanda>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
 <0e5ee358-fb62-5d0b-81cf-d73a1a47f6d4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e5ee358-fb62-5d0b-81cf-d73a1a47f6d4@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 11, 2017 at 09:55:20PM +0100, SF Markus Elfring wrote:
> -	timeo = jiffies + (HZ*2);
> +	timeo = jiffies + HZ * 2;

You've done this a couple times already, but these parenthesis are there
to make the code more readable don't delete them.

regards,
dan carpenter
