Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SaZc-0000U2-Qk
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2003 11:53:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Ken Gordon <kengordon@magneticscrolls.com>
In-Reply-To: <004101c33586$cb802a90$1207a8c0@kenlap>
References: <004101c33586$cb802a90$1207a8c0@kenlap>
Message-Id: <1055933659.2233.98.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 18 Jun 2003 11:54:20 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Getting a mtd_info with a valid map.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-18 at 11:45, Ken Gordon wrote:
> I'm trying to read the serial number from my Intel Strataflash (J3) suing
> mtd->read_user_prot_reg and mtd->read_fact_prot_reg. This code below looks
> to me like it should do the job but explodes because the mtd_info returned
> by get_mtd_device has a NULL priv field.

I don't understand. When the 'map' is NULL you still call
mtd->read_user_prot_reg() anyway... doesn't it work?

What do you think that 'priv' is an abbreviation for, by the way? Under
what circumstances do you think a programmer would name a variable like
that? :)

-- 
dwmw2
