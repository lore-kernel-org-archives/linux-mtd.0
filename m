Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172XWe-0000Mf-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 14:18:36 +0100
From: johan.adolfsson@axis.com
Message-ID: <01ff01c1f049$b2a19fa0$bdb270d5@homeip.net>
Reply-To: <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>, <johan.adolfsson@axis.com>
Cc: <linux-mtd@lists.infradead.org>
References: <012701c1f031$bc52eee0$bdb270d5@homeip.net>  <00d201c1f02d$f672d580$bdb270d5@homeip.net> <30704.1020161437@redhat.com>  <18096.1020169313@redhat.com>
Subject: Re: [PATCH/RFC] Create mtdram device at runtime. 
Date: Tue, 30 Apr 2002 15:19:45 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> johan.adolfsson@axis.com said:
> > Here it comes, not tested though... Beleive I took care of the cleanup
> > as well.
>
> What about the case where mtdram_init_device() is called from elsewhere?
> Perhaps we should register a cleanup function with as mtdram_init_device()
> and call _that_ in the later cleanup?
> --
> dwmw2

How about letting mtdram_init_device return an allocated mtd_info*
and the caller is responsible for cleaning it up?
The hardcoded init functions store the returned pointer in the
static mtd_info variable and do it's clean-up on exit.

/Johan
