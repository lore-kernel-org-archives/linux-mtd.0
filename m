Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142emn-000164-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 19:26:57 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142emm-00015y-00
	for mtd@infradead.org; Sun, 03 Dec 2000 19:26:56 +0000
Date: Sun, 3 Dec 2000 19:26:53 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: john halewood <john@frumious.unidec.co.uk>
cc: <mtd@infradead.org>,  <Simon.Wood@pace.co.uk>
Subject: Re: M-System DOC Millennium with MTD.
In-Reply-To: <200012031901.eB3J1ge27396@frumious.unidec.co.uk>
Message-ID: <Pine.LNX.4.30.0012031924220.13316-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 3 Dec 2000, john halewood wrote:

> David Woodhouse wrote, re misidentification/failure to identify DoC's
>  with the M-Systems doc2.fff firmware:
> >You can also work round this by disabling CONFIG_MTD_DOCPROBE_55AA
>
> Yup. you also need to disable DOCPROBE_HIMEM as well, otherwise you just
> get a lot of messages of the form "found possible Doc at XXXXX" and no
> mtd device.

Yep. Although I've now removed the annoying complaints if DOCPROBE_55AA
isn't defined.

>  I've been messing with these parameters so much recently I've sometimes
> felt like hacking a /proc interface to them to avoid the reconfig -
> recompile modules - rmmod /insmod cycle, which can be quite painful on a slow
> processor.

This is what MODULE_PARM was invented for :)

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
