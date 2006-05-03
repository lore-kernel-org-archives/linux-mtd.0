Received: from emc.emcraft.com ([80.240.96.158])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbIRl-0007tl-VA
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 10:35:26 -0400
Received: from emc.emcraft.com ([127.0.0.1] helo=[::1])
	by emc.emcraft.com with esmtp (Exim 4.10) id 1FbIPH-0002PG-00
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 18:32:47 +0400
From: Dmitry Bazhenov <atrey@emcraft.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 3 May 2006 18:35:34 +0400
References: <200605031556.37660.atrey@emcraft.com> <44589BCE.2060402@yandex.ru>
	<200605031828.51552.atrey@emcraft.com>
In-Reply-To: <200605031828.51552.atrey@emcraft.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605031835.34212.atrey@emcraft.com>
Subject: Re: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03 May 2006 16:02, Artem B. Bityutskiy wrote:
> Can it happen with a real-life flash device? If it can, we have to 
> switch to 64-bit versions.

But it can't happen on unmount since in normal circumstance all previous nodes 
are obsoleted after the new node has been written. Sorry, my mistake. So, no 
need for 64-bit versions.

--
Regards,
Dmitry
