Received: from karma.reboot.ca ([67.15.48.17])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DqDEo-0003aV-40
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 12:59:07 -0400
Message-ID: <001701c5824c$69e8ff90$6702a8c0@niro>
From: "Andre" <andre@rocklandocean.com>
To: "Greg Ungerer" <gerg@snapgear.com>
References: <006301c576ad$70547490$6702a8c0@niro>
	<42C391A2.5020502@snapgear.com>
	<001b01c57d9c$761e6200$6702a8c0@niro>
	<42CA12BB.7080105@snapgear.com>
Date: Wed, 6 Jul 2005 10:01:53 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

[snip]
>>>> INFTL: formatting chain at block 24574
>>>> INFTL: formatting block 24574
>>>> INFTL: corrupt block 24575 in chain 24575, chain length 0, erase
>>>> mark 0xffff?
>>>> INFTL: formatting chain at block 24575
>>>> INFTL: formatting block 24575
>>>> inftla: inftla1
>>>> ==================
>>>> The INFTL messages do not appear on subsequent loads of the inftl
>>>> module. Can somebody please explain what happened, i.e. should I be
>>>> concerned?
>>>
>>> The INFTL code is telling you that it didn't think the chains
>>> where logically correct. So it went ahead and tried to fix them up.
>>> Once fixed you should not see any messages on the next boot (as
>>> you didn't). Certainly not normal (or good).
>>
>>
>> The device really started to act up on subsequent boot and I
>> couldn't even format it anymore with m-sys tools. The dformat
>> utility complained about not being able to find the bad block table.
>
> My best guess is that the bad block info is stored differently than
> what the current INFTL code can deal with then. I have only used it
> on the Disk-on-chip Millenium+ parts, and the bad block table is
> stored in the factory reserved region on those parts (which I believe
> is different to their other DoC parts).

here is a link to somebody else that is using the exact same part, although
he is experiencing different problems:
http://thread.gmane.org/gmane.linux.drivers.mtd/12814

Can you tell from this where the bad block table is stored?

> Can you fully restore it with the M-systems tools?

no, format wouldn't work anymore and I couldn't boot the system with the DoC
installed because of some corruption in the boot sector - the BIOS would
complain and would hang, so I decided to send it back to the supplier for
replacement.

>
> You will need to debug the INFTL init logic and figure out what how
> the initial block layout is different.

There is just one thing I would like to know: starting with an m-sys
formatted device, does linux-mtd touch anything on the device during the
inftl mount? The inftl debug messages seem to indicate that certain
'formatting' operations are taking place. Maybe I am overly protective, but
shouldn't 'mount' be a read-only operation?
