Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aNOD-0003f5-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 21:17:13 +0100
Message-ID: <30724FF712DFD2119E6200104B244892011974E3@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'Patrick Allaire' <pallaire@gameloft.com>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Mtd Not loaded at boot up !
Date: Fri, 24 Aug 2001 15:06:39 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

You'r probably missing the "map" driver (like physmap.c, sc520cdp.c or any
other in the same dir).

The other mtd stuff does not do anything till the map driver gets called
(either on module load time or kernel init time).

Vipin

-----Original Message-----
From: Patrick Allaire [mailto:pallaire@gameloft.com]
Sent: Friday, August 24, 2001 3:00 PM
To: 'linux-mtd@lists.infradead.org'
Subject: Mtd Not loaded at boot up !



Hi,

I sont see any messages from mtd or DoC when I boot the kernel. I have
compiled the Mtd and DoC2000 support IN the kernel (not in a module). Do I
have to do something else to trigger the search of the DoC on boot ?

thank you.


Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
