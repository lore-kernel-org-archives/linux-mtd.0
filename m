Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JwhJ-0002hB-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 14:37:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20561.1024307796@redhat.com> 
References: <20561.1024307796@redhat.com>  <200206170924.g5H9OXJJ003077@blooper.utfors.se> <0111121314140A.28381@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se> <02022614424803.15969@jocke.lumentis.se> 
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
    linux-mtd@lists.infradead.org
Subject: Re: point()/unpoint() questions + small cfi_cmdset_0001.c patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 14:37:32 +0100
Message-ID: <3973.1024321052@redhat.com>
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

dwmw2@infradead.org said:
> I've  been tempted to use this kind of hack for mounting JFFS2 without
> multiple  out of line read calls, but haven't actually got round to
> even hacking up  the code to test how fast it would be, by replacing
> the jffs2_flash_read()  in scan.c with a memcpy from a hard-coded
> address.

Er, this is of course complete crap -- half the point is to remove the need
for copying at all. So the reason I've not got round to doing the
replacement with memcpy() is mostly because in the moments when I'm actually
capable of writing code which compiles, I'm not stupid enough to contemplate
it.

Note to self: Do not reply to mailing list posts before getting to the 
office and drinking coffee; especially on Mondays.

--
dwmw2
