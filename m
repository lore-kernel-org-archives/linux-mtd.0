Received: from nf-out-0910.google.com ([64.233.182.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJOhI-0003tt-PQ
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 01:41:59 -0500
Received: by nf-out-0910.google.com with SMTP id a4so2553065nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Feb 2007 22:41:53 -0800 (PST)
Message-ID: <9b52d64c0702192241y2c778a54r17cea174eb8781d8@mail.gmail.com>
Date: Tue, 20 Feb 2007 12:11:53 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Question about MTD Erase mechanism.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have 1 question about MTD Erase mechanism.

Say we have a MTD device with 'n' no. of blocks. Each block is of size
100Bytes. Once erased we can write 25bytes i.e. min_io_size is
25bytes. So once a block is erased I can perform 4 writes without
erasing it again only if those 4 writes are not overlapping. But if
any of those write is overlapping i.e. if re-write occurs then entire
block have to be erased.

So my question is who handles these types of conditions. I mean does
hardware handles such conditions or software have to handle such
situations? I mean who handles re-writing & erasures due to that???


Thanks & Regards
Vinit.
