Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AGrG-0006fs-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 22:07:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF47@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF47@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Kernel oops after sync command in jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 May 2002 22:07:48 +0100
Message-ID: <32287.1022015268@redhat.com>
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

> mtxmap_write16() called when erasing!
> waiting for erase to complete timed out.
> Erase at 0x00030000 failed immediately: errno -5
> Oops: kernel access of bad area, sig: 11

> C00BCEFC:	concat_erase_callback()
> C00BD26C:	concat_erase()

Thanks. mtdconcat.c shouldn't have been calling the erase completion 
callback _and_ returning failure. Can you update it and try again?

T'would still be interesting to know _why_ the erase failed though. What 
does the 'called while erasing!' message mean?

--
dwmw2
