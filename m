Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U8jo-0006FQ-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 15:21:12 +0100
Date: Wed, 30 Aug 2000 16:21:28 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Miguel Freitas <miguel@cetuc.puc-rio.br>, mtd@infradead.org
Subject: Re: GRUB on DOC: 2Mb issues
Message-ID: <20000830162128.A952@localhost>
References: <20000828185018.A2777@localhost> <10312.967625826@cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <10312.967625826@cygnus.co.uk>; from dwmw2@infradead.org on Wed, Aug 30, 2000 at 09:57:06AM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, Aug 30, 2000 at 09:57:06AM +0100, David Woodhouse wrote:

> doc_stage1.S could be hacked to work with both.

Sure. I posted my 2 Mb modifications just for reference.

> See the existing loader code in the DiskOnChip firmware for inspiration.

I'll think a bit about that - but this requires putting identification
code into doc_stage1.S - and maintaining it. It's probably worth doing though.

Ciro

-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
