Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17APaa-0007I9-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 07:27:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF49@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF49@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Kernel oops after sync command in jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 22 May 2002 07:27:10 +0100
Message-ID: <18394.1022048830@redhat.com>
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

fgiasson@mediatrix.com said:
> The 'called while erasing!' message means that I put a trace in the
> map driver write16() function to tell me if write16()is called when a
> global variable is set.  This global variable indicates that
> do_erase_oneword has sent the erase sector command and is currently
> polling for the erase operation to complete. 

OK. We already fixed one of these by disabling fast programming mode, after 
you pointed out that it was sending the unlock command without paying due 
attention to the state machine. If you're definitely using v1.55 of 
cfi_cmdset_0002.c, can you put a BUG() in the mtxmap_write16() call just 
after it prints the 'called while erasing!' message, and we'll see where 
it's being called _from_. 

--
dwmw2
