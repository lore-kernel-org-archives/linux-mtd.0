Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13UdT1-0004zr-00
	for mtd-list@infradead.org; Fri, 01 Sep 2000 00:09:55 +0100
Date: Fri, 1 Sep 2000 01:10:57 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Miguel Freitas <miguel@cetuc.puc-rio.br>, mtd@infradead.org
Subject: Re: GRUB on DOC: 2Mb issues
Message-ID: <20000901011057.A1046@localhost>
References: <151C6E876B0@mamao.cetuc.puc-rio.br> <1512880772E@mamao.cetuc.puc-rio.br> <151C6E876B0@mamao.cetuc.puc-rio.br> <14431.967738848@passion.cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <14431.967738848@passion.cygnus.co.uk>; from dwmw2@infradead.org on Thu, Aug 31, 2000 at 05:20:48PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, Aug 31, 2000 at 05:20:48PM +0100, David Woodhouse wrote:

> I just committed it - it's working on 512-byte devices. I see no reason why 
> it shouldn't work on 256-byte devices if I copied Ciro's code correctly.

I tried it after your last commit and it works fine on my 2 Mb DOC.
I only needed to fix makecsum.c (reset checksum to zero - committed).

Ciro

-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
