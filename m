Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KgRc-0006MZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 15:28:25 +0100
To: Studying MTD <studying_mtd@yahoo.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
        linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: why MTD model ?
References: <20020614095923.98432.qmail@web21502.mail.yahoo.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 19 Jun 2002 08:28:12 -0600
In-Reply-To: <20020614095923.98432.qmail@web21502.mail.yahoo.com>
Message-ID: <m3hejzbawz.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Studying MTD <studying_mtd@yahoo.com> writes:

> Please let me know, which block device is closest to
> Flash memory :-
> 1. Hard Disk
> 2. Floppy drive
> 3. PCMCIA memory card
> 4. Ramdisk
> 5. or some other block device ?

The closest are CD-RW disks....

I wonder if it would make sense to port them to the mtd layer?

Eric
