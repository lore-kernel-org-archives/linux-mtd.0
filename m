Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eFVP-0001E6-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 14:17:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20030130132133.GA13604@lilotux.net> 
References: <20030130132133.GA13604@lilotux.net> 
To: Stephane List <stephane.list@lilotux.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: crc32.h 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Jan 2003 14:48:23 +0000
Message-ID: <25947.1043938103@passion.cambridge.redhat.com>
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

stephane.list@lilotux.net said:
> I'm using the CVS source code. All files in "fs/jffs2" use #include
> <linux/crc32.h> But this file is not part of 2.4.x kernel it's only in
> 2.5 

Just copy it from fs/jffs2/ into include/linux/

--
dwmw2
