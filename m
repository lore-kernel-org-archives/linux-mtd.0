Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170V2a-0007BU-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 23:15:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1019677528.1351.67.camel@zeus> 
References: <1019677528.1351.67.camel@zeus> 
To: Frederick Lefebvre <flefebvre@irg.ca>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: build_fs failed 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 24 Apr 2002 23:15:02 +0100
Message-ID: <17234.1019686502@redhat.com>
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

flefebvre@irg.ca said:
> What does a "build_fs failed" msg means when trying to mount a jffs2
> filesystem? 

It means you have debugging enabled but you neglected to quote the messages 
_before_ 'build_fs failed' which might have indicated _why_ it failed :)

--
dwmw2
