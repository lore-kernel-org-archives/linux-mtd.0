Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgFId-0007eX-2d
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 15:55:11 +0000
Message-ID: <1413820062.7906.376.camel@sauron.fi.intel.com>
Subject: Re: UBI/UBFS: ubi_eba_read_leb() reporting unmapped LEB
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Steve B <steve@baconbits.demon.co.uk>
Date: Mon, 20 Oct 2014 18:47:42 +0300
In-Reply-To: <alpine.DEB.2.02.1410201624320.2556@ubuntu>
References: <alpine.DEB.2.02.1410101444510.2556@ubuntu>
 <1413812127.7906.282.camel@sauron.fi.intel.com>
 <alpine.DEB.2.02.1410201442380.2556@ubuntu>
 <1413813912.7906.305.camel@sauron.fi.intel.com>
 <alpine.DEB.2.02.1410201529590.2556@ubuntu>
 <1413818380.7906.352.camel@sauron.fi.intel.com>
 <alpine.DEB.2.02.1410201624320.2556@ubuntu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-20 at 16:25 +0100, Steve B wrote:
> Thank you very much for your suggestions Artem, gives me plenty to look
> into :)

May be this will be also a useful piece of data.

Back several years ago, we saw ext4 not recovering after power cuts on
eMMC.

We knew ext4 is extremely complex, so we decided to go and test if eMMC
does the right job. Namely, if I submit data, they sync, does eMMC make
sure the data are on the media?

Adrian (the other UBIFS author) implemented the eMMC power cut test. And
he found that you may write to block A, they sync, then write to block
B, and have power cut, and after reboot block A is corrupted. So
interrupted write to block B affected a different block A.

We reported to the eMMC vendor, and the vendor acknowledged the problem
and we got newer eMMC, which was devoid of the issue. And our ext4
issues went away, it became a lot better.

This is why I say may be stressing UBI could be a good idea. It may be
waste of time too, though, if the problem is in UBIFS, or if the test
won't reveal a problem in UBI because the test is not good enough. But
it may also hit the nail quickly.

Artem.
