Received: from e35.co.us.ibm.com ([32.97.110.133])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfKp9-0006Px-Sh
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 11:19:25 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id iBHGJKet627598
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 11:19:20 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBHGFVYZ286240
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 09:19:20 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	iBHG2LSd031468
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 09:02:21 -0700
Message-ID: <41C3030D.8040607@us.ibm.com>
Date: Fri, 17 Dec 2004 10:02:21 -0600
From: Josh Boyer <jdub@us.ibm.com>
MIME-Version: 1.0
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>	
	<41C0D3AC.3050801@us.ibm.com>	
	<1103158974.15929.37.camel@squizzey.bult.co.uk>	
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>	
	<1103232128.15927.70.camel@squizzey.bult.co.uk>	
	<41C1FDFF.3020308@us.ibm.com>	
	<1103233669.15929.81.camel@squizzey.bult.co.uk>	
	<1103288058.3018.4.camel@weaponx.rchland.ibm.com>
	<1103297611.15917.184.camel@squizzey.bult.co.uk>
In-Reply-To: <1103297611.15917.184.camel@squizzey.bult.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gareth Bult (Encryptec) wrote:>
> 
> Forgive my ignorance .. but what's the difference between using a write
> buffer and using the system buffer ?
> 
>>From my pov, the system buffer is there, already 100% reliable and
> somewhat larger than any [potential] write buffer ???

Perhaps alternative was the wrong word to use on my part.  I'll just 
wait until I see your code.  I'm probably confusing myself by making 
assumptions on what it's doing :).

> 
> Mmm, after looking at wbuf.c I'm none the wiser as to what it does or
> how it relates ..

It might not relate.  IIRC there were some discussions on buffering the 
writes done by JFFS[23] to the size of a sector on the block device so 
that partial writes aren't done unnecessarily.  This is what the wbuf.c 
file does.  NAND and ECC'd NOR require this because you can only write 
to a page once (usually) before an erase is needed to write again.

For disk devices I don't think it's required, but it could help.  Or 
maybe your code does this at the MTD level.  I dunno.  I could be 
spouting nonsense again ;).


> 
> 
> I think once I get this FL release out the way I'll have a a more
> in-depth look at JFFS*. It seems to be written almost exclusively for
> MTD devices .. which is great .. for MTD devices .. but for block
> devices and flash (USB for example) presented through a standard
> interface (SCSI for example) it seems there is scope for a much
> "thinner" filesystem generic devices with a subset of JFFS's feature
> set.

Yes, it is a Journaled _Flash_ File System.  So of course it's written 
for MTD devices.  Not sure why blkmtd.c was originally written.  Test 
vehicle for JFFS2, "why not", "I'm bored", etc.  Who knows? :)

josh
