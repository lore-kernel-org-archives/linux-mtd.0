Received: from yuha.menta.net ([212.78.128.42])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFBzq-0001m7-6c
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 12:33:51 +0000
Received: from gibson.menta.net ([212.78.128.22]) by
          yuha.menta.net (Netscape Messaging Server 4.15) with ESMTP id
          HNKLKP00.LDY for <linux-mtd@lists.infradead.org>; Thu, 30 Oct
          2003 13:34:01 +0100
Received: from stream.amrsystems.com ([62.57.42.165]) by
          gibson.menta.net (Netscape Messaging Server 4.15 gibson Mar 14
          2002 21:29:48) with ESMTP id HNKLNV01.219 for
          <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 13:35:55 +0100
Received: (from perello@localhost)
	by stream.amrsystems.com (8.11.6/linuxconf) id h9UChZi31585
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2003 13:43:35 +0100
From: Carles Perello <carles.perello@ieee.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1067455652.662.3.camel@stream.amrsystems.com>
References: <1067455652.662.3.camel@stream.amrsystems.com>
Message-Id: <1067517813.670.11.camel@stream.amrsystems.com>
Mime-Version: 1.0
Date: 30 Oct 2003 13:43:34 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: mtd from cvs compiles for a 2.4.x kernel?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-29 at 20:27, Carles Perello wrote:
> I updated my mtd sources from CVS today and patched a 2.4.19 kernel for
> an arm target...
> 
> while trying to compile complains about undefined SA1100_CS0_PHYS in
> sa1100-flash.c.
> 

I answer my own problem: kernel 2.4.20 has a new sa1100.h which inludes
the needed definitions.

Sorry about the noise

-- 
Carles Perello <carles.perello@ieee.org>
