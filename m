Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEC0Z-00020S-6R
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 19:54:43 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Tino Keitel <tino.keitel@innominate.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Date: Thu, 15 Apr 2004 20:50:25 +0200
References: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
In-Reply-To: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404152050.25417.tglx@linutronix.de>
Subject: Re: JFFS2 writes fail with 2.4.25
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 15 April 2004 16:40, Tino Keitel wrote:
> Hi folks,
>
> The system is an Intel XScale IXP425 board (ARM little endian) with 16
> MB NOR flash. I use the JFFS2 from the 2.4.25 kernel. Any hints what's
> wrong here?
>
Can you try  MTD CVS code ?

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
