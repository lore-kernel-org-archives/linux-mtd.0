Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fWC7-0004BC-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 01:14:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10202260324540.905-100000@pinot.profis.ro> 
References: <Pine.LNX.4.10.10202260324540.905-100000@pinot.profis.ro> 
To: Radu Corlan <rcorlan@pcnet.ro>
Cc: Thomas Gleixner <gleixner@autronix.de>,
    linux-mtd@lists.infradead.org, Joerg Zastrau <dl1bku@amsat.org>
Subject: Re: Support for parallel access in nand chips 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Feb 2002 01:25:09 +0000
Message-ID: <12603.1014686709@redhat.com>
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

rcorlan@pcnet.ro said:
>  ok - i was going to make a separate source anyway. Do you know if the
> upper layers mind the 32k erase size?

They'll be fine - it's still smaller than the typical erase size on NOR 
flash.

If you want to run JFFS2 on it, the ECC layout needs to be decided.

--
dwmw2
