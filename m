Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mCtO-0007cx-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 13:34:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020903104437.GA15756@wohnheim.fh-wedel.de> 
References: <20020903104437.GA15756@wohnheim.fh-wedel.de> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] added cfi_cmdset_0020.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 03 Sep 2002 13:34:49 +0100
Message-ID: <16859.1031056489@redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  This adds cfi_cmdset_0020.c and hooks it into most places. No help
> text yet, but that isn't covered by the cvs anyway.

patches/Config.help

Do we really need a completely separate copy, or could we get away with
making the existing cfi_cmdset_0001 code handle this too? Or have we had
this conversation already and I'm just having a bad week?

--
dwmw2
