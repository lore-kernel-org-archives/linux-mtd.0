Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16M3xt-0001y1-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2002 09:15:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020103002709.33463.qmail@web11106.mail.yahoo.com> 
References: <20020103002709.33463.qmail@web11106.mail.yahoo.com> 
To: Sheela Kashyap <sheela_kashyap@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 Jan 2002 09:26:02 +0000
Message-ID: <5660.1010049962@redhat.com>
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

sheela_kashyap@yahoo.com said:
> Hmm... I will try mkfs.jffs again in that case.  

If it fails, can you cut down the directory tree you're putting into the
JFFS image to the smallest testcase that shows the problem (like the /dev
directory and a single device node), then send me both a tarball and the
JFFS image of it?

Where did you get your mkfs.jffs from? 

--
dwmw2
