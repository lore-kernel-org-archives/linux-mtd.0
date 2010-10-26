Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAfUK-0004aT-0W
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 09:06:36 +0000
Received: by fxm15 with SMTP id 15so3272089fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Oct 2010 02:06:33 -0700 (PDT)
Subject: Re: UBIFS: mount based on UUID?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfgang Denk <wd@denx.de>
In-Reply-To: <20101026055332.B14FD152451@gemini.denx.de>
References: <20101026055332.B14FD152451@gemini.denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Oct 2010 12:03:15 +0300
Message-ID: <1288083795.2227.28.camel@localhost>
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

On Tue, 2010-10-26 at 07:53 +0200, Wolfgang Denk wrote:
> Hi,
> 
> is there any way to mount UBIFS based on the UUID like we can do for
> "normal" file systems, i. e. by using "UUID=..." instead of a device
> name in /etc/fstab ?
> 
> I see there is a UUID in the file system's super block, but I can't
> see it is exposed to any sort of regular user interface.
> 
> Am I missing something?

No, you are right, we do have UUID, but we added it just in case we need
it in the future, e.g., for NFS support, but we do not use it currently
because we did not need it. And we did not look at mounting by UUID - it
should be possible to do.

I'm a bit overloaded at the moment, but if I have time later, I can look
at it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
