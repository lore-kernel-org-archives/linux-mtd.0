Received: from mail-gw0-f48.google.com ([74.125.83.48])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1zkw-0000HC-Uv
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 12:00:27 +0000
Received: by gwj22 with SMTP id 22so1085799gwj.21
	for <linux-mtd@lists.infradead.org>;
	Fri, 09 Sep 2011 05:00:23 -0700 (PDT)
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: david.wagner@free-electrons.com
Date: Fri, 09 Sep 2011 15:02:45 +0300
In-Reply-To: <1315569206.7905.41.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1315280704.19067.14.camel@sauron> <1315282208.19067.24.camel@sauron>
	<201109081726.00769.arnd@arndb.de> <1315569206.7905.41.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315569770.7905.45.camel@sauron>
Mime-Version: 1.0
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-09 at 14:53 +0300, Artem Bityutskiy wrote:
> David, I am really busy and now, I suggest you to think about this. I'd
> so far stick to the own ubiblk cdev approach, and would
> analyse/prototype the approach of using UBI cdev for this. I provided
> some concerns above. Also, think about race conditions like:
> 
> 1. Someone

Sorry, I wonted to talk about situations when someone opens an ubiblk
device while the underlying UBI volume is being removed, but then though
this is trivial and forgot to erase the last sentence.

Anyway, I suggest the following algorithm:

1. Stick with the own cdev approach - the driver becomes very simple
   in this case - we review it.
2. Once it is ready, or in parallel, you can play with the second
   approach and if you find it solid/nice, you can then provide a
   new version and/or the delta.

The idea is that on step 1 we review/deal with other things, without
being blocked by the ioctl stuff.

-- 
Best Regards,
Artem Bityutskiy
