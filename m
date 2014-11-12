Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoX5W-0007Xg-AH
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 12:31:55 +0000
Message-ID: <1415795489.22887.246.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] UBIFS: add ubifs_err() to print error reason
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ben Shelton <ben.shelton@ni.com>
Date: Wed, 12 Nov 2014 14:31:29 +0200
In-Reply-To: <20141111160809.GA11589@bshelton-desktop>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
 <1414781431-2911-5-git-send-email-ben.shelton@ni.com>
 <1415704235.22887.138.camel@sauron.fi.intel.com>
 <20141111160809.GA11589@bshelton-desktop>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2014-11-11 at 10:08 -0600, Ben Shelton wrote:
> On 11/11, Artem Bityutskiy wrote:
> > Pushed this, but made some amendments.
> > 
> > Now all 4 are in the master branch. Would you please re-test them again
> > and confirm that they are fine. Then I'll push them to the linux-next
> > branch, unless you report that my amendments broke something.
> > 
> > Thank you!
> > 
> 
> Hi Artem,
> 
> I pulled the four modified commits into my 3.18-rc3 branch and tested
> with lockdep enabled.  Everything looks good.

OK, thank you!
