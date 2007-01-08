Received: from mta1.siol.net ([193.189.160.88])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H3seo-0005rp-4k
	for linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 06:27:18 -0500
Received: from edge2.siol.net ([10.10.10.211]) by mta1.siol.net with ESMTP
	id <20070108112635.YXAL25969.mta1.siol.net@edge2.siol.net>
	for <linux-mtd@lists.infradead.org>; Mon, 8 Jan 2007 12:26:35 +0100
Received: from pc002 ([193.77.157.20]) by edge2.siol.net with SMTP
	id <20070108112632.JKHY28515.edge2.siol.net@pc002>
	for <linux-mtd@lists.infradead.org>; Mon, 8 Jan 2007 12:26:32 +0100
Message-ID: <00a901c73317$a2918a60$3500a8c0@ISKRAMEDICAL.SI>
From: "Klemen Medical" <klemen@iskramedical.si>
To: <linux-mtd@lists.infradead.org>
Subject: Node totlen on flash
Date: Mon, 8 Jan 2007 12:24:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-2";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Everyone!

I am using kernel 2.6.17 and mtd 1.0.0. PXA255 and intel flash 16MB.
Everything works fine, but when I start my custom application I get warning 
or error:
Node totlen on flash (0xffffffff != totlen from node ref (0x00000044)

Is this serious problem ? if yes, what could I do ?
I also get warning when I write file larger than 4kB:
Node CRC c369fc78 != calculated CRC 41c8679c for node at 00aa3b58

But I don't see, that would be something wrong with any file !

Thanks for advice!
regards
Klemen 
