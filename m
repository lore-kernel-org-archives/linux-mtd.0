Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hSUR-0007KI-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2002 09:41:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020302162948.A14453@otii.com> 
References: <20020302162948.A14453@otii.com> 
To: Ray Lehtiniemi <rayl@otii.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: patch and two questions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 03 Mar 2002 09:52:31 +0000
Message-ID: <10677.1015149151@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

rayl@otii.com said:
> second, if i have a flash device which i want to partition, is it
> better to use add_mtd_partitions() or use the approach taken by mtd/
> drivers/mtd/maps/nora.c?  just looking at the code, they seem to
> accomplish the same thing, correct? 

They do the same thing. Nora.c was written before the generic partition 
stuff existed. Use add_mtd_partitions.

--
dwmw2
