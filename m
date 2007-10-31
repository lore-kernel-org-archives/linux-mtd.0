Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1InMYu-0002Dy-MB
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 19:01:31 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1InMYm-00047s-BM
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 23:01:16 +0000
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2007 23:01:16 +0000
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2007 23:01:16 +0000
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Subject: Re: UBI Used In Commercial Products ??
Date: Wed, 31 Oct 2007 23:01:07 +0000 (UTC)
Message-ID: <loom.20071031T224633-341@post.gmane.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D577@orsmsx413.amr.corp.intel.com>
	<loom.20071031T215155-403@post.gmane.org>
	<B1EDF20A6EAAD74EA65E46F774F1784502C6D843@orsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> JFFS2 has been modified to sit on top of UBI.

Yes, I know. Is that better then JFFS2 on top of mtdblock device?
  
> One thought here is that I would think that mounting is a fairly rare
> occurance.  
> You're much more likely to coming back from suspend.  Notice the
> difference in time it takes from my HP iPAQ to power-on normally vs a
> cold boot.  It is very different. 

Still one must plan for the worst case and the worst case for me
was about 2 hours of mount time after I used ftp to transfer large file.
I suspect ftp was writing really small jffs2 nodes.
Disclaimer: that was about 2 years ago and jffs2 might have improved,
processor (ARM9) was not a speed demon either.
If you do that on your iPAQ (create large file with lots of small nodes)
and then cold boot it - would you be willing to wait for an hour for it to 
become usable again?

I really hope UBI+UBIFS will overcome this problem. Still there is a concern 
here since UBI scales linearly. Can somebody plz post UBI scan time for large
flash array?

Regards,

Sergei Sharonov
