Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kwPu-0007ho-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 00:14:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FNEOLNAALFHDKOECFFJEEEGMEGAA.ch@murgatroid.com> 
References: <FNEOLNAALFHDKOECFFJEEEGMEGAA.ch@murgatroid.com> 
To: "Christopher Hoover" <ch@murgatroid.com>
Cc: "Linux-Arm-Kernel" <linux-arm-kernel@lists.arm.linux.org.uk>,
    "Linux-Mtd" <linux-mtd@lists.infradead.org>
Subject: Re: 2.5.5-rmk2: "deflateInit alloc of workspace failed" from fs/jffs2/compr_zlib.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Mar 2002 00:26:11 +0000
Message-ID: <5303.1015979171@redhat.com>
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

ch@murgatroid.com said:
>  Recall that is the alternative you suggested vs unlocking writeable
> parititions in mtdpart.c. 

Fine by me if Russell and Nico agree - either or both own that file; I 
don't care too much about individual map drivers.

--
dwmw2
