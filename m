Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Up5i-0008HQ-P1
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 15:48:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Allen Curtis <acurtis@onz.com>
In-Reply-To: <5.2.1.1.0.20030624073300.00ae2100@192.168.1.10>
References: <5.2.1.1.0.20030622225659.00a46a30@192.168.1.10>
	 <5.2.1.1.0.20030622225659.00a46a30@192.168.1.10>
	 <5.2.1.1.0.20030624073300.00ae2100@192.168.1.10>
Message-Id: <1056466116.29264.505.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Jun 2003 15:48:37 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Infradead Org <linux-mtd@lists.infradead.org>
cc: jffs-dev@axis.com
Subject: Re: JFFS patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-06-24 at 15:34, Allen Curtis wrote:
> Sure... I had CVS commit access at one time. It has been so long I am not 
> sure if it still works.

It should do, and you have SSHv2 keys installed so you're not likely to
fall into the trap that everyone else does -- trying to log in with
SSHv2 when you only have v1 keys.

Off the top of my head, I know that the kdev_t abuse (i.e. writing it
directly to the medium) needs to be fixed, and ideally you could port
the mount code from JFFS2 which doesn't need the mtdblock device to be
present. I'm sure Al will have plenty more 'suggestions'... ;)

-- 
dwmw2
