Received: from mail1.navico.com ([194.19.84.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LhSwo-0004fd-N1
	for linux-mtd@lists.infradead.org; Wed, 11 Mar 2009 18:14:37 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS recovery truncates file to zero size
Date: Thu, 12 Mar 2009 07:13:46 +1300
Message-ID: <70F6AAAFDC054F41B9994A9BCD3DF64E08F94AF6@exch01-aklnz.MARINE.NET.INT>
In-Reply-To: <F8252D21B3AD45E1A003F69611EA04E0@sky>
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
To: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The file is kept in the kernel write-back cache, until it is synced by
the user (eg. A sync() or fsync() call) or the kernel decides to write
it back (seems to be after 30 seconds by default).

You can disable write back cache, but if you make lots of small writes
to the file this will cause more wear on the flash. It is better to call
fsync() when you want the data to be saved.

See http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback

Also be carefull to note the comment about making your updates atomic.
Just adding the odd fsync() is not going to truely guarenteed your data
is not going to get fried.

Reuben

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Iram Shahzad
Sent: Wednesday, 11 March 2009 10:16 p.m.
To: linux-mtd@lists.infradead.org
Subject: UBIFS recovery truncates file to zero size

Hi

I am having the following problem with UBIFS (Linux 2.6.25 +
ubifs-v2.6.25).
Please could you tell me if this is a known issue.

Problem
    If the power is switched off abruptly while a file is being written,
    in the next boot the contents of the file is lost. That is, the file
    becomes zero sized. The problem is reproducable.

Thanks in advance.
Iram



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
