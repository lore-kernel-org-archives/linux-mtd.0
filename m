Received: from web52204.mail.yahoo.com ([206.190.39.86])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bza7I-00061s-JA
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2004 08:09:36 -0400
Message-ID: <20040824120929.1377.qmail@web52204.mail.yahoo.com>
Date: Tue, 24 Aug 2004 05:09:29 -0700 (PDT)
From: Ed Co <edityacomm_knb@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Bottom halves being disabled
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

In the NOR driver code, the spin locks are acquired
everywhere with bottom halves disabled using the
spin_lock_bh() API. My doubt is why are the bottom
halves disabled? (Doesn't that add to the real time
latency on the system!)

Hoping someone would clear the doubt

Ed


		
_______________________________
Do you Yahoo!?
Win 1 of 4,000 free domain names from Yahoo! Enter now.
http://promotions.yahoo.com/goldrush
