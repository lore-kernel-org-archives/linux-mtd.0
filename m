Received: from [80.190.106.10] (helo=taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ArXtr-0001LQ-UM
	for linux-mtd@lists.infradead.org; Fri, 13 Feb 2004 07:38:12 +0000
From: Florian Schirmer <jolt@tuxbox.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Feb 2004 08:38:04 +0100
References: <20040212195532.38851.qmail@web20728.mail.yahoo.com>
In-Reply-To: <20040212195532.38851.qmail@web20728.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200402130838.06005.jolt@tuxbox.org>
cc: Shawn Jin <shawnxtech@yahoo.com>
Subject: Re: JFFS2: No space left on a blank mtd device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Is it mandatory to make a 'blank' JFFS2 filesystem image even for a blank
> mtd device?

jffs2 will refuse to mount unless at least one jffs2 was found on the device. 
Thats the reason why you can't mount an empty device.

Just use eraseall -j <mtddevice>

It will create a dummy inode so you can mount the device.

Regards,
  Florian
