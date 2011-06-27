Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qb4gZ-0001PO-23
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 05:48:39 +0000
Received: by pwi3 with SMTP id 3so3190624pwi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 22:48:36 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: make ofpart buildable as a separate module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 27 Jun 2011 08:49:23 +0300
In-Reply-To: <1309122180-12838-2-git-send-email-dbaryshkov@gmail.com>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
	<1309122180-12838-2-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309153769.23597.15.camel@sauron>
Mime-Version: 1.0
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-27 at 01:02 +0400, Dmitry Eremin-Solenikov wrote:
> As ofpart now uses a standard mtd partitions parser interface, make it
> buildable as a separate module. Also provide MODULE_DESCRIPTION and
> MODULE_AUTHOR for this module.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Pushed this one to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
