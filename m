Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MapRR-0002O9-0I
	for linux-mtd@lists.infradead.org; Tue, 11 Aug 2009 11:23:01 +0000
Subject: Re: [PATCH 1/5 v3] [MTD-UTILS] Unified reading from standard input
	and from file
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <4A7A2678.6030303@orb.com>
References: <4A7A2678.6030303@orb.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 Aug 2009 14:21:14 +0300
Message-Id: <1249989674.25202.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-08-05 at 17:40 -0700, Jehan Bing wrote:
> Use same code path for reading data (not the OOB) from either the 
> standard input or a regular file.
> 
> Signed-off-by: Jehan Bing <jehan@orb.com>

I've pushed patches 1-5 to mtd-utils.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
