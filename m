Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uFQb-0002Uj-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 16:17:34 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uFQ9-0008DL-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 16:17:05 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uFQ8-0008DE-00
	for mtd@infradead.org; Mon, 30 Apr 2001 16:17:04 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: <mtd@infradead.org>
Subject: AW: Flash driver probe/commandset separation.
Date: Mon, 30 Apr 2001 17:17:21 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFGEOJEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <26353.988569497@redhat.com>
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

Hi!

>Comments?
>
>Even assuming people agree (or disagree unconvincingly :), I'm not sure
>whether I should hold off on this until after I've sync'd up with Linus, or
>whether I should get this all done first and worry about feeding the new
>code to Linus later on. Probably the latter.

Lets commit the tree as soon it is reported to be stable to Linus. I have no
major problems at the moment. So from my point of view we're ready to do the
sync. After that we can play with all the stuff again :) Probably we should
set a deadline and then freeze the code. There is always someone who commits
a ugly (non working) patch 10 seconds before all will be send to Linus :-)

Bye
  Florian



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
