Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tp0q-0003rJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 12:37:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6C52@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6C52@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: =?iso-8859-1?Q?=27J=F6rn_Engel=27?= <joern@wohnheim.fh-wedel.de>,
    linux-mtd@lists.infradead.org
Subject: Re: MTD partitioning rewrite 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Oct 2001 12:46:33 +0100
Message-ID: <8236.1003319193@redhat.com>
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

jonas.holmberg@axis.com said:
>  Would it still be possible to make a logical partition that extends
> over several flash chips (e.g. one big partition of two chips)?

As possible as it is now - the chip probe code has to detect them all in 
one go and make a single MTD device out of them. Otherwise, you have to 
hack up your own wrapper anyway. 

--
dwmw2
