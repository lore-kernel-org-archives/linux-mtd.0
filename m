Received: from mail.freepaq.dk ([213.150.59.107])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ABtCr-0002nu-Qo
	for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2003 10:53:37 +0100
Received: from unknown (HELO egholm-nielsen.dk) ([212.130.19.66])
          (envelope-sender <martin@egholm-nielsen.dk>)
          by mail.freepaq.dk (qmail-ldap-1.03) with SMTP
          for <linux-mtd@lists.infradead.org>; 21 Oct 2003 09:52:32 -0000
Message-ID: <3F9501E0.8060904@egholm-nielsen.dk>
Date: Tue, 21 Oct 2003 11:52:32 +0200
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <3F94FA47.7020805@egholm-nielsen.dk>
	<1066728627.6744.1529.camel@hades.cambridge.redhat.com>
In-Reply-To: <1066728627.6744.1529.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Mount-failure (jffs2_scan_empty()) mounting SmartMedia with
	jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>And now I'm lost... Any ideas of how to get any further?
> Can you read back the contents of the flash after writing, and compare
> with the image you attempted to write?
Heh, good point! I tried the following:

# dd if=/tmp/image of=/dev/mtd/2
32+0 records in
32+0 records out

# dd if=/dev/mtd/2 of=/tmp/copy count=32 bs=512
32+0 records in
32+0 records out

# ls -l /tmp
-rw-r--r--    1 root     root       16384 Jan  1 00:00 image
-rw-r--r--    1 root     root       16384 Jan  1 00:01 copy

# diff /tmp/image /tmp/copy
Binary files /tmp/image and /tmp/copy differ

I.e. not the same, no... You know why?

Regards,
  Martin Egholm Nielsen
