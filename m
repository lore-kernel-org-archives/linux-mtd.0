Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTFwb-0004C7-PV
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 18:21:58 +0000
Date: Fri, 19 Apr 2013 12:55:16 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mtd: Convert logging messages
Message-ID: <20130419165516.GA19480@logfs.org>
References: <1366394375.3901.36.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1366394375.3901.36.camel@joe-AO722>
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@lazybastard.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 April 2013 10:59:35 -0700, Joe Perches wrote:
>  	}
>  	list_add(&dev->list, &blkmtd_device_list);
> -	INFO("mtd%d: [%s] erase_size = %dKiB [%d]", dev->mtd.index,
> -			dev->mtd.name + strlen("block2mtd: "),
> -			dev->mtd.erasesize >> 10, dev->mtd.erasesize);
> +	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
> +		dev->mtd.index,
> +		dev->mtd.name + strlen("block2mtd: "),
> +		dev->mtd.erasesize >> 10, dev->mtd.erasesize);

I personally dislike the indent-to-braces style because it causes
unnecessary churn in patches like this.  The reindenting improves
nothing at all.  On the contrary, when going through revision history
at some point in the future I have to waste brain time to verify
whether any function change has slipped in or not.  It doesn't just
waste my time right now, it will continue to waste time in the future.
It will waste time when people care about revision history because
they encounter a bug, want a fix quick and are pressed for time.

If you care about my ack, please remove random churn.  This is not a
competition about who gets the most lines in git blame.

Jörn

--
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
