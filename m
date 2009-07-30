Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWVz9-000329-Mr
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 13:48:00 +0000
Message-ID: <4A71A483.30507@linutronix.de>
Date: Thu, 30 Jul 2009 15:47:47 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: vimal singh <vimal.newwork@gmail.com>
Subject: Re: [PATCH] [mtd] fixed faulty check
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
	<4A719A27.8050509@linutronix.de>
	<ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
In-Reply-To: <ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Stoyan Gaydarov <sgayda2@uiuc.edu>, kay.sievers@vrfy.org, gregkh@suse.de,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	sr@denx.de, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

vimal singh wrote:
> What if you go to 'err_out' due to some other error?? Do not you need
> to free 'info'?
We have to and of_flash_remove() takes care of it.

The initial patch would be shorter if
   dev_set_drvdata(&dev->dev, info);
would be moved prior the kzalloc()

Sebastian
