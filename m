Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VK7pE-0001aQ-0I
 for linux-mtd@lists.infradead.org; Thu, 12 Sep 2013 14:24:53 +0000
Received: by mail-wi0-f182.google.com with SMTP id ez12so3638329wid.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2013 07:24:27 -0700 (PDT)
Message-ID: <5231CE99.8080703@parkeon.com>
Date: Thu, 12 Sep 2013 16:24:25 +0200
From: Martin Fuzzey <mfuzzey@parkeon.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Boards only supporting 16bit ram writes
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a board with a FRAM device which I am trying to get to work with 
mtd-ram, on a DT based system (i.MX53) using physmap-of.

The chip is connected to a 16 bit data bus, however the signals that are 
supposed to indicate which of the upper and lower bytes
are not connected to the processor but forced so as to use both bytes.

This means that all write operations must be done 16bits at a time (read 
operations are fine since the processor handles that).

Looking at the mtd code it seems possible to support this using specific 
mapping functions.
However it's likely to be a little complicated / ugly, especially for 
partial unaligned writes which will have to do a read, mask, write.

So my questions:
* Is there currently any way of doing this?
* Would a patch implementing it be acceptable for mainline or would it 
be a case of "go fix your hardware"?

Also while looking at this I noticed that 
Documentation/devicetree/bindings/mtd/mtd-physmap.txt refers to a property
"device-width" which is used in a number of files in 
arch/powerpc/boot/dts but I can't find any code that actually implements it.

Regards,

Martin
