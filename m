Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta01.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lqPj-0005ca-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2002 13:34:43 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Mon, 2 Sep 2002 05:34:30 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: andrew@hainsworth.ath.cx
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mounting Read-only
Reply-To: mateo@posta.star.si
Message-Id: <20020902123430.8D1CA3963@sitemail.everyone.net>
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

Hi Andrew

>I now have the DoC detecting and mountable, but it is mounting read-only 
>and I can't seem ot make it mount read-write.  Any ideas?
>
>Also, I think the geometry, or pseudo-geometry or whatever of the chip is 
>out of whack.  This is what fdisk is telling me:
>
>Disk /dev/nftla: 1 heads, 64064 sectors, 1 cylinders
>Units = cylinders of 64064 * 512 bytes
>
>      Device Boot    Start       End    Blocks   Id  System
>/dev/nftla1             1         1     32031+  83  Linux
>Partition 1 has different physical/logical endings:
>      phys=(256, 0, 0) logical=(0, 0, 64064)
>Partition 1 does not end on cylinder boundary:
>      phys=(256, 0, 0) should be (256, 0, 64064)

I am not able to help you here, but I can tell you, that I was able
to mount the DOC 2000 (48M) as read-write with simple mount command.
And I had the similar output from the fdisk as you have. 
(Now I have problems with LILO)

I don't know what is going here, because both the Start
and the End are set to 1 ???

Is /dev/nftla1 mounted during the boot (e.g. in /etc/fstab)?

Regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
