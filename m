Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HhMnw-0002qc-W2
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 05:31:54 -0400
Date: Fri, 27 Apr 2007 11:31:44 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Subject: Re: corruption of JFFS2 filesystem, csize is set to 0 after moving
	a block
Message-ID: <20070427113144.2f338d26@dhcp-252-105.norway.atmel.com>
In-Reply-To: <1177665229.18969.143.camel@localhost.localdomain>
References: <1177599259.18969.111.camel@localhost.localdomain>
	<1177602237.2755.414.camel@pmac.infradead.org>
	<1177665229.18969.143.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Apr 2007 11:13:49 +0200
Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com> wrote:

> The system is in do_signal, which is most likely a sign of the init
> process has received an unexpected signal. I assume it is due to one of
> the core libraries being corrupted.

FWIW, the avr32 update I'm about to push out will change the behaviour
of the exception handling code to panic when this happens instead of
trying to deliver the signal forever. I can try to backport it to
whatever version you're running, but I'm pretty sure your analysis is
correct (more specifically, I think init got a SIGBUS signal it didn't
want.)

Haavard
