Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uG3l-0002Xs-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 16:58:03 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uG2w-00005n-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 16:57:10 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uG2v-00005h-00
	for mtd@infradead.org; Mon, 30 Apr 2001 16:57:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <BKEKLBIBFPNGJKJDEODFGEOJEIAA.schirmer@taytron.net> 
References: <BKEKLBIBFPNGJKJDEODFGEOJEIAA.schirmer@taytron.net> 
To: "Florian Schirmer / TayTron" <schirmer@taytron.net>
Cc: mtd@infradead.org
Subject: Re: AW: Flash driver probe/commandset separation. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 30 Apr 2001 16:56:07 +0100
Message-ID: <2069.988646167@redhat.com>
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

schirmer@taytron.net said:
>  Lets commit the tree as soon it is reported to be stable to Linus. I
> have no major problems at the moment. So from my point of view we're
> ready to do the sync. After that we can play with all the stuff again
> :) Probably we should set a deadline and then freeze the code. There
> is always someone who commits a ugly (non working) patch 10 seconds
> before all will be send to Linus :-)

Yeah, you're probably right. I've made most of it compile again. We should 
just fix up the CFI command sets and declare it frozen.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
