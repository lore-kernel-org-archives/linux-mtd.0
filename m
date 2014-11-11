Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoDzq-0002AH-FR
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 16:08:46 +0000
Date: Tue, 11 Nov 2014 10:08:10 -0600
From: Ben Shelton <ben.shelton@ni.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 4/4] UBIFS: add ubifs_err() to print error reason
Message-ID: <20141111160809.GA11589@bshelton-desktop>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
 <1414781431-2911-5-git-send-email-ben.shelton@ni.com>
 <1415704235.22887.138.camel@sauron.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <1415704235.22887.138.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/11, Artem Bityutskiy wrote:
> Pushed this, but made some amendments.
> 
> Now all 4 are in the master branch. Would you please re-test them again
> and confirm that they are fine. Then I'll push them to the linux-next
> branch, unless you report that my amendments broke something.
> 
> Thank you!
> 

Hi Artem,

I pulled the four modified commits into my 3.18-rc3 branch and tested
with lockdep enabled.  Everything looks good.

Thanks,
Ben
