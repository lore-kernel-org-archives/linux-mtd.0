Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHMb1-0001nP-H5
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 10:26:38 -0400
Date: Mon, 19 Sep 2005 17:26:11 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050919142611.GA14858@angel.research.nokia.com>
References: <431EAF8F.2000903@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <431EAF8F.2000903@inf.u-szeged.hu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Erase block summary commited
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 07, 2005 at 11:14:55AM +0200, ext Ferenc Havasi wrote:
> I've now commited our mount time improvement called erase block summary.

I just tried the CVS head on a device with a JFFS2 image which works
with summary patch from last May.  With CVS head I got several of 

  JFFS2 warning: (337) jffs2_sum_scan_sumnode: Summary node crc error,
skipping summary information.

Did the summary node format change recently and do I have to reflash
in order to use the new summary code?

Even with this problem, I am very pleased the erase block summaries finally 
went to CVS.

Jarkko Lavinen
