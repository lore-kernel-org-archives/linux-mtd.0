Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BeMD-0003Sd-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 16:57:45 +0000
Date: Tue, 12 Nov 2002 18:27:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Miraj Mohamed <miraj@procsys.com>,
   jffs-dev@axis.com, linux-mtd@lists.infradead.org
Subject: Re: mirroring in JFFS2
Message-ID: <20021112172751.GG5031@wohnheim.fh-wedel.de>
References: <1037121749.8746.67.camel@irongate.swansea.linux.org.uk> <20021112160843.GE5031@wohnheim.fh-wedel.de> <3DD0D966.E6D877EC@procsys.com> <449.1037117917@passion.cambridge.redhat.com> <6310.1037120842@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6310.1037120842@passion.cambridge.redhat.com>
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

On Tue, 12 November 2002 17:07:22 +0000, David Woodhouse wrote:
> 
> But it's not too bad -- you GC on _both_ media till you have enough space
> on them both for the write you want to do, then you allow the allocation 
> call to return, do the write to both media and return. Some detail in 
> sorting out the case where a page write crosses an eraseblock boundary and 
> ends up split into two on one or both media, but that's not really too hard 
> conceptually -- I suspect it'd make an ugly mess of the code though.

I wonder if it would make sense to expand the erase marker a bit in
this case. For two devices, the erase marker on each device holds the
number of the corresponding block on the other. This would allow you
to prioritize bad block recovery, once you find one.

This is quite a special case, though. More devices and the procedure
is pointless. Different device types and the procedure is not
possible.

Jörn

-- 
"Translations are and will always be problematic. They inflict violence 
upon two languages." (translation from German)
