Received: from mail22.messagelabs.com ([193.109.255.115])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19XeGs-0002OH-1B
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2003 10:51:26 +0100
Received: from stevejunior (unknown [192.168.200.17])
	by netstar.stirling-dynamics.com (Postfix) with SMTP id DFB1A9802
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Jul 2003 10:51:04 +0100 (BST)
Message-ID: <000701c3407f$9b34aa10$11c8a8c0@stevejunior>
From: "Stephen Brown" <sbrown@stirling-dynamics.com>
To: <linux-mtd@lists.infradead.org>
References: <bdsdl7$gvb$1@main.gmane.org>
Date: Wed, 2 Jul 2003 10:52:08 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Diskonchip MD2200-D16 redhat installation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

basically the best place to start is the 'howto boot disk' this will tell
you exactly how to build a linux boot  for a floppy disk, the principles for
building on be it flash or harddrive is exactly the same, infact i returned
to this website quite a few times,

http://www.tldp.org/HOWTO/Bootdisk-HOWTO/

just for testing build a 2 part floppy disk, one with kernel and one with
root and practise booting it from the floppy disk,

i think the best way tho is to prepare the DOC with jffs then i assume you
can build your root fs and kernel on it and not worry too much about power
down etc?

regards stephen
----- Original Message -----
From: "sam Njengah" <sam@tsl-online.com>
To: <linux-mtd@lists.infradead.org>
Sent: Wednesday, July 02, 2003 4:07 AM
Subject: Diskonchip MD2200-D16 redhat installation


> How do I install a minimal redhat 7.2 on the DiskonChip (16mb) to load a
1mb
> application.
> Urls as references highly welcomed
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ________________________________________________________________________
> This e-mail has been scanned for all viruses by Star Internet. The
> service is powered by MessageLabs. For more information on a proactive
> anti-virus service working around the clock, around the globe, visit:
> http://www.star.net.uk
> ________________________________________________________________________
>


________________________________________________________________________
This e-mail has been scanned for all viruses by Star Internet. The
service is powered by MessageLabs. For more information on a proactive
anti-virus service working around the clock, around the globe, visit:
http://www.star.net.uk
________________________________________________________________________
