Received: from samwise.efn.org ([12.33.21.33])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dt4RA-00072l-E1
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2005 10:11:53 -0400
To: linux-mtd@lists.infradead.org
In-reply-to: <1121294622.12224.87.camel@localhost.localdomain> (message from
	David Woodhouse on Wed, 13 Jul 2005 23:43:41 +0100)
References: <E1DqvgV-000275-00@amazonia.client.comcast.net>
	<1121093753.27264.117.camel@hades.cambridge.redhat.com>
	<E1Ds2ma-0005ta-00@amazonia.client.comcast.net>
	<1121108481.27264.129.camel@hades.cambridge.redhat.com>
	<E1Ds4AF-00063d-00@amazonia.client.comcast.net>
	<1121115438.3430.6.camel@localhost.localdomain>
	<E1DsMIp-0004U9-00@amazonia.client.comcast.net>
	<1121181101.12169.4.camel@hades.cambridge.redhat.com>
	<E1DsNHk-0004bq-00@amazonia.client.comcast.net>
	<1121186381.12086.6.camel@localhost.localdomain>
	<E1DsOD0-0004iT-00@amazonia.client.comcast.net>
	<1121189272.12224.10.camel@localhost.localdomain>
	<E1Dspqm-0003zl-00@amazonia.client.comcast.net>
	<1121294622.12224.87.camel@localhost.localdomain>
Message-Id: <E1Dt4R6-0005UI-00@amazonia.client.comcast.net>
From: Rick Bronson <rick@efn.org>
Date: Thu, 14 Jul 2005 07:11:36 -0700
Subject: Re: infinite loop in jffs2_flush_wbuf_gc()?
Reply-To: rick@efn.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

  In a netshell, here is the test case:

  Using 20050712 cvs mtd on an Atmel AT91RM9200 running linux-2.6.9
with a NAND part and doing:

1. Erase a jffs2 NAND partition, then mount it.
2. Make 5000 170 byte files named test0000.bin through test4999.bin in
   the partition.
3. run "ls -Rl" on the partition mount point.
4. remove all files in the partition via "rm -rf"

  A few seconds after the command line prompt appears the gc code goes
  into a 12 minute temporary "hang" loop in jffs2_flush_wbuf_gc() in
wbuf.c starting at: 

	} else while (old_wbuf_len &&
		      old_wbuf_ofs == c->wbuf_ofs) {

  Rick Bronson

> Hm. 12 minutes is a fairly significant problem. Can you report your test
> case to the mailing list?
> 
> -- 
> dwmw2
> 
> 
