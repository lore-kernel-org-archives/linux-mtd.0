Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 162uiQ-0001i3-00
	for <linux-mtd@lists.infradead.org>; Sun, 11 Nov 2001 13:32:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011111112140.40786.qmail@web8102.in.yahoo.com> 
References: <20011111112140.40786.qmail@web8102.in.yahoo.com> 
To: =?iso-8859-1?q?somshekar=20kadam?= <kadamsom@yahoo.co.in>
Cc: Gareth Williams <gareth@microm-electronics.com>,
    "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: pcmcia sram card 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 11 Nov 2001 13:41:04 +0000
Message-ID: <2264.1005486064@redhat.com>
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

kadamsom@yahoo.co.in said:
>   is pcmcia sram card supported  what configuration i should use in
> pcmcia and any other thing to use sram card can i create file system
> on it 

PCMCIA cards are not supported by the MTD code, although they are supported 
by the PCMCIA code. This is simply because nobody's contributed a map driver
to make them work with the MTD code yet, and every time I look at the 
PCMCIA code my head hurts and I get distracted into working on my pending 
rewrite of it.

--
dwmw2
