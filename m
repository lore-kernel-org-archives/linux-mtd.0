Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sj819-0004u1-Lr
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 12:03:47 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 CRC problems
Date: Mon, 25 Jun 2012 14:01:59 +0200
References: <20070906081215.GA5693@anita.doom>
 <1189144034.14370.73.camel@sauron> <20070907074450.GB2143@z1.synertronixx>
In-Reply-To: <20070907074450.GB2143@z1.synertronixx>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201206251401.59546.sr@denx.de>
Cc: Konstantin Kletschke <lists@ku-gbr.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Konstantin!

While debugging and researching a problem we experience on our MPC5200 system, 
I found a thread on the MTD list "jffs2 with sync burst mode" initiated by 
you. This pretty much seems to be the same problem that we are experiencing on 
our MPC5200 system using JFFS2 on Intel Strataflash NOR devices.

-bash-3.2# mount -t jffs2 /dev/mtdblock3 /mnt
[  266.571967] jffs2: jffs2_scan_dirent_node(): Name CRC failed on node at 
0x002c0050: Read 0x1c0cc6df, calculated 0x5eb3f212
-bash-3.2#

While I'm continuing to dig into this, I wanted to "poll" your status on this 
issue. I know that it was a long time ago. But perhaps you can remember the 
outcome of this issue. What caused it? How did you fix it?

Any pointers are really welcome.

BTW: We are using latest Linux kernel here (currently testing with v3.4).

Thanks.

Best regards,
Stefan

--
DENX Software Engineering GmbH,      MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-0 Fax: (+49)-8142-66989-80 Email: office@denx.de
