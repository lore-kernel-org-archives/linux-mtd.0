Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DdnD1-00050b-PI
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 06:45:56 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050602101959.GB11524@zappa>
References: <20050601134130.GA19482@synertronixx3>
	<429E87D5.5050906@thattiko.net>  <20050602101959.GB11524@zappa>
Content-Type: text/plain
Date: Thu, 02 Jun 2005 12:46:07 +0200
Message-Id: <1117709167.20785.86.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel flash that powers up locked
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-02 at 12:19 +0200, Konstantin Kletschke wrote:

> Why is cfi_intelext_unlock() called with ofs=0, is that correct?
> Shouldn't there be hardware addresses?

Maybe it helps if you read the code of the invoked function
(cfi_varsize_frob).

tglx
