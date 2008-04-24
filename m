Received: from py-out-1112.google.com ([64.233.166.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JopsU-0001lG-4F
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 01:03:58 +0000
Received: by py-out-1112.google.com with SMTP id a73so4321811pye.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 18:03:55 -0700 (PDT)
Subject: Re: Overview of MTD and CFI
From: Josh Boyer <jwboyer@gmail.com>
To: mike zheng <mail4mz@gmail.com>
In-Reply-To: <5c9cd53b0804231736w6b52e22fk8df5add59aaca92c@mail.gmail.com>
References: <5c9cd53b0804231736w6b52e22fk8df5add59aaca92c@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 20:03:44 -0500
Message-Id: <1208999024.2946.3.camel@vader.jdub.homelinux.org>
Mime-Version: 1.0
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

On Wed, 2008-04-23 at 20:36 -0400, mike zheng wrote:
> Hello,
> 
> I am new to Linux MTD driver. Any good document for me to start the
> MTD driver and CFI stuff?

drivers/mtd/*

Most of the CFI stuff "just works" these days.  Unless you're adapting
MTD to a new NOR chip type there really isn't much to do.

josh
