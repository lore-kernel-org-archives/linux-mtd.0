Received: from ptb-relay01.plus.net ([212.159.14.212])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgR85-0001WO-BK
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 12:15:30 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Amaury Jacquot <sxpert@esitcom.org>
In-Reply-To: <41C6FC08.2010602@esitcom.org>
References: <41C6FC08.2010602@esitcom.org>
Content-Type: text/plain
Date: Mon, 20 Dec 2004 17:15:31 +0000
Message-Id: <1103562931.10786.66.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 and compact flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-12-20 at 17:21 +0100, Amaury Jacquot wrote:
> a couple weeks ago, I sent mail to this list about using JFFS2 on a 
> compact flash card, but haven't received any answer...
> 
> can anyone answer me, or point me to a document describing the procedure 
> it it is at all doable ?

Hi,

I guess it depends on how the compact flash is presented. If it appears
to the system via a hard drive interface (?) then the answer would be
yes.

I'm running JFFS2 on USB Flash keys (which appear as SCSI devices
via /dev/sd??) via the MTD block device emulator .. the default read
speed is poor and the write speed is non-existent .. however if you grab
my patch for blkmtd.c posted earlier, I'm pretty much getting raw
read/write speeds from the key.

hth
Gareth.


> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
