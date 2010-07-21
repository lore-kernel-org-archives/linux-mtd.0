Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObXrQ-0006x7-3S
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 11:53:18 +0000
Subject: RE: [PATCH 0/4] mtd: add mtd repartition ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vivek <v.dalal@samsung.com>
In-Reply-To: <00bd01cb28ca$2cbade20$86309a60$%dalal@samsung.com>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1278568257.12733.34.camel@localhost>
	<1279706323.2306.2.camel@localhost>
	<00bd01cb28ca$2cbade20$86309a60$%dalal@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 14:46:24 +0300
Message-ID: <1279712784.2306.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	'Roman Tereshonkov' <roman.tereshonkov@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-21 at 17:14 +0530, Vivek wrote:
> > Removed from l2-mtd-2.6 - please, address the comments from me and Arnd.
> 
> We have also developed the similar solution for run-time partitioning support; it includes 3 ioctl's(for creating,deleting,changing permissions of partitions) and the mtd utility for partitioning(which supports resizing and deleting partitions, changing permissions). 
> Very shortly we are going to release that.

Sure, please, do.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
