Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QExOp-0008Gh-MR
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 05:34:56 +0000
Received: by eyh6 with SMTP id 6so480875eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 22:34:53 -0700 (PDT)
Subject: Re: Discovering current MTD partition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Umar Qureshey <umar@janteq.com>
In-Reply-To: <000201cc046b$b03a6310$10af2930$@janteq.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 Apr 2011 08:31:02 +0300
Message-ID: <1303882262.2778.51.camel@localhost>
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

On Tue, 2011-04-26 at 16:43 -0700, Umar Qureshey wrote:
> Hi,
> 
> I searched this list's archive but did not see anything pertinent.
> 
> I was wondering if there is a way to find out what the currently active mtd
> partition is.  In my system, I have a few flash partitions for my file
> system and the kernel boots with the partition that is specified on the
> kernel command line.  Aside from scanning /proc/cmdline, is there a way to
> programmatically ascertain which mtd partition is active *now*.  
> I need to find this information within a Python script but really if it can
> be done in C (perhaps a syscall?), it's all I need.

What does active mean? Anyway, there is /proc/mtd at your disposal.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
