Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1OXK-0002or-RS
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 07:44:11 -0500
Date: Wed, 16 Feb 2005 13:44:09 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: mtd liste <linux-mtd@lists.infradead.org>
Message-ID: <20050216124409.GC16239@synertronixx3>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
	<20050216122015.GB16239@synertronixx3>
	<1108556645.24721.86.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1108556645.24721.86.camel@tglx.tec.linutronix.de>
Subject: Re: Oops vanilla 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-16 13:24 +0100 schrieb Thomas Gleixner:

> Can you verify, that this happens with MTD CVS code too ?

I linked drivers/mtd and fs/jffs2 into 2.6.10:

  LD      fs/built-in.o
  drivers/mtd/Makefile:11: /Makefile.inc: No such file or directory

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
