Received: from enigma.barak.net.il ([212.150.48.99])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dZV9-00029r-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 16:21:52 +0000
Message-ID: <441701c1ba2c$2cf1dc60$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "Michael Michael" <memmel2@yahoo.com>,
	<linux-mtd@lists.infradead.org>
References: <20020220063356.59191.qmail@web14702.mail.yahoo.com>
Subject: Re: Slow jffs2 startup on DOM
Date: Wed, 20 Feb 2002 18:32:22 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

----- Original Message -----
From: "Michael Michael" <memmel2@yahoo.com>
To: <linux-mtd@lists.infradead.org>
Sent: Wednesday, February 20, 2002 8:33 AM
Subject: Slow jffs2 startup on DOM


> Hello I'm using jffs2 on a DOM with the block device
> driver. I find the startup times very slow. It seams
> to me from reading the source that jffs2 may be
> scanning every block with this driver. It takes about
> 3 min for the first mount. Is there anyway to fix this
> ?
> Would it be  possible to add say a checkpoint such
> that if the disk  is "clean" we proceed with normal
> startup ?
> I do write to the DOM but I can certianly ensure that
> its clean except on sudden power downs.  I suspect
> that a lot of people who write to the devices can
> ensure that the writes are checkpointed so we don't
> have to do a full scan.
>
> Mike
>

in my case (mediaEngine + assabet), i encountered some slowness like you
did, just when i previously shutdown the device without unmounting + syncing
first
(this commands are regularly handled by  S0Reboot on rc6.d dir)

Gad
