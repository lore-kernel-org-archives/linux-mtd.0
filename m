Received: from tomts17-srv.bellnexxia.net ([209.226.175.71])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ybj7-0001vX-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2001 16:26:57 +0000
Received: from superbt.com ([65.93.173.58]) by tomts17-srv.bellnexxia.net
          (InterMail vM.4.01.03.16 201-229-121-116-20010115) with ESMTP
          id <20011030163544.SQDM19597.tomts17-srv.bellnexxia.net@superbt.com>
          for <linux-mtd@lists.infradead.org>;
          Tue, 30 Oct 2001 11:35:44 -0500
Received: from localhost (ilatypov@localhost)
	by superbt.com (8.11.4/8.11.4) with ESMTP id f9UGZTk07631
	for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2001 11:35:34 -0500
Date: Tue, 30 Oct 2001 11:35:29 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: GNU GRUB 0.90 DiskOnChip patch
In-Reply-To: <Pine.LNX.4.33.0110262114340.15641-200000@server.superbt.com>
Message-ID: <Pine.LNX.4.33.0110301128510.7616-100000@server.superbt.com>
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

There were few inaccuracies in my message.

   a) Locate a string "/tmp/cvs0V8r5k" in the patch and replace it with
   "stage2/bdev_diskonchip.c".

   b) The patch will work only with 8K erase unit size.

   c) The patch option is "-p0" not "-p1".

Ilguiz

On Fri, 26 Oct 2001, Ilguiz Latypov wrote:

> I modified the latest available GRUB DiskOnChip patch,
