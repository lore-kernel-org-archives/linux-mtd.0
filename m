Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17x5e9-0004cs-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2002 14:04:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D9C3F2C.1040901@wolfhill.cz> 
References: <3D9C3F2C.1040901@wolfhill.cz> 
To: Ales Makarov <ales.makarov@wolfhill.cz>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 without compression 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 Oct 2002 14:03:58 +0100
Message-ID: <15303.1033650238@passion.cambridge.redhat.com>
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

ales.makarov@wolfhill.cz said:
>  When I try to edit the file (I change the 3rd line to "0;COOLER") and
> save the  file, the kernel crashes with: 

Please use ksymoops. Numbers are meaningless.

>  I'd like to try the JFFS2 without compression. Where can I disable
> the zlib  compression? 

fs/jffs2/compr.c. 

--
dwmw2
