Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BI55w-0001zz-5w
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2004 13:20:20 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
 linux-mtd@lists.infradead.org
Date: Mon, 26 Apr 2004 14:15:06 +0200
References: <01139FC052A0D411900B00508B9535FC13AC405C@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC13AC405C@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404261415.06559.tglx@linutronix.de>
Subject: Re: Where can I get nand16.c
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 26 April 2004 14:00, Shen Aaron-r62966 wrote:
> Hi all,
>
>   I still can't find a way to support Samsung 16 bit NAND flash. Please
> inform or send me a nand16.c for reference.

The support for 16 bit NAND is incorporated into the generic NAND driver now. 

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
