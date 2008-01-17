Received: from hs-out-0708.google.com ([64.233.178.251]
	helo=hs-out-2122.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFWZd-0007q8-KY
	for linux-mtd@lists.infradead.org; Thu, 17 Jan 2008 15:22:40 +0000
Received: by hs-out-2122.google.com with SMTP id 23so1088266hsn.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jan 2008 07:22:32 -0800 (PST)
Date: Wed, 16 Jan 2008 18:34:58 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: DMcLeod <dmcleod@bittware.com>
Subject: Re: JFFS2 access time
Message-ID: <20080116183458.2c997320@zod.rchland.ibm.com>
In-Reply-To: <478E0D5E.8070508@bittware.com>
References: <478E0D5E.8070508@bittware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 Jan 2008 08:57:50 -0500
DMcLeod <dmcleod@bittware.com> wrote:

> Hi all,
> 
> We are using uClinux git 2.6.23. We have 4 2.5MB files sitting in a 
> directory on a ~40MB jffs2 partition (on NOR flash). The very first time 
> we do an 'ls' in that directory, the response takes literally minutes. 
> After the initial delay, any accesses to those files are very 
> quick.,,

That is normal for large files.  JFFS2 has do the CRC checking on all
the nodes for those large files.  That is a lot of nodes to check.  You
might want to look into using the eraseblock summary feature.

> Originally, we started off with the Microtronix 1.4 kernel and 
> it did not have this problem. The pre-git version of uClinux-dist had 
> this problem but not as severe - it was more like 40 seconds to list the 
> contents of that directory.

I have no idea what those two kernels are, but older JFFS2 used to do
all the CRC checking at mount time.  So mount would be slow and runtime
access would be relatively quick.

josh
