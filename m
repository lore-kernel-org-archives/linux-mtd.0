Received: from cmsout03.mbox.net ([165.212.64.33])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IZ6Ak-0007rp-Jh
	for linux-mtd@lists.infradead.org; Sat, 22 Sep 2007 10:41:34 -0400
Message-ID: <03f301c7fd26$edcd5570$0260a8c0@p4p800>
From: "Brian T" <btuch@usa.net>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Jon Ringle" <JRingle@vertical.com>
References: <4DD3AF7ECBBC43409BA36508938D01851B006C@CVAEX1.VERTICAL.COM>
	<1190425861.7150.212.camel@pmac.infradead.org>
Subject: Re: Clobbered file after jffs2 mount
Date: Sat, 22 Sep 2007 09:43:23 -0500
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Been reading this thread, and I was wondering what kind of hardware this is running on? I 
remember running into something like this a few years ago on my companies own embedded 
hardware, and the cause turned out to be a problem with an internal Multitech modem's 
firmware on the same bus which was interfering with reading the jffs2 file system.

I would see many ( but not all ) of the sym links on the file system pointing to garbage 
links like syslogd -> /m/m/m/m/m/m/m/s/s/s/s/e/e/e/ and also other programs on the system 
would not run properly.  After a reboot they would be fine for days to weeks.

Thought I would offer that up.

-Brian

> On Fri, 2007-09-21 at 21:35 -0400, Jon Ringle wrote:
>> I tried init=/bin/sh on a first boot after reflash and the md5sum of
>> sshd was correct. I then rebooted again normally and the ssh keys were
>> generated. When I logged in, the md5sum of sshd was wrong. The
>> corruption that I observe is always the same incorrect md5sum.
>
> But there's no corruption on the _flash_ -- if you boot with
> init=/bin/sh again after the keys are generated, you again get the
> _correct_ md5sum? I'm fairly certain of that, since the failure mode
> you'll get if you manage to scribble on the flash is that the data CRC
> will fail and you'll get zeroes where the offending nodes go missing.
>
> It's going to be something scribbling on the RAM pages after the file is
> read from the file system. Be thankful it looks fairly repeatable. Can
> you put a hardware watchpoint on the offending page in the page cache,
> after it's read? And can you disable _everything_ in the system which
> uses DMA, one at a time?
>
