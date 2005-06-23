Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlPIF-0005xL-W6
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2005 06:50:51 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Sean Young <sean@mess.org>
In-Reply-To: <20050622160333.GA79989@atlantis.8hz.com>
References: <20050622160333.GA79989@atlantis.8hz.com>
Content-Type: text/plain
Date: Thu, 23 Jun 2005 12:52:42 +0200
Message-Id: <1119523962.304.109.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: cvs?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-06-22 at 18:03 +0200, Sean Young wrote:
> cvs.infradead.org is unreachable. Is it okay via ipv6?
> 
> How are the ``Signed-off-by: '' lines handled? I have not included them 
> in cvs commit comments. 
> 

It makes the work to push to Linus/Andrew easier if they are in the
comment already, but I have a script to create them from the
infradead.org username, so its not that important.

tglx
