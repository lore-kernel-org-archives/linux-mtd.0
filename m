Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dYbJ-00025b-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 15:24:09 +0000
Date: Wed, 20 Feb 2002 16:35:19 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: Jonas Holmberg <jonas.holmberg@axis.com>
cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD concat layer
In-Reply-To: <1014215286.11576.13.camel@pcjonashg>
Message-ID: <Pine.LNX.4.21.0202201620030.16780-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Jonas,

On 20 Feb 2002, Jonas Holmberg wrote:

> I'm ready to do some serious testing now.

Good!

> Should I use these patches or
> do you have newer versions?

The erase function has a bug for which I'm currently developing
a fix. I hope to get it done by tomorrow. The bug does not show
up if you use erase/eraseall, but will probably manifest itself
when using JFFS/JFFS2 on a concatenated device.

> When can we expect to see this in CVS?

Good question :-). Apparently David is not yet completely convinced
that it should be implemented the way I did. If you do some serious
testing, your test results might help to persuade him (or prove to him
that his scepticism was right). In any case, please share your
results.

Cheers

Rob
----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
