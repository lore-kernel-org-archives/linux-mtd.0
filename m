From: David Woodhouse <dwmw2@infradead.org>
To: Cam <camilo@mesias.co.uk>
In-Reply-To: <402A4DC0.1090206@mesias.co.uk>
References: <402A477D.3020701@mesias.co.uk>
	 <1076513408.21968.423.camel@hades.cambridge.redhat.com>
	 <402A4DC0.1090206@mesias.co.uk>
Content-Type: text/plain
Message-Id: <1076514597.21968.428.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Feb 2004 15:49:58 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Intel 28F640 cfi_cmdset_0001 chip is FL_STATUS after MTD_close
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-02-11 at 15:44 +0000, Cam wrote:
> After the mtd device has been closed, is it not perverse to leave the 
> chips unredable? I don't mind if they are showing FL_STATUS while the 
> device is busy.

You might consider it perverse. On the other hand, I consider it _more_
perverse to paper over hardware problems, given that anything we could
do wouldn't be 100% reliable. :)

> I have a patch to leave the chip (and driver) in FL_READY state after 
> sync, but it sounds like no-one will be interested.

I wonder if you'd do better to do it in machine_restart() or register a
reboot notifier.

-- 
dwmw2
