Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKDHV-0002ZG-3A
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 06:01:22 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: simon@baydel.com
In-Reply-To: <E4E1C5BE221F@baydel.com>
References: <20041019214518.26339.qmail@web52703.mail.yahoo.com>
	<1098222917.12223.1020.camel@thomas>  <E4E1C5BE221F@baydel.com>
Content-Type: text/plain
Message-Id: <1098266000.12223.1504.camel@thomas>
Mime-Version: 1.0
Date: Wed, 20 Oct 2004 11:53:20 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Blocks On JFFS2/NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-20 at 11:40, Simon Haynes wrote:
> This 5 error business is only if you have relatively new code. Old code 
> generates an incorrect and permanent bad block after 1 failure. I am testing 
> the suggestion by Thomas that this is a page cache problem by always marking 
> an erase page as invalid. No errors as yet but I will keep you posted.

A cvs history search should reveal the changes to the nr errors thing
and to the page cache fixes. So you can verify against your particular
version.

tglx
