Received: from go4.ext.ti.com ([192.91.75.132])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwaS1-0007Eu-QW
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2004 05:22:17 +0000
Message-ID: <033801c3fcf1$948a8610$73b6a8c0@ent.ti.com>
From: "Trilok Soni" <x000soni@india.ti.com>
To: <ghannon@cspi.com>
References: <85256E46.0057527E.00@pine.cspi.com>
Date: Fri, 27 Feb 2004 10:51:39 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Unable to mount rootfs on mtdblock3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gary,

Well, kernel is able to mount jffs2 on board. Here again, I have used "cat"
command only.
But curious to know if there is any logical difference you might have
noticed...

Regards,
Trilok Soni

----- Original Message -----
From: <ghannon@cspi.com>
To: "Trilok Soni" <x000soni@india.ti.com>
Sent: Thursday, February 26, 2004 10:28 PM
Subject: Re: Unable to mount rootfs on mtdblock3


>
>
>
>
>
>
> >    2.3  cat filesystem.jffs2 > /dev/mtd3
>
> >    2.4  mount -t jffs2 /dev/mtdblock3 /mnt/jffs2
> >          It successfully mounts the filesystem...
> >    2.5  umount /mnt/jffs2
>
> >Any Suggestions?
>
> I'm not sure if cat'ing the file to the device
> produces what you want.  Did you examine it after you
> mounted it?   I would have probably tried dd.
>
> If this makes a difference, you can post it back to the
> list as the solution you found.  I'm just
> taking a guess.
>
>
> Gary
>
>
>
>
>
