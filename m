Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWX1M-00010w-I7
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 14:54:21 +0000
Message-ID: <4A71B401.1090208@linutronix.de>
Date: Thu, 30 Jul 2009 16:53:53 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Stoyan Gaydarov <sgayda2@uiuc.edu>
Subject: Re: [PATCH] [mtd] fixed faulty check
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
	<4A719A27.8050509@linutronix.de>
	<ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
	<4A71A483.30507@linutronix.de>
	<ce9ab5790907300714u5c88f1cdk8c0387de5ba9f413@mail.gmail.com>
	<4A71AD5E.4080704@uiuc.edu>
In-Reply-To: <4A71AD5E.4080704@uiuc.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kay.sievers@vrfy.org, David.Woodhouse@intel.com, gregkh@suse.de,
	linux-kernel@vger.kernel.org, vimal singh <vimal.newwork@gmail.com>,
	linux-mtd@lists.infradead.org, sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stoyan Gaydarov wrote:
>>> We have to and of_flash_remove() takes care of it.
>>>     
>>   
> Does this mean that the original patch is fine or does it still need the 
> kfree? From what i understand when going to err_out it will take care of 
> info using of_flash_remove() so then it is not needed in the if check.

The original patch was fine but it leaked info. of_flash_remove() does the
cleanup of info but only if it is part of driver's data (after the
of_flash_remove()). So you have to call dev_set_drvdata(&dev->dev, info)
earlier, after the kzalloc() to save the data or else there is no clean
up.

> -Stoyan

Sebastian
