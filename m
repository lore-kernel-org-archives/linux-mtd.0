Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NTPv-0003FB-Gl
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 09:14:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Goodney <andrew@blueskylabs.com>
In-Reply-To: <3EDCE6D8.4010405@blueskylabs.com>
References: <Law14-F878P8Sp1ppTN0002fd45@hotmail.com>
	 <1054633243.17921.34.camel@passion.cambridge.redhat.com>
	 <3EDCE6D8.4010405@blueskylabs.com>
Message-Id: <1054714519.17921.158.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 04 Jun 2003 09:15:19 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: uclinux-dev@uclinux.org
Subject: Re: cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type,
 NULL); not workin
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-06-03 at 19:20, Andrew Goodney wrote:
> David Woodhouse wrote:
> >If so, it's not really surprising it doesn't work. As soon as you send
> >the '0x98' command, your entire kernel turns into the CFI query results
> >and it isn't really going to work too well :)
> >
> We had this problem as well on our uClinux systems. Once we changed to 
> running the kernel out of RAM our chips were detected properly.
> 
> The uClinux archives have a large amount of information on how to get 
> uClinux+MTD+JFFS(2) to play nicely together. I suggest searching the 
> online archive, as the subject comes up very often on that list.

As it happens, Intel have recently sponsored some development work on
this. With a small amount of further arch-specific code, it should be
possible to get this to work. I'll be posting details to the list
shortly.

-- 
dwmw2
