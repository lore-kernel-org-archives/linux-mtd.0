Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3Uez-0004H2-2N
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 13:03:30 +0000
Date: Thu, 29 Oct 2009 14:03:19 +0100
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: Claudio Scordino <claudio@evidence.eu.com>
Subject: Re: [PATCH] atmel_nand: silence compiler warning by removing unused
	variable
Message-ID: <20091029140319.0e58d862@hcegtvedt.norway.atmel.com>
In-Reply-To: <4AE9908D.5090307@evidence.eu.com>
References: <1256817893-16413-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<4AE9908D.5090307@evidence.eu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 Oct 2009 13:54:37 +0100
Claudio Scordino <claudio@evidence.eu.com> wrote:

> Hans-Christian Egtvedt ha scritto:
> > This patch removes the eccpos variable from the atmel_nand_calculate function,
> > thus silencing a compiler warning about unused variable.
> >   
> Hi,
> 
>    I already sent this patch to this list on October 7th.
> 

Okay, great, sorry for the noise then. I was working on Torvalds master
branch and spotted the trivial warning.

-- 
Best regards,
Hans-Christian Egtvedt
