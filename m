Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1764kv-0000Lv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 08:23:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020510064306.462BF2756@sitemail.everyone.net> 
References: <20020510064306.462BF2756@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: misc question about MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 10 May 2002 08:23:41 +0100
Message-ID: <6578.1021015421@redhat.com>
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

zeusj@firstlinux.net said:
> 1.in cfi_probe_chip(cfi_probe.c), what is an 'alias ' of a flash chip?
> is that the same flash chip mapping in different address? 

Yes. Often, people will connect flash chips without all the address lines 
being used, so they can swap in larger chips later. Then you get these 
'aliases'.

> 2.if I send Query command (98h, I mean) twice, would the 'QRY' disappear?

Er, I don't know. I don't think so, but if this _is_ required then it could 
be useful -- currently we have to use a chip-specific command to put chips 
back in read mode when we do the alias detection.

> and if I send it once, can I read the 'QRY' for several times?

Yes, you can.



--
dwmw2
