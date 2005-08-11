Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3Dtw-00065c-MM
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 10:19:23 -0400
Message-ID: <42FB5E72.2010402@ru.mvista.com>
Date: Thu, 11 Aug 2005 18:19:30 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'd like to implement power management for NAND flash on ARMv5 platform. 
However, I haven't seen any NAND driver implementing suspend/resume 
routines so I'm not sure how to do it in an appropriate way.

I've looked through mtd code and found mtd_pm_callback that should be 
called to handle PM events. This callback should in turn call 
mtd->suspend/mtd->resume functions, if any. Therefore one evident way of 
PM stuff implementation for this NAND flash is to provide suspend/resume 
functions. However, pm_send (that calls mtd_pm_callback) is never called
on ARM targets. So I doubt if it's appropriate to implement PM for the 
driver this way since it's looking somehow obsolete.

Another way could be define the platform_device and provide its 
suspend/resume functions, that would be called during the power state 
transition. This is basically how SA1100 NOR flash mapping driver works, 
but for Intel CFI-compliant  NOR flash there're appropriate 
suspend/resume functions implemented, and NAND base driver is not the case.

So, unfortunately, both methods don't provide the level of integrity I'd 
like to have. The problem is that nand core has no state machine in its 
internals so the driver can't track the flash being in suspended state.

Could you point me how can I synchronize access requests to the flash 
with suspend/resume calls (e.g., fail requests when flash is in suspend 
state) ? Isn't it appropriate to implement a state machine here similar 
to NOR CFI's one?

TIA!

Vitaly
