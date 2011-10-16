Received: from na3sys009aog119.obsmtp.com ([74.125.149.246])
 by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RFEen-0005jS-Tl
 for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 00:32:50 +0000
Received: by mail-iy0-f171.google.com with SMTP id n33so5366063iae.30
 for <linux-mtd@lists.infradead.org>; Sat, 15 Oct 2011 17:32:45 -0700 (PDT)
From: Kevin Paul Herbert <kevin.herbert@meraki.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [PATCH] mtd m25p80: add support for Macronix MX25L12805D
Message-Id: <63A7EBF6-2A5D-4607-AA5C-CC8F3ED0C29B@meraki.net>
To: buytenh@wantstofly.org
Mime-Version: 1.0 (Apple Message framework v1251.1)
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sun, 16 Oct 2011 00:32:51 -0000

Is there a reason that you did not include SECT_4K for the MX25L12805D?
The chips that I have support it, and its in the data sheet. Was this
an oversight or is there a problem with some chips?

I searched the archives from May, 2009, and did not see any discussion
on this issue.

If there are no problems, do you see a problem with me submitting a patch
to change this?

Thanks,
Kevin
