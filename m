Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tw6O-0001E9-00
	for mtd-list@infradead.org; Sun, 29 Apr 2001 19:39:24 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tw6N-0001E3-00
	for mtd@infradead.org; Sun, 29 Apr 2001 19:39:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: ahennessy@mvista.com, ds@schleef.org, jonas.holmberg@axis.com,
    cwryu@debian.org, eauth@softsys.co.at, nico@cam.org
Subject: Flash driver probe/commandset separation.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 29 Apr 2001 19:38:17 +0100
Message-ID: <26353.988569497@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


We seem to have an unnecessary amount of duplication of flash chip driver 
code. We have three drivers for AMD/Fujitsu compatible chips - 
cfi_cmdset_0002.c, amd_flash.c and jedec.c. We have two drivers for Intel/
Sharp compatible chips - cfi_cmdset_0001.c and sharp.c.

Erwin noticed this and wrote code to fall back to an AMD-compatible probe
for JEDEC ID if the CFI probe failed, and then use cfi_cmdset_0002.c if 
appropriate. I think that was the right approach, but I don't like merging
the probes together like that. I think the mfr-specific probes for JEDEC ID 
should be kept separate. The map driver can always call them in order if 
the CFI probe fails, if it wants to.

What I'd like to do is provide core drivers for each of the different 
command sets, and separate probe functions which set up the necessary 
parameters and invoke the core drivers.

The current cfi_cmdset_000x drivers are the most generic, so I'd like to use
those as the basis of the core drivers, and ensure that they can fully
replace the functionality of the other individual drivers. 

We end up with:
	cmdset_intel (and sharp, etc.)
	cmdset_amd (and fujitsu, macronix, etc.)
	cfi_probe
	intel_jedec_probe
	amd_jedec_probe
	
Comments?

Even assuming people agree (or disagree unconvincingly :), I'm not sure
whether I should hold off on this until after I've sync'd up with Linus, or 
whether I should get this all done first and worry about feeding the new 
code to Linus later on. Probably the latter.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
