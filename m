Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTupa-00052C-Qw
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 14:33:44 +0000
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Grow UBI device?
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
In-reply-to: <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
References: <20131008192846.A25E7380A65@gemini.denx.de>
 <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
Date: Wed, 09 Oct 2013 16:33:18 +0200
Message-Id: <20131009143318.7BAEB38049B@gemini.denx.de>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Ricard Wanderlof,

In message <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com> you wrote:
> 
> > Is there a way to "grow" the existing UBI device so that it now also 
> > covers the rest of the NAND chip?  Or is my only option to create a 
> > second UBI device?
> 
> UBI devices are 'attached' to existing mtd partitions. So to grow a UBI 
> device, you need to detach it from the partition, re-partition the flash 
> (and I'm not sure if this step is even possible as it involves 
> unregistering existing mtd partitions), then attach a UBI device to the a 
> new partition.

In my situation it is OK if the update involves a reboot, so it is
certainly possible to change the MTD partition layout.  So this should
not be a problem.

> Come to think of it, I'm not sure that would work anyway, as the 
> resulting, new, enlarged partition would partly contain UBI data and 
> partly old jffs2 data. I'm not sure what UBI does when it encounters 
> incorrect data, if it just erases the relevant blocks and formats them for 
> its own use, or if it barfs completely and just bails out complaining that 
> the partition does not contain UBI data. If the relevant blocks were 
> erased, then I think UBI would simply concede that the a previous erase 
> attempt had been prematurely aborted, and re-erase the blocks and write 
> its headers, so perhaps that is something to try. At any rate it involves 
> at least some mild trickery (erase the blocks that previously contained 
> jffs2 data).

well, this is the exact part where I wanted to know if (1) this is
guaranteed to work (by design), and/or (2) somebody has successfully
done it before.

> It's probably easier to create a new UBI device by attaching it to the 
> partition previously used by jffs2, after erasing it, but multiple UBI 
> devices across a flash partly defeats the purpose of wear-leveling which 
> UBI provides.

Right, and it fragments the device.  That's why I'd like to avoid
that.


Thanks!!

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Doing the good deeds is like the grass in the garden. You  don't  see
its  growth. But, it does by days. Doing the wicked deeds is like the
hone. You don't see its damage. But, it does by days.        - Buddha
