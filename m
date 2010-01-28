Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaX6D-0002As-Pg
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 16:20:10 +0000
Subject: Re: [PATCH] [MTD] maps/ixp4xx: Fix reading from half-word boundary
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <1263393370-3561-1-git-send-email-jon@ringle.org>
References: <1263393370-3561-1-git-send-email-jon@ringle.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Jan 2010 18:19:21 +0200
Message-ID: <1264695561.1973.150.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dsaxena@mvista.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-01-13 at 09:36 -0500, Jon Ringle wrote:
> ixp4xx updates:
>   - Fix handling of reads that don't start on a half-word boundary.
> 
> 
> Signed-off-by: Jon Ringle <jon@ringle.org>

I've pushed this patch to my l2-mtd-2.6.git/master tree

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
