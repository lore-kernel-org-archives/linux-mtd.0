Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13UA4d-0006fh-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 16:46:47 +0100
Date: Wed, 30 Aug 2000 17:47:48 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Re: GRUB on DOC: 2Mb issues
Message-ID: <20000830174748.A1198@localhost>
References: <1512880772E@mamao.cetuc.puc-rio.br> <20000828185018.A2777@localhost> <1512880772E@mamao.cetuc.puc-rio.br> <16105.967648027@passion.cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <16105.967648027@passion.cygnus.co.uk>; from dwmw2@infradead.org on Wed, Aug 30, 2000 at 04:07:07PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, Aug 30, 2000 at 04:07:07PM +0100, David Woodhouse wrote:

> 0x000 - 0x0ff holds generic register setup code.
> 0x100 - 0x1ff holds code specific to the 256-byte-page devices.
> 0x200 - 0x2ff holds code specific to the 512-byte-page devices.

Clever, I admit. And cool. :)

> Start your grub stage2 at 0x300.

...and put it at offset 0x400 in the firmware image.

Ciro

-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
