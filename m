Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AAwo-00032b-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 14:44:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B2768F0.9979B834@inventel.fr> 
References: <3B2768F0.9979B834@inventel.fr>  <3B273827.33CC03BB@inventel.fr> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: root jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 14:46:58 +0100
Message-ID: <15751.992440018@redhat.com>
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

xde@inventel.fr said:
>  In fact, when the JFFS says that it failed to mount the device 1f:01,
> the VFS detects the jffs2 and mount it ; and when it successfully
> mounted device 1f:01, VFS mounts a jffs filesystem ; but as it is a
> jffs2, then the following happens !!!

Disable JFFS and compile in only JFFS2.

--
dwmw2
