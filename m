Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142eOb-000139-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 19:01:57 +0000
Date: Sun, 3 Dec 2000 19:01:42 GMT
From: john halewood <john@frumious.unidec.co.uk>
Message-Id: <200012031901.eB3J1ge27396@frumious.unidec.co.uk>
To: dwmw2@infradead.org, john@frumious.unidec.co.uk
Subject: Re: M-System DOC Millennium with MTD.
Cc: mtd@infradead.org, Simon.Wood@pace.co.uk
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote, re misidentification/failure to identify DoC's
 with the M-Systems doc2.fff firmware:
>You can also work round this by disabling CONFIG_MTD_DOCPROBE_55AA

Yup. you also need to disable DOCPROBE_HIMEM as well, otherwise you just
get a lot of messages of the form "found possible Doc at XXXXX" and no
mtd device.
 I've been messing with these parameters so much recently I've sometimes
felt like hacking a /proc interface to them to avoid the reconfig -
recompile modules - rmmod /insmod cycle, which can be quite painful on a slow
processor. In the long run though i think pollution of the /proc space
is probably left to those who've done it so well in the past

john


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
