Received: from [2001:a60:0:488::2] (helo=mail-out.m-online.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjSJa-0004q7-2r
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 20:35:34 -0400
To: "Robert P. J. Day" <rpjday@mindspring.com>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sat, 10 Jul 2004 20:09:53 EDT."
	<Pine.LNX.4.60.0407102006050.4345@localhost.localdomain>
Date: Sun, 11 Jul 2004 02:35:21 +0200
Sender: wd@denx.de
Message-Id: <20040711003526.B6113C109F@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: sflash: CFI does not contain boot bank location. Assuming top. 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <Pine.LNX.4.60.0407102006050.4345@localhost.localdomain> you wrote:
> 
> actually AMD, but the kernel config lists AMD/Fujitsu as a single 
> option.  is the patch then still relevant?

Not really, as it adds code for the Fujitsu vendor ID.  For  AMD  the
code is already present.

> and another issue is that an older, hacked kernel -- 2.4.22-pre8 that 
> we got from embedded planet -- does work with the board, but in 

Expect that it contains pretty old MTD code...

> upgrading to the latest 2.4.25 DENX ppc kernel, i have no way of 
> knowing if there are any funny, subtle or obscure kernel fixes that we 
> got with it that i'm not aware of.

You can always check the CVS logs - either by hand ("cvs log" if  you
feel  like  it)  or with some tools that give better formatting (like
"cvsps").


Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
The most difficult thing in the world is to know how to  do  a  thing
and to watch someone else doing it wrong, without commenting.
                                                        -- T.H. White
