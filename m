Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FEXK-0006ON-DH
	for <linux-mtd@lists.infradead.org>; Mon, 12 May 2003 15:44:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Kelly <mgkelly59@yahoo.com>
In-Reply-To: <20030512144028.81747.qmail@web9605.mail.yahoo.com>
References: <20030512144028.81747.qmail@web9605.mail.yahoo.com>
Message-Id: <1052750673.23450.10.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 12 May 2003 15:44:34 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Is it normal to have a defunct jffs2_gcd_mtd1 process?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-12 at 15:40, Mike Kelly wrote:
> When I do a 'ps' command I get the following (partial
> list):
> 
> PID  TTY  TIME     CMD
>  8    ?   00:00:00 jffs2_gcd_mtd1 (defunct)
> 12    ?   00:00:00 jffs2_gcd_mtd1
> 
> Is it normal to have a defunct jffs2 garbage
> collection process?  Or should I be concerned?

It's fine -- when you remount the old one gets killed and a new one gets
restarted. Although this looks like you're starting off with a
read/write file system and then remounting it read/write -- which is a
little unnecessary :)

The fact that it remains defunct is probably an init bug.

-- 
dwmw2
