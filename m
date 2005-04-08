Received: from over.ny.us.ibm.com ([32.97.182.150])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJxs4-0000Hx-UF
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2005 14:06:21 -0400
Received: from e2.ny.us.ibm.com ([192.168.1.102])
	by pokfb.esmtp.ibm.com (8.12.11/8.12.11) with ESMTP id j38Hrjwm027187
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2005 13:53:45 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j38HrZc9007167
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2005 13:53:35 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j38HrZJL214754
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2005 13:53:35 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j38HrZaY014244
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2005 13:53:35 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Andrew Morton <akpm@osdl.org>
In-Reply-To: <20050408104826.3ca70fb4.akpm@osdl.org>
References: <20050408170805.GE2292@wohnheim.fh-wedel.de>
	<20050408104826.3ca70fb4.akpm@osdl.org>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 08 Apr 2005 12:53:33 -0500
Message-Id: <1112982813.7573.1.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] restrict inter_module_* to its last users
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-04-08 at 10:48 -0700, Andrew Morton wrote:
> Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> >
> > Next step for inter_module removal.  This patch makes the code
> >  conditional on its last users and shrinks the kernel binary for the
> >  huge majority of people.
> 
> If we do this, nobody will get around to fixing up the remaining users.

Well, here's a good starting point to actually fix things:

http://www.kernel.org/pub/linux/kernel/people/rusty/Module/remove-inter-module-mtd.patch.bz2

josh
