Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16K6db-0002K2-00
	for <linux-mtd@lists.infradead.org>; Fri, 28 Dec 2001 23:42:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011228234824.29500.qmail@web11101.mail.yahoo.com> 
References: <20011228234824.29500.qmail@web11101.mail.yahoo.com> 
To: Sheela Kashyap <sheela_kashyap@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 28 Dec 2001 23:52:58 +0000
Message-ID: <14833.1009583578@redhat.com>
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
> everything is fine till it comes time to mount the root FS.It still
> seems to try and go out on the net. This is the trace I see. I have
> cut out some parts to reduce the clutter.  

A kernel that old doesn't have 'mtdblock' in the root_dev_names array in 
init/main.c. Add it.

--
dwmw2
