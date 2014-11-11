Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo8Wf-0005BD-J7
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 10:18:17 +0000
Message-ID: <1415701073.22887.126.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/4] UBIFS: Add xattr support for symlinks
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ben Shelton <ben.shelton@ni.com>
Date: Tue, 11 Nov 2014 12:17:53 +0200
In-Reply-To: <20141110171253.GA18047@bshelton-desktop>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
 <1414781431-2911-3-git-send-email-ben.shelton@ni.com>
 <1415628106.22887.122.camel@sauron.fi.intel.com>
 <20141110171253.GA18047@bshelton-desktop>
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

On Mon, 2014-11-10 at 11:12 -0600, Ben Shelton wrote:
> On 11/10, Artem Bityutskiy wrote:
> > Could you please re-test this with any kernel and carefully verify
> > symlinks. I think this should not work, because in case of symlinks we
> > already store the link target path in the inode, and with this patch the
> > target patch will be over-written with the SELinux label. I expect this
> > to be seen easily on testing - symlink targets should be corrupted.
> > 
> > Artem.
> > 
> 
> I retested this with a 3.18-rc3 kernel on one of our ARM-based targets.
> The kernel has patch 1/4 with your changes, plus patches 2/4, 3/4, and
> 4/4 as posted.

Ben, thanks for re-testing. And yes, I was wrong. Now I checked again
and finally remembered how it works.

So yes, symlink inode has data, and the target is in the data.

If we add an extattr to a symlink, we create a separate inode for that
xattr under the symlink inode. Any new xattr gets a new inode.

Artem.
