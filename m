Date: Thu, 5 Jun 2008 17:24:44 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [RFC/PATCH 1/3] NAND multiple plane feature
In-Reply-To: <20080603172556.GB1224@logfs.org>
Message-ID: <alpine.LFD.1.10.0806051722080.16300@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805281332280.23606@pentafluge.infradead.org>
	<20080603172556.GB1224@logfs.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1831524198-1361828573-1212683085=:16300"
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1831524198-1361828573-1212683085=:16300
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi Jörn

Thank you very much for patches review. 

> > +		planeid = chip->read_byte(mtd);
> > +		/* Number of planes*/
> 
> This comment seems redundant.  And it fooled me for a few seconds.
> Remove it?

No problem. Will be removed.

Thanks,
Alexey
---1831524198-1361828573-1212683085=:16300--
