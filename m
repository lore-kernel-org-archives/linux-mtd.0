Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwGLa-0003BA-A3
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 07:54:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200402252023.47907.tglx@linutronix.de>
References: <a06002001bc6281361918@[130.161.115.44]>
	 <200402252023.47907.tglx@linutronix.de>
Content-Type: text/plain
Message-Id: <1077782052.11584.1038.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 26 Feb 2004 07:54:12 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Subject: Re: Handling multiple NAND chips -- take 2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-02-25 at 21:22 +0100, Thomas Gleixner wrote:
> The idea is to add 3 pointers to the nand structure. 
> p_state		points to state 
> p_chip_lock	points to chip_lock
> p_wq			points to wq

/me shudders. No Hungarian Notation please. :)

-- 
dwmw2
