Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EmqJ7-00072y-B2
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 05:25:55 -0500
Date: Thu, 15 Dec 2005 12:26:07 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20051215102607.GA20431@angel.research.nokia.com>
References: <43A1418F.3060701@imc-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43A1418F.3060701@imc-berlin.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Do I have to umount JFFS2?
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 15, 2005 at 11:12:31AM +0100, ext Steven Scholz wrote:
> Now I wonder if it is needed to umount this partition explicitly before
> rebooting? Or mount it read only first by having

JFFS2 is synhronous except for the write buffer (used with Nand chips).  
Doing sync is enough and flushes the write buffer.

Jarkko Lavinen
