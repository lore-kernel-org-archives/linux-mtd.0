Date: Mon, 24 Aug 2015 01:06:20 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
Message-ID: <20150824080620.GB17815@infradead.org>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
 <1440070300.31419.202.camel@gmail.com> <55D5BC92.8050903@nod.at>
 <1440074048.31419.204.camel@gmail.com>
 <1440400689.15510.30.camel@gmail.com>
 <55DAC4F6.2020808@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55DAC4F6.2020808@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2015 at 03:17:10PM +0800, Dongsheng Yang wrote:
> >Richard, you mention this was suggested by Dave, could you please pint
> >to the discussion, if possible?
> 
> http://lists.infradead.org/pipermail/linux-mtd/2015-August/060702.html
> 
> That's in a discussion I want to introduce ubifs into xfstests.

FYI, xfstests is a test suite, _not_ an application.  Adding O_DIRECT
just for xfstests is utterly dumb and suggeting that is even dumber.

xfstests should check for supported features, and skip tests that use
it.
