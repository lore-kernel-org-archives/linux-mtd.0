Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TQg6-0005do-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 15:50:42 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E28@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Thu, 15 Feb 2001 16:49:47 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I forgot to ifdef the bootloc fix. I have done that now and committed it.

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
