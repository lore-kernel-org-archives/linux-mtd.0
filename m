Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1OAD-0002Gd-BF
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 07:20:18 -0500
Date: Wed, 16 Feb 2005 13:20:16 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: mtd liste <linux-mtd@lists.infradead.org>
Message-ID: <20050216122015.GB16239@synertronixx3>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1108555269.24721.83.camel@tglx.tec.linutronix.de>
Subject: Re: Oops vanilla 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-16 13:01 +0100 schrieb Thomas Gleixner:
> On Wed, 2005-02-16 at 12:47 +0100, Konstantin Kletschke wrote:
> > This way 2.6.10 Oopses on a virgin jffs2. Second boot is fine.
> > cat /dev/mtdblock3 > /dev/null
> > lasts three times longer than with 2.6.10-rc2.
> 
> Is this MTD from kernel or MTD CVS ?

MTD out of vanilla Kernel 2.6.10.

> Is this with XIP enabled ?

No.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
