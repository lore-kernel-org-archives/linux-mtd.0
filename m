Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mVt0-0000xx-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 09:51:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0209040213410.18377-100000@hex.linuxgrrls.org> 
References: <Pine.LNX.4.33.0209040213410.18377-100000@hex.linuxgrrls.org> 
To: Jasmine Strong <jasmine@hex.linuxgrrls.org>
Cc: John Hall <John.Hall@optionexist.co.uk>,
    "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 09:51:19 +0100
Message-ID: <21868.1031129479@redhat.com>
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

jasmine@hex.linuxgrrls.org said:
>  WARNING! WARNING!  there are architectures that will break if you do
> this. 

Architectures on which Linux runs? eCos needs its own rbtree implementation 
anyway, since the one I'm using is GPL'd.

--
dwmw2
