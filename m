Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NzmoH-0002S6-Aj
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 08:09:58 +0000
Subject: Re: umount of ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea61003160641s5b083daepf6fa726908ffc5f9@mail.gmail.com>
References: <dbdb2ea61003160641s5b083daepf6fa726908ffc5f9@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:07:59 +0300
Message-ID: <1270714079.6754.95.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-16 at 09:41 -0400, twebb wrote:
> I am seeing behavior related to my filesystem that I don't understand.
>  I'm running 2.6.29 and using UBIFS.  The root filesystem is a
> ramdisk.  Code manually mounts 4 UBI volumes at startup (not
> automatically through an fstab file).  One of the volumes, "system",
> is mounted RO (though the underlying UBI volume is dynamic).  On
> system shutdown, code umounts all the mounted volumes, and often the
> umount of "system" fails.  Can someone explain how umounting a RO
> filesystem could fail?  (I don't think this is a UBIFS issue - I'm
> guessing it may be common to all filesystems.)

I'd say you should investigate the issue yourself and narrow it down.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
