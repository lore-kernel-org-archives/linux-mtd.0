Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWWPU-0001Ve-6J
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 14:15:12 +0000
Received: by qyk11 with SMTP id 11so903102qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 07:15:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A71A483.30507@linutronix.de>
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
	<4A719A27.8050509@linutronix.de>
	<ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
	<4A71A483.30507@linutronix.de>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 30 Jul 2009 19:44:46 +0530
Message-ID: <ce9ab5790907300714u5c88f1cdk8c0387de5ba9f413@mail.gmail.com>
Subject: Re: [PATCH] [mtd] fixed faulty check
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 30, 2009 at 7:17 PM, Sebastian Andrzej
Siewior<bigeasy@linutronix.de> wrote:
> vimal singh wrote:
>>
>> What if you go to 'err_out' due to some other error?? Do not you need
>> to free 'info'?
>
> We have to and of_flash_remove() takes care of it.

that's correct...

>
> The initial patch would be shorter if
> =A0dev_set_drvdata(&dev->dev, info);
> would be moved prior the kzalloc()
>
> Sebastian
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
