Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14ubMV-0005P2-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 15:42:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BD619B2A58D41197990050DA2C08E40258DE@SLINK12> 
References: <F1BD619B2A58D41197990050DA2C08E40258DE@SLINK12> 
To: Jan Rovins <Jan.Rovins@radisys.com>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: MTD compile on 2.2.17 kernel (compile syntax error) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 May 2001 15:42:55 +0100
Message-ID: <17481.988728175@redhat.com>
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

Jan.Rovins@radisys.com said:
>  I've been struggling with getting the new source tree to build with
> my 2.2.17 ppc kernel. one thing that I am sure of is a typo at line #
> 211 of cfi_cmdset_0002.c map->fldrv_destroy should be changed to map->
> fldrv->destroy . Could someone with CVS access please fix this? 

Wrong fix, but it'll work if you're not using modules.

--
dwmw2
