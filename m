Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IZZYS-0007JS-FL
	for linux-mtd@lists.infradead.org; Sun, 23 Sep 2007 18:03:58 -0400
To: Saravanan Chanemouganandam <schane@osmozis.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: modify boot environment parameters
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Wed, 19 Sep 2007 18:04:23 +0200."
	<200709191804.24336.schane@osmozis.com>
Date: Mon, 24 Sep 2007 00:03:52 +0200
Sender: wd@denx.de
Message-Id: <20070923220352.8B3322405D@gemini.denx.de>
Cc: linux-arm@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <200709191804.24336.schane@osmozis.com> you wrote:
> 
> Are there utilities to modify the boot environment (like u-boot) block on the 
> flash from within the linux ?

Of course there are. But this is off topic here.

> I am looking for information to modify the boot environment block on the NOR 
> (/dev/mtd0) flash at offset 0x5000. 

See u-boot/tools/env/

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
I think there's a world market for about five computers.
         -- attr. Thomas J. Watson (Chairman of the Board, IBM), 1943
