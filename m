Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MrPR-0000Ry-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 15:35:09 +0100
Subject: Re: OpenSSH/OpenSSL is too big... any alternatives?
From: cfowler <cfowler@outpostsentinel.com>
To: Gonzalo Servat <gonzalo@linuxaus.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <1025014199.2220.3.camel@beamer.servat.com>
References: <1025014199.2220.3.camel@beamer.servat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 25 Jun 2002 10:43:30 -0400
Message-Id: <1025016211.25773.14.camel@moses.outpostsentinel.com>
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

I got the same problem but I'm running off floppy.


On Tue, 2002-06-25 at 10:09, Gonzalo Servat wrote:
> Hi All
> 
> I have a 2MiB DiskOnChip. After installing the kernel, BusyBox, iptables
> and a couple of libs from uClibc I only have 400k left of space.
> OpenSSH needs to link to OpenSSL and OpenSSL is well over 1MB on it's
> own. Is there any alternatives to OpenSSL/OpenSSH that will fit on 400k?
> 
> Thanks in advance!
> 
> Regards,
> 
> Gonzalo.
> 
> 
