Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QHe0G-0003zC-Tp
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 15:28:41 +0000
Received: from [192.168.0.34] (col31-4-88-188-83-94.fbx.proxad.net
	[88.188.83.94])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 28DE6EC
	for <linux-mtd@lists.infradead.org>;
	Wed,  4 May 2011 17:28:30 +0200 (CEST)
Message-ID: <4DC170AD.1060201@free-electrons.com>
Date: Wed, 04 May 2011 17:28:45 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: unsupported subpages: how to be sure/fix ?
References: <4DB998E3.6070304@free-electrons.com>
In-Reply-To: <4DB998E3.6070304@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/28/2011 06:42 PM, David Wagner wrote:
> Hello,
> 
> I got the infamous -74 error with the 2-planes OneNand chip I'm using
> when trying to create a UBI Volume
> [...]

Hello again,

I found in the documentation that VERIFY_NAND_WRITES could also cause
errors when dealing with subpages of a 2KiB-pages NAND (the onenand i'm
using has them). (The warning in the documentation is about -5 errors,
though).
I disabled it and the errors also disappeared.
But the time of writing of this warning is 2.6.26 ; is it still relevant
? If so, I would be interested to try and fix it (I'm doing an
internship which subject is MTDs)

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
