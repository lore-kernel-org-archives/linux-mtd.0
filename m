Received: from [63.204.6.12] (helo=mail.somanetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16C1IF-0003dR-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Dec 2001 16:22:39 +0000
Received: from CPE0020e0675038.cpe.net.cable.rogers.com
          ([24.42.237.141]) by mail.somanetworks.com (Netscape Messaging
          Server 4.15) with ESMTP id GNXKN900.3QB for
          <linux-mtd@lists.infradead.org>; Thu, 6 Dec 2001 08:33:09 -0800
Subject: [Fwd: Re: 2.4.16-rmk1 patch file]
From: "Georg Nikodym" <georgn@somanetworks.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-Y/Mlj0CD8kxv5EFL0sRo"
Date: 06 Dec 2001 11:33:08 -0500
Message-Id: <1007656389.1783.18.camel@keller>
Mime-Version: 1.0
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

--=-Y/Mlj0CD8kxv5EFL0sRo
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I sent the attached to the ARM kernel list because of a ^M the official
ARM architecture and Russell says that it's actually in the MTD CVS...

(I'm not on this list, so you'll need to Cc me on replies)



--=-Y/Mlj0CD8kxv5EFL0sRo
Content-Disposition: inline
Content-Description: Forwarded message - Re: 2.4.16-rmk1 patch file
Content-Type: message/rfc822

Return-Path: <linux@arm.linux.org.uk>
Received: from caramon.arm.linux.org.uk ([212.18.232.186]) by
	mail.somanetworks.com (Netscape Messaging Server 4.15) with ESMTP id
	GNXJXX00.2SY for <georgn@somanetworks.com>; Thu, 6 Dec 2001 08:17:57 -0800
Received: from [3ffe:8260:2002:1:201:2ff:fe14:8fad]
	(helo=flint.arm.linux.org.uk) by caramon.arm.linux.org.uk with esmtp (Exim
	3.16 #1) id 16C1Df-0006iR-00; Thu, 06 Dec 2001 16:17:55 +0000
Received: from linux by flint.arm.linux.org.uk with local (Exim 3.16 #1) id
	16C1Df-0008BV-00; Thu, 06 Dec 2001 16:17:55 +0000
Date: Thu, 6 Dec 2001 16:17:55 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Georg Nikodym <georgn@somanetworks.com>
Cc: linux-arm@lists.arm.linux.org.uk
Subject: Re: 2.4.16-rmk1 patch file
Message-ID: <20011206161755.C11287@flint.arm.linux.org.uk>
References: <1007654182.1783.12.camel@keller>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.2.5i
In-Reply-To: <1007654182.1783.12.camel@keller>; from
	georgn@somanetworks.com on Thu, Dec 06, 2001 at 10:56:21AM -0500

On Thu, Dec 06, 2001 at 10:56:21AM -0500, Georg Nikodym wrote:
> In the "One of lifes minor irritations" department, patch-2.4.16-rmk1
> contains the following useless change:
> 
> diff -urN orig/fs/jffs2/erase.c linux/fs/jffs2/erase.c
> --- orig/fs/jffs2/erase.c       Sun Oct 14 20:53:27 2001
> +++ linux/fs/jffs2/erase.c      Thu Nov  1 20:36:07 2001
> @@ -215,7 +215,7 @@
> 
>         D2({
>                 int i=0;
> -        struct jffs2_raw_node_ref *this;
> +        struct jffs2_raw_node_ref *this;               ^M
>          printk(KERN_DEBUG "After remove_node_refs_from_ino_list: \n"
> KERN_DEBUG
> );
> 
> (The control-m is real in the actual patch).
> 
> Can this diff be removed, please?

Please ask on the MTD list - the ^M appears to be in the MTD CVS.

--=-Y/Mlj0CD8kxv5EFL0sRo--
