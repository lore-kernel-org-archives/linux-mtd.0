Date: Tue, 11 Apr 2017 09:05:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] fs: ubifs: update i_version on inode changes
Message-ID: <20170411160530.GA25234@infradead.org>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170411095055.26328-3-o.rempel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 11, 2017 at 11:50:54AM +0200, Oleksij Rempel wrote:
> increment i_version to notify security/IMA about changes
> made in inode.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

And how is this stored on disk?
