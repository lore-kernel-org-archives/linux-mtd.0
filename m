Received: from fed1mtao01.cox.net ([68.6.19.244])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Mtyb-0000fn-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 18:19:37 +0100
Subject: Re: OpenSSH/OpenSSL is too big... any alternatives?
From: Russ Dill <Russ.Dill@asu.edu>
To: Gonzalo Servat <gonzalo@linuxaus.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <1025014199.2220.3.camel@beamer.servat.com>
References: <1025014199.2220.3.camel@beamer.servat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 25 Jun 2002 10:19:03 -0700
Message-Id: <1025025543.2006.30.camel@russ>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 2002-06-25 at 07:09, Gonzalo Servat wrote:
> Hi All
> 
> I have a 2MiB DiskOnChip. After installing the kernel, BusyBox, iptables
> and a couple of libs from uClibc I only have 400k left of space.
> OpenSSH needs to link to OpenSSL and OpenSSL is well over 1MB on it's
> own. Is there any alternatives to OpenSSL/OpenSSH that will fit on 400k?

I have:
	uClibc
	busybox
	kernel
	dnrd
	iptables
	vtun
	thttpd
	utelnetd
	pppd+pppoe
	udhcp
	+ a bunch of other things I can't think of

it makes a 1.41M image, compile everything with uclibc, strip it
properly, and it works out
