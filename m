Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Be2Q-0003Qf-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 16:37:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1037121749.8746.67.camel@irongate.swansea.linux.org.uk> 
References: <1037121749.8746.67.camel@irongate.swansea.linux.org.uk>  <20021112160843.GE5031@wohnheim.fh-wedel.de> <3DD0D966.E6D877EC@procsys.com> <449.1037117917@passion.cambridge.redhat.com> 
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
    Miraj Mohamed <miraj@procsys.com>, jffs-dev@axis.com,
    linux-mtd@lists.infradead.org
Subject: Re: mirroring in JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Nov 2002 17:07:22 +0000
Message-ID: <6310.1037120842@passion.cambridge.redhat.com>
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

alan@lxorguk.ukuu.org.uk said:
>  The fs doesnt know enough about the block I/O layer to do that

Certainly it doesn't when it's all hidden by RAID. It's feasible that it 
_could_ though. It looked like the nwfs code did something like this -- you 
told the file system explicitly about all the individual block devices it 
was supposed to be using. I never did investigate it much though.

To be honest, in a lot of cases I'd settle for a way for a file system to 
tell the block device 'this sector is now unused'. Not so much for RAID but 
for the "block-based file system on flash translation layer" case.

> A dupfs layer is probably quite doable too yes. 

There are a few interesting cases about what you do when you get write 
errors (or -ENOSPC) after your write already succeeded to the other device, 
but yeah -- it shouldn't be too horrible.

> However for JFFS2 surely all you actually want to do is write each log 
> entry including its ID number to both journals. When you hit a bad block 
> you can play back that bit of the journal from the other flash and then 
> mark it bad. 

Yep, that basically works.

> The only fun case is working out the size of your journal since its 
> effectively the smaller of two journals can shrink online.

Well that bit is quite fun already :) 

But it's not too bad -- you GC on _both_ media till you have enough space
on them both for the write you want to do, then you allow the allocation 
call to return, do the write to both media and return. Some detail in 
sorting out the case where a page write crosses an eraseblock boundary and 
ends up split into two on one or both media, but that's not really too hard 
conceptually -- I suspect it'd make an ugly mess of the code though.

--
dwmw2
