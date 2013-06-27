Received: from srv1.bluewind.it ([216.38.51.188])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Us5xV-0007fw-15
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 06:45:33 +0000
Received: from smtp.bluewind.it ([80.86.152.212]:44463 helo=[192.168.0.42])
 by srv1.bluewind.it with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.80.1) (envelope-from <enrico.benetti@bluewind.it>)
 id 1Us5vz-0004kP-LR
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 08:43:59 +0200
Message-ID: <51CBDF47.709@bluewind.it>
Date: Thu, 27 Jun 2013 08:44:23 +0200
From: enrico benetti <enrico.benetti@bluewind.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS: power cut test on 2.6.35 + NOR
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
I'd need a hint on the best way to go on with my development.

I'm working on a custom target based on 2.6.35.3 kernel with NOR device.

UBIFS R/W partitions seem not robust against power cut tests: I'm using
integck 1.4.9 and I can have unrecoverable errors on tested volume when
performing real power cuts.

First of all, I've done several MTD stress tests to validate the low
level driver.
I've checked git repos, and
http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/  
<http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/shortlog>
is updated to 08/2012 (that is approx 3.7.1 kernel revision) and no more
supported.

  From several discussions on the list I think the best way to solve (or
at least to have a better behaviour with ubi/ubifs) could be to get the
patches from this repo and merge them with my sources.

Do you agree or is it better to do more investigation on current issues?

Thanks in advance for your support,
Enrico
