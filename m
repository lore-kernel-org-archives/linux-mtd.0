Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rI3g-00020f-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 13:01:56 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <20011010112839.95341.qmail@web11503.mail.yahoo.com> 
References: <20011010112839.95341.qmail@web11503.mail.yahoo.com> 
To: Adil EL YOUSSEFI <adilos2@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: A couple of questions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 10 Oct 2001 13:11:02 +0100
Message-ID: <21379.1002715862@redhat.com>
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

adilos2@yahoo.com said:
>  -> Under what license it is released. My boss wants to
>  know if he would have to pay in order to put JFFS2 in our product.

Under what licence is your product? JFFS2 is under a dual licence - both 
GPL for compatibility with the Linux kernel, and RHEPL for use in eCos. 

>  -> We are using a flash device with different sector sizes ( 1*32k,
> 2*16k,1*64k and the others are 128k ), What size should the JFFS2
> reserved sectors have then ? 

128KiB - the 'major' erase size.

>  -> If JFFS2 is used without enabling compression, will there still be
> corner cases in GC requiring 5 reserved sectors and not 2. 

Probably not. To be honest, it probably wouldn't happen even _with_ 
compression - I just don't like releasing software that'll 'probably' work 
:)

>  -> Why can't JFFS2 be used on Compact flashes ? 

Technically, it can - we now have a 'blkmtd' driver which uses any block 
device as backing store for an MTD device - so it can use any hard drive. 
At the moment, it's painfully slow. Checkpointing ought to fix that, but 
nobody's currently working on implementing that.

--
dwmw2
