Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BIZXf-00083k-Md
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2004 21:50:59 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Dmitry Konyshev <dmitry.konyshev@auriga.ru>,
 linux-mtd@lists.infradead.org
Date: Tue, 27 Apr 2004 22:45:54 +0200
References: <408E752B.5010802@auriga.ru>
In-Reply-To: <408E752B.5010802@auriga.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404272245.54879.tglx@linutronix.de>
Subject: Re: nand bug
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 27 April 2004 16:58, Dmitry Konyshev wrote:
> Hi everybody,
>
>     nand_erase doesn't invalidate pagebuf member of nand_chip struct. It
> causes data incoherence.
>
> wbr, Dmitry.

Thanks. I will fix it tomorrow.

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
