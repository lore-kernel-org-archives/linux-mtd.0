Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16j0OT-0005NS-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 16:05:25 +0000
Message-ID: <004301c1c5f3$92c9d470$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "Juergen Brunk" <juergen.brunk@gmx.de>
Cc: "Linux-mtd List" <linux-mtd@lists.infradead.org>,
	"Linux-Arm List" <linux-arm@lists.arm.linux.org.uk>,
	"JFFS dev list" <jffs-dev@axis.com>
References: <002701c1c5dc$c9ba47b0$1900000a@v.vmanage.com> <3C876F87.2010903@gmx.de>
Subject: Re: dump for jffs2
Date: Thu, 7 Mar 2002 18:17:27 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

i did not tried the -z option. just the other options. does it matter ?
i tried the latest version of rsync and your suggest also (except -z) , but
the same behaviour !
try it yourself, with root-style-links , and check first that the target
file does not exist at the target dir structure

(i synced /bin/busybox links. busybox does not exist in std. linux distrib.)

Gad
----- Original Message -----
From: "Juergen Brunk" <juergen.brunk@gmx.de>
To: "Gad Hayisraeli" <gad@syete.co.il>
Cc: "Linux-mtd List" <linux-mtd@lists.infradead.org>; "Linux-Arm List"
<linux-arm@lists.arm.linux.org.uk>; "JFFS dev list" <jffs-dev@axis.com>
Sent: Thursday, March 07, 2002 3:47 PM
Subject: Re: dump for jffs2


Hello!

> why i need it ? cause i used rsync and it RUINED my links !
> every link to /bin/something has become to bin/somehting !!
> (and i tried every option ijn this damn program to solve this, but
nada...)


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


_______________________________________________
http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm
http://www.arm.linux.org.uk/armlinux/mailinglists.php
Please visit the above addresses for information on this list.
