Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17oJ4v-0007PY-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2002 08:35:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200209082049.02572.mtd@mcmen.demon.co.uk> 
References: <200209082049.02572.mtd@mcmen.demon.co.uk>  <200209081726.50430.mtd@mcmen.demon.co.uk> <20020908173635.GA19559@wohnheim.fh-wedel.de> 
To: adr <mtd@mcmen.demon.co.uk>
Cc: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
    Mtd <linux-mtd@lists.infradead.org>
Subject: Re: Writing an mtd user module 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Sep 2002 08:35:23 +0100
Message-ID: <23606.1031556923@redhat.com>
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

mtd@mcmen.demon.co.uk said:
>  What was wrong, the documentation on the websiste or my
> interpretation of it?  Am I to take it the notification functions are
> irrelevant except when devfs  is being used?

The notification functions are irrelevant if you don't want to be notified 
when new devices are added or when devices go away.

In the case of the mtdblock device, yes that means they're irrelevant when 
devfs is not used. Only in the case where devfs is used do you need to do 
anything (change contents of /dev/mtdblock/) on addition/removal of devices.

You probably want something like JFFS2's read_super() or get_sb() functions 
to allow you to mount a single device.

--
dwmw2
