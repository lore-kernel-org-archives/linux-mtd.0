Received: from [213.154.159.169] (helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fhN3-0004yr-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 13:10:18 +0000
Date: Tue, 26 Feb 2002 15:24:41 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: David Woodhouse <dwmw2@infradead.org>
cc: Thomas Gleixner <gleixner@autronix.de>, linux-mtd@lists.infradead.org,
        Joerg Zastrau <dl1bku@amsat.org>
Subject: Re: Support for parallel access in nand chips 
In-Reply-To: <12603.1014686709@redhat.com>
Message-ID: <Pine.LNX.4.10.10202261415120.706-100000@pinot.profis.ro>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

But nftl_format complains that the erase size is not 0x2000; Is there a
newer version than 1.17?

Radu

On Tue, 26 Feb 2002, David Woodhouse wrote:

> 
> rcorlan@pcnet.ro said:
> >  ok - i was going to make a separate source anyway. Do you know if the
> > upper layers mind the 32k erase size?
> 
> They'll be fine - it's still smaller than the typical erase size on NOR 
> flash.
> 
> If you want to run JFFS2 on it, the ECC layout needs to be decided.
> 
> --
> dwmw2
> 
> 
> 

-------------
Radu Corlan           Snail Mail: Bucuresti sect. 1, 
rcorlan@pcnet.ro             str. Argentina nr. 28, 71206 Romania

   You can still escape the "Gates" of Hell!   
                 Use Linux!                       
-------------
