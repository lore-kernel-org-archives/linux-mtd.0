Received: from ext-proxy-1.ftel.co.uk ([192.65.220.99])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AqwXS-0001SR-Qn
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2004 15:44:35 +0000
Message-ID: <402A4DC0.1090206@mesias.co.uk>
Date: Wed, 11 Feb 2004 15:44:00 +0000
From: Cam <camilo@mesias.co.uk>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <402A477D.3020701@mesias.co.uk>
	<1076513408.21968.423.camel@hades.cambridge.redhat.com>
In-Reply-To: <1076513408.21968.423.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

David

Thanks for the speedy reply,

>>I would have expected the flash to be left in the read array state when 
>>not in use.
> 
> 
> Why? If we've just finished writing to the device, and we're about to
> write to the device again... why change it into read mode?

After the mtd device has been closed, is it not perverse to leave the 
chips unredable? I don't mind if they are showing FL_STATUS while the 
device is busy.

> Mostly if you're going to need this it's because you forgot to wire up
> the RESET line to the flash chips properly, and you're already going to
> die if the user hits the RESET button at the wrong time, or reboots or
> hits SysRq-B, etc. I prefer not to work around this in the generic code,
> since it's actually helpful for some people to realise this problem
> early on. 

It seems as if the linux commands erase and dd behave strangely on my 
board, although what you say about the reset line is also true (I had 
already emailed the board designer).

I have a patch to leave the chip (and driver) in FL_READY state after 
sync, but it sounds like no-one will be interested.

-Cam


-- 
camilo@mesias.co.uk                                                 <--
