Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJXyV-00016l-V1
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2005 10:27:16 -0400
Message-ID: <4255433A.4080008@ieee.org>
Date: Thu, 07 Apr 2005 10:27:06 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>	<424CAE31.8040302@ieee.org>	<425157C5.4040007@infocell-its.com>	<425181A7.2010809@ieee.org>	<42527DD5.4080009@infocell-its.com>	<4252EC5D.4090806@ieee.org>	<4253D280.6090308@infocell-its.com>	<4253D61C.6010109@infocell-its.com>	<4253E056.5050603@ieee.org>	<4253F6C2.1080105@infocell-its.com>
	<42540E53.8080109@ieee.org> <42542926.9040209@nrl.navy.mil>
In-Reply-To: <42542926.9040209@nrl.navy.mil>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:
> 7) So, I've changed diskonchip.c to designate all of the last 10 bytes 
> as "free".  It seems like the right thing to do, since only the first 6 
> bytes are used by the hardware itself.  BUT ....
> 
> 9) I think this may break compatibility with any jffs2 filesystems 
> written before the change, because the cleanmarker will be in the wrong 
> place.  Hmm... maybe I should back out the change.  David? Thomas? 
> Opinions?

After much discussion and experimentation, a version of diskonchip.c 
which does not break older jffs2 filesystems has been checked into CVS. 
  Also, some required changes to nandwrite have been checked in as well.

Zeri, I really think this should work for you now, particularly since I 
was able to duplicate exactly the problems you were having.

	-Dan
