Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1ColgU-0002to-Kn
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 11:49:29 -0500
To: Lokesh Kumar <kumar.lokesh@wrx-us.com>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Wed, 12 Jan 2005 10:50:58 EST."
	<294FD9D3403A0340BDAC38E48DCEFFDC935788@RES-EXCH>
Date: Wed, 12 Jan 2005 17:48:40 +0100
Sender: wd@denx.de
Message-Id: <20050112164845.AE560C108D@atlas.denx.de>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: how to behave on jffs2 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <294FD9D3403A0340BDAC38E48DCEFFDC935788@RES-EXCH> you wrote:
> 
> I have an embedded Linux (kernel 2.4.18) board at 50MHz, with jffs2 16MB
> flash. My system creates small files of 700 bytes each and is required to
> create ~3000 of such files. I see that when there are 1000 files, the system
> takes 3 minutes or so to mount this partition and then another 3 to do "ls
> -l". When there are 3000 files, the system takes 10 minutes each for mount
> and "ls -l". 
> 
> Is that expected behaviour?

Yes - given the age of MTD code you probably have in this old kernel.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Substitute "damn" every time you're inclined to write "very"; your
editor will delete it and the writing will be just as it should be.
                - Mark Twain
