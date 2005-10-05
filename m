Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENCQJ-00047e-6V
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 12:47:36 -0400
Message-ID: <4344038C.3040506@mvista.com>
Date: Wed, 05 Oct 2005 09:47:08 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Holger Schurig <hs4233@mail.mn-solutions.de>
References: <200510051437.11856.hs4233@mail.mn-solutions.de>
	<200510051701.54776.hs4233@mail.mn-solutions.de>
In-Reply-To: <200510051701.54776.hs4233@mail.mn-solutions.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bug: Flash writing & suspending
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Holger Schurig wrote:

> I suspect that maybe MTD is writing data into the StrataFlash. While this 
> erasing & writings happens, it probably polls the built-in state-machine 
> status of the chips. Probably during such an operation the suspend-to-memory 
> takes place. The hardware switches off the power to the StrataFlash, but MTD 
> doesn't know about this.
> 
> At resume time, the StataFlash get's power and resets to some initial state. 
> Linux thaws the processes, among them the JFFS2/MTD thread. Which continues 
> to poll the StrataFlash, but because it has been resetted in the meantime ...

Right, the mtd state machine goes out of sync with the actual chip state 
when the system sleep mode power cycles the chips.

I submitted a patch to rmk's ARM patch system that adds flash chips as 
platform devices to the Lubbock (PXA25x eval board) and Mainstone 
(PXA27x eval board) files.  If that's accepted, I'll send a common 
PXA2xx platform driver for mtd that adds the PM suspend/resume callbacks 
as discussed here recently.

In the meantime, get the struct mtd_info's ->resume routine called 
somehow at resume time.

-- 
Todd
