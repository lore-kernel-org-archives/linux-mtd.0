Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WAst-0000tf-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 07:44:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200301072004.45259.tglx@linutronix.de> 
References: <200301072004.45259.tglx@linutronix.de>  <515CABE7496FD111AA3300201829FCBE3552DD@archie.gsi.synergie-inf.com> <20030106230808.9E85F439D@tiger.actrix.co.nz> 
To: tglx@linutronix.de
Cc: manningc2@actrix.gen.nz, m.neiger@synergie-inf.com,
    "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: 16 NANDS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 Jan 2003 08:14:59 +0000
Message-ID: <4752.1042013699@passion.cambridge.redhat.com>
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

tglx@linutronix.de said:
>  The  functions are not that different, but it's better to have a
> little duplicated  code instead of if (buswitdh == x) then else....
> crap.

Bear in mind that if/then/else crap can be hidden inside #defines fairly 
effectively, and optimises away perfectly in the case where you compile for 
only one buswidth -- unlike out-of-line function calls. 

What Nico did with cfi_read() et al is worth considering.

--
dwmw2
