Received: from [213.154.159.185] (helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fmHd-0005Of-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 18:25:02 +0000
Date: Tue, 26 Feb 2002 20:37:38 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: nftl problem
In-Reply-To: <1436.1014747128@redhat.com>
Message-ID: <Pine.LNX.4.10.10202262036210.1131-100000@pinot.profis.ro>
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

> 
> rcorlan@pcnet.ro said:
> > Before i gave up on nftl, i found the following problem: nftl accesses
> > the flash through the read_ecc and write_ecc function pointers in the
> > slave mtd_info structure. However, when the slave structure is
> > initialised, only the read and write function pointers are filled, not
> > the read_ecc and write_ecc; i got kernel panic out of this, which got
> > away when i filled the fields. 
> 
> I don't recall receiving your patch for this.

probably because i didn't send it ;-). Should the patch go to the list, or
directly to you?

I don't have the code here, so i can only send the patch tomorrow.

Radu

> 
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 

-------------
Radu Corlan           Snail Mail: Bucuresti sect. 1, 
rcorlan@pcnet.ro             str. Argentina nr. 28, 71206 Romania

   You can still escape the "Gates" of Hell!   
                 Use Linux!                       
-------------
