Date: Tue, 11 Apr 2017 23:08:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oleksij Rempel <ore@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH v2 2/3] fs: ubifs: update i_version on inode changes
Message-ID: <20170412060847.GA23545@infradead.org>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-3-o.rempel@pengutronix.de>
 <20170411160530.GA25234@infradead.org>
 <d1641500-dda5-d317-49f6-6b1be734edf4@nod.at>
 <20170412060534.meohif5djev7johp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170412060534.meohif5djev7johp@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 12, 2017 at 08:05:34AM +0200, Oleksij Rempel wrote:
> The code seems to confirm it. So i assumed that IMA don't care if
> i_version is stored to disk or not. And i_version is the only way
> to notify IMA about inode changes.
> Since IMA documentation explecitley set i_version as reqieremt, so this
> option was provided as well.

Maybe IMA doesn't care, but if you set MS_I_VERSION the fs does give
a guarantee.  Sp NAK on this patch as-is.
