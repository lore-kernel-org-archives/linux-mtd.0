Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15zIRC-00052G-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Nov 2001 14:03:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <82B1591A280FD411B91200D0B75B484A015F5D1B@sis-uk-msg01.altera.com> 
References: <82B1591A280FD411B91200D0B75B484A015F5D1B@sis-uk-msg01.altera.com> 
To: Clive Davies <cdavies@altera.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: FW: Patch: adding mtd support for new machine 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Nov 2001 14:12:35 +0000
Message-ID: <11896.1004623955@redhat.com>
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

cdavies@altera.com said:
>  I sent the follwing message to mtd@infradead.org a couple of days
> ago, but I've had no response. Is that the same list as
> linux-mtd@lists.infradead.org? 

Yes, it is. That's the old address for the list, and the alias still works.

> Can anyone tell me why I've had no reply? 

Er, just because I didn't notice your mail - sorry. 


cdavies@altera.com said:
> I submitted a patch to Russell King to add mtd support for a new
> mchine type to his arm linux source tree. He sent me here to discuss:

> >- lack of $id$ in the new map driver 
> >- missing help entry for the new CONFIG_* symbol
> >- concerns about overloading the read_oob

> The first one I don't really understand, 

Files in CVS have $Id$ tags to mark which version they are. Just add $Id$ 
in the comments at the top of the file and it'll get expanded when it's 
committed to look like the others:
	 * $Id: redboot.c,v 1.6 2001/10/25 09:16:06 dwmw2 Exp $
	
> the second I can deal with myself. For the third, I've used the oob 
> interface to access the protection data in Intel flash devices. This 
> seemed to me to fit ok as its essentially data that isn't in the main 
> flash array. 

read_oob is there to access the 'extra' storage area on NAND flash chips. 
What happens if people make NAND flash chips with the same kind of 
protection data? We probably need to distinguish between the two. Maybe by 
adding a pair of extra read/write methods, or maybe by adding an extra 
argument to the existing read_oob/write_oob to indicate which space they're 
supposed to operate on, and adding an enumeration of the available spaces 
in the mtd_info somehow.


--
dwmw2
