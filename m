Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AB8r-00033X-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 14:57:05 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id QAA07339
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 16:02:32 +0200 (CEST)
Message-ID: <3B277209.7F99651C@inventel.fr>
Date: Wed, 13 Jun 2001 16:00:41 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <3B2768F0.9979B834@inventel.fr>  <3B273827.33CC03BB@inventel.fr> <15751.992440018@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

David Woodhouse a écrit :
> 
> xde@inventel.fr said:
> >  In fact, when the JFFS says that it failed to mount the device 1f:01,
> > the VFS detects the jffs2 and mount it ; and when it successfully
> > mounted device 1f:01, VFS mounts a jffs filesystem ; but as it is a
> > jffs2, then the following happens !!!
> 
> Disable JFFS and compile in only JFFS2.
> 
> --
> dwmw2


Sorry for that early posting ; that's what I was doing and it works for
now.

Thank you.

Xavier
