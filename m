Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168fvd-0004Rp-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 10:57:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0111260908050D.28381@jocke.lumentis.se> 
References: <0111260908050D.28381@jocke.lumentis.se>  <0111131653040B.28381@jocke.lumentis.se> 
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fwd: Cache mappings and invalidate 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Nov 2001 11:07:48 +0000
Message-ID: <16674.1006859268@redhat.com>
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

Joakim.Tjernlund@lumentis.se said:
>  It is almost like burst reads are disabled, but if I mess with the
> burst HW init sequence,  I get a lot of errors, so I take it that
> burst reads are enabled. 

What flash chip are you using, and have you actually put the flash chip in
to synchronous read mode?

--
dwmw2
