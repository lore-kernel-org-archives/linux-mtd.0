Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15C28g-0002gC-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 17:44:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B2E2C7A.F997FDEE@inventel.fr> 
References: <3B2E2C7A.F997FDEE@inventel.fr>  <20010618131315.A2156@crystal.2d3d.co.za> <20010618142215.M12246@arthur.ubicom.tudelft.nl> <20010618143104.A3715@crystal.2d3d.co.za> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: Abraham vd Merwe <abraham@2d3d.co.za>,
    Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Jun 2001 17:43:20 +0100
Message-ID: <29895.992882600@redhat.com>
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

xde@inventel.fr said:
>  Does it mean that I can not use do_map_probe("cfi", ...) with
> 28F160B3 chips ?

ISTR there are some versions of the 28F160 which are CFI-compliant. But if 
you've got the version which isn't, then no, you'll have to implement an 
Intel-specific probe routine for it. You can still hook into the 
cfi_cmdset_0001 back end code to actually _drive_ it though - you only have 
to do a probe routine.

--
dwmw2
