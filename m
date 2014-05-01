Date: Thu, 1 May 2014 10:34:07 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [RFC PATCH 0/3] mtd: nand: add randomizer support
Message-ID: <20140501163407.GB3296@obsidianresearch.com>
References: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 01, 2014 at 03:09:49AM +0200, Boris BREZILLON wrote:
> Hello,
> 
> This series is a proposal to add support for randomizers (either software
> or hardware) to NAND flash controller drivers.

FWIW, I think the term for reversibly combining a PRBS with data is
'scrambling', it is often used in communication systems for similar
reasons - probabilisticly increasing transition density.

randomizing is something else entirely :)

BTW, there are security concerns here. The scrambler PRBS must not be
predictable by the user, otherwise they can write data that undoes the
scramble and defeat it, ie deliberately writing the last 2k of a 4k
write block as all 0's after scrambling could cause the first 2k to be
lost. That feels like something that could be scary ..

Jason
