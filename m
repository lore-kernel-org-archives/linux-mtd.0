Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.36] helo=albatross.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16b4jL-000364-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 19:06:11 +0000
Message-ID: <3C6ABB64.72BD8DD3@etx.ericsson.se>
Date: Wed, 13 Feb 2002 20:15:48 +0100
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Allen Curtis <acurtis@onz.com>, linux-mtd@lists.infradead.org
Subject: Re: Flash left in a write mode
References: <Pine.LNX.4.44.0202091114160.2394-100000@lapdancer.baythorne.internal>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:
 
> I'm willing to entertain the notion that the flash driver should do this
> on close, or we should have a reboot notifier registered that calls a new
> method in the mtd_info to reset the flash.

Is this needed ?? I have never seen a reboot without some type of reset
signal sent by the CPU. Not connecting that to the FLASH is the bug.


-- 
Kenneth Johansson	
Ericsson Telecom                  Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se
