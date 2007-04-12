Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HbyE6-0000yb-Qb
	for linux-mtd@lists.infradead.org; Thu, 12 Apr 2007 08:16:38 -0400
Message-ID: <461E231F.9000404@inf.u-szeged.hu>
Date: Thu, 12 Apr 2007 14:16:31 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: akorolev <alexey.korolev@intel.com>
Subject: Re: Centralized summary as a way to speed up "ls" time
References: <461BC120.2080507@intel.com>
In-Reply-To: <461BC120.2080507@intel.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexey,

akorolev wrote:
> While using JFFS2 on NAND devices with large size and many files I faced 
> the problem of very slow "ls" performance.
> On folder which contains ~40 files and ~80MB ls could take ~25sec!
> 
> The question I have will it be possible to extend a little bit 
> functionality of Centralized Summary to story these nodes as well.
> Do you see any technical issues here?

Now we have thought it over, and there is no big technical problem in 
extending Centralized Summary for storing these (frag tree) nodes as well.

We see two technical things:
- it is not sure that after an "ls" the these trees are staying in 
memory for ever - so saving only the exiting trees may not cause always 
speedup
- it can increase the summary information by (in worst case) about 100%.

> Do you have any updates of CS? Is the last version of CS placed here 
> www.inf.u-szeged.hu/jffs2/mount.php?

Yes, this is the last version. To update this for the latest MTD version 
can be a little bit big effort - many thing has been changed.

Ferenc
