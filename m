Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16A65F-0002Su-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 09:05:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011127141357.A29578@kosh.hut.fi> 
References: <20011127141357.A29578@kosh.hut.fi> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: CFI driver & flash banks 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 09:15:19 +0000
Message-ID: <15120.1007198119@redhat.com>
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

jlavi@iki.fi said:
>  Instead of accessing chip->state, should one also be able to access
> each banks like state chip->banks[bank].state ? 

Yep. In fact that 'struct flchip' would be more accurately named 'flbank' 
anyway - you need everything from it duplicated except the timing 
information, I think.

--
dwmw2
