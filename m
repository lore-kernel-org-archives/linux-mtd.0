Received: from pd95231a4.dip.t-dialin.net ([217.82.49.164] helo=server.local)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iy30-0005CK-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 13:35:06 +0000
Message-ID: <3C876F87.2010903@gmx.de>
Date: Thu, 07 Mar 2002 14:47:51 +0100
From: Juergen Brunk <juergen.brunk@gmx.de>
MIME-Version: 1.0
To: Gad Hayisraeli <gad@syete.co.il>
CC: Linux-mtd List <linux-mtd@lists.infradead.org>,
   Linux-Arm List <linux-arm@lists.arm.linux.org.uk>,
   JFFS dev list <jffs-dev@axis.com>
Subject: Re: dump for jffs2
References: <002701c1c5dc$c9ba47b0$1900000a@v.vmanage.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hello!

> why i need it ? cause i used rsync and it RUINED my links !
> every link to /bin/something has become to bin/somehting !!
> (and i tried every option ijn this damn program to solve this, but nada...)


  rsync -avz foo:src/bar /data/tmp

        this would recursively transfer all files from the  direc­
        tory  src/bar  on  the  machine foo into the /data/tmp/bar
        directory on the local machine. The files are  transferred
        in  "archive"  mode,  which  ensures  that symbolic links,
                                                   ^^^^^^^^^^^^^^
        devices, attributes, permissions, ownerships etc are
        preserved in the transfer.
        ^^^^^^^^^

May this help you?

Regards, Juergen
