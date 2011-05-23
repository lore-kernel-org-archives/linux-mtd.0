Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOUXP-00051v-Cu
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 12:47:12 +0000
Received: by ewy3 with SMTP id 3so2073854ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 05:47:09 -0700 (PDT)
Subject: Re: ubiattach error!
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Timon ter Braak <timonterbraak@gmail.com>
In-Reply-To: <loom.20110520T181331-434@post.gmane.org>
References: <71103bce1003230226q7fce2443vad3853d7c6d6d947@mail.gmail.com>
	<1270715032.6754.108.camel@localhost>
	<loom.20110520T161007-38@post.gmane.org>
	<1305901388.2630.151.camel@localhost>
	<loom.20110520T181331-434@post.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 May 2011 15:42:55 +0300
Message-ID: <1306154575.2785.15.camel@localhost>
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

On Fri, 2011-05-20 at 16:24 +0000, Timon ter Braak wrote:
> I will be happy to provide more information, but I am not sure what
> exactly. It is difficult to separate what procedure corrupt the filesystem
> and what does work. For example, even a normal 'reboot' command
> results in the message 'recovery needed'; is that normal?

Start with this:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

If you cannot isolate the error - I cannot do it as well for sure. So
please, try to fine one specific thing which you think is a problem, and
ask to help with that specific thing. The above link should help. In
general, the first things you need to do are:

1. validate your mtd device with the test - this is always good thing to
do.
2. enable UBIFS debugging (not debugging messages)
3. report the issue properly as it is described at the MTD web site.

WRT. reboot: if your 'reboot' command results in 'recovery needed' then
your 'reboot' command does not unmount the file-system and just reboots
it. Of course from UBIFS's POW this is a power cut and it needs
recovery. But there is nothing to be afraid of if you know you synced
your files. So you need to take a look what "reboot" does - it may do
completely different things on different systems. E.g., does it sync the
data? does it unmount FSes?


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
