Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ok3M-0003lq-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2001 12:19:05 +0100
Date: Wed, 3 Oct 2001 13:31:24 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: DoC (NFTL) problem with 2.4.10-ac3 
In-Reply-To: <7631.1002106349@redhat.com>
Message-ID: <Pine.LNX.4.21.0110031326470.6225-100000@lxserver.deltes.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

It's right.
Thanks

Martin

On Wed, 3 Oct 2001, David Woodhouse wrote:

> 
> Change the #if 1 at line 97 of nftlmount.c to #if 0
> 
> 
> --
> dwmw2
> 
