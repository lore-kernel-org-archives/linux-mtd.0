Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16loZa-0004GX-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2002 10:04:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020315095523.2AAD73ED3@sitemail.everyone.net> 
References: <20020315095523.2AAD73ED3@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Mar 2002 10:15:57 +0000
Message-ID: <28799.1016187357@redhat.com>
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

zeusj@firstlinux.net said:
>  Chip not ready for buffer write. Xstatus = 18, status = 98

Do you have the correct voltage applied to the Vpen line of the flash chip? 
I note you don't have a set_vpp() method. Do you need one?

> sure I can use jffs2 too, but for more insurance , I use jffs:) 

'insurance'? I expect JFFS2 to be more reliable than JFFS at this point. 
That was, after all, most of the point in doing a complete rewrite :)

> BTW: in my opinion, the "mtd_info" struct should be to describe a mtd
> device.

Yes. 

> the "map_info" struct should be to describe a mapping area in
> memory which mapping to the mtd device(?)

The map_info struct is used just by the generic flash chip drivers, to 
access the memory bus on which the flash chip resides. 

> and WINDOW_ADDR is the PA of the mtd device(in my file) and 
> map_info.map_priv_1 is a pointer to the VA of the mtd device. 

Those are private information which are specific to your map driver. All 
that matters is that the read16 call reads a word from the correct offset 
on the flash chip. But yes, almost all the map drivers are mostly the same 
code, and this is how they do it.

> Is that right? to be honest , I am really
> confused by these.I cant find any documentation to explain it .  

Occasionally I try to write some documentation. Generally I look at it and 
think the code explains stuff better, so abandon it.

--
dwmw2
