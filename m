Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHxS4-0003I2-Pb
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 08:28:48 +0000
Received: by wa-out-1112.google.com with SMTP id v33so245664wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Jan 2008 00:24:52 -0800 (PST)
Message-ID: <bae050c10801240024y6bd84a2bj1c5c29037200ab24@mail.gmail.com>
Date: Thu, 24 Jan 2008 16:24:52 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: Is there really need to build Block Device Emulation over UBI?
In-Reply-To: <1201159103.6934.36.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10801231913r43473c02r2d9093a205a00c87@mail.gmail.com>
	<1201159103.6934.36.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The problem with mtdblock is that when it needs to change an eraseblock,
> it reads it, erases, then writes new data to it, which would cause data
> loss in case of an unclean reboot.

If I can delay  the erase operation, then it perfect works?  when
change a eraseblock, reads it(from old mapped PEB) , then writes new
data to it(new mapped PEB), finally erase the old mapped PEB.

How about that?


--
Best Wishes,
Nancy
