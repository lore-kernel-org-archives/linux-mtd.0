Received: from pacific.moreton.com.au ([203.143.235.130] helo=bne.snapgear.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DpfTN-0004VI-AC
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2005 00:55:54 -0400
Message-ID: <42CA12BB.7080105@snapgear.com>
Date: Tue, 05 Jul 2005 14:55:23 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Andre <andre@rocklandocean.com>
References: <006301c576ad$70547490$6702a8c0@niro>
	<42C391A2.5020502@snapgear.com>
	<001b01c57d9c$761e6200$6702a8c0@niro>
In-Reply-To: <001b01c57d9c$761e6200$6702a8c0@niro>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	fabrice.bellard@netgem.com
Subject: Re: kernel messages from INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andre,

Andre wrote:
> Greg Ungerer wrote:
>>Andre wrote:
[snip]
>>>INFTL: formatting chain at block 24574
>>>INFTL: formatting block 24574
>>>INFTL: corrupt block 24575 in chain 24575, chain length 0, erase mark
>>>0xffff?
>>>INFTL: formatting chain at block 24575
>>>INFTL: formatting block 24575
>>> inftla: inftla1
>>>==================
>>>The INFTL messages do not appear on subsequent loads of the inftl
>>>module. Can somebody please explain what happened, i.e. should I be
>>>concerned?
>>
>>The INFTL code is telling you that it didn't think the chains
>>where logically correct. So it went ahead and tried to fix them up.
>>Once fixed you should not see any messages on the next boot (as
>>you didn't). Certainly not normal (or good).
> 
> 
> The device really started to act up on subsequent boot and I couldn't even
> format it anymore with m-sys tools. The dformat utility complained about not
> being able to find the bad block table.

My best guess is that the bad block info is stored differently than
what the current INFTL code can deal with then. I have only used it
on the Disk-on-chip Millenium+ parts, and the bad block table is stored
in the factory reserved region on those parts (which I believe is
different to their other DoC parts).

Can you fully restore it with the M-systems tools?

You will need to debug the INFTL init logic and figure out what how
the initial block layout is different.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a CyberGuard Company            PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
