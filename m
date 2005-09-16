Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EGB9o-0008C3-CH
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2005 04:01:24 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: itche@bridgeport.edu
In-Reply-To: <200509151022.53885.itche@bridgeport.edu>
References: <200509151022.53885.itche@bridgeport.edu>
Content-Type: text/plain
Date: Fri, 16 Sep 2005 10:01:19 +0200
Message-Id: <1126857679.6509.568.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org
Subject: Re: Almost there
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-15 at 10:22 -0400, itche wrote:
> I still don't have the device fully functional.
> I am attaching a txt file containing the terminal output, and the 
> modifications i have made to some of the files involved.

Uuurg. The nand code you are obviously trying to get working is
stoneaged and broken. Same applies to your kernel (< 2.4.21 - right ?)

Full working NAND support is available in 2.6 kernels and some people
managed a backport to 2.4 (>2.4.27).

Sorry, 

tglx
