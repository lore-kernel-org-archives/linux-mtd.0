Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nFlB-0006Jw-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 10:50:41 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Fri, 6 Sep 2002 02:50:34 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: hno@marasystems.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC 2000 and GRUB
Reply-To: mateo@posta.star.si
Message-Id: <20020906095035.3FD76395B@sitemail.everyone.net>
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

Hi Henrick

>> I thought about loading this grub firmware, but the only
>> problem is, that I cannot boot the system, with the DOC!!
>
>Which makes that DoC trash until you find a way to reprogram it safely..

Would this idea work?

Since I do not have any ISA card to put the DOC into, I would
put the DOC in the separate socket, which would have the pin
that leads to the CS (chip select) pin on the DOC connected
to the switch.
During the BIOS boot I would turn this switch off, so that
(hopefully!) the DOC would not be found (no grub code executed).
After the lilo boot prompt appears (from the HD) I would turn
this to ON and (hopefully) the Linux would find the DOC.

Comments?

Regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
