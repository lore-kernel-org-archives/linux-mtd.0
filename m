Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTzxP-0007R9-Hg
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 20:02:08 +0000
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Grow UBI device?
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
In-reply-to: <alpine.DEB.2.00.1310091725590.28562@lnxricardw.se.axis.com>
References: <20131008192846.A25E7380A65@gemini.denx.de>
 <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com>
 <20131009150538.BAD57380432@gemini.denx.de>
 <alpine.DEB.2.00.1310091725590.28562@lnxricardw.se.axis.com>
Date: Wed, 09 Oct 2013 22:01:41 +0200
Message-Id: <20131009200141.727C438049B@gemini.denx.de>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Ricard,

In message <alpine.DEB.2.00.1310091725590.28562@lnxricardw.se.axis.com> you wrote:
> 
> I just tested it since I have a UBI system just beside me, by erasing and 
> then writing zeros to a block (just to put non-UBI data in it) and 
> restarting the system (the partition in question contains the volume with 
> the root file system in it, so it is attached by the kernel during its 
> boot). The result was that UBI didn't give any error or warning messages 
> during boot, but a subsequent nanddump after boot revealed that the 
> zeroed blocks now contained valid UBI headers, so, without looking at the 
> source, it seems that UBI really does manage this fairly silently.

Thanks a lot, much appreciated!

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The IQ of the group is the lowest IQ of a member of the group divided
by the number of people in the group.
