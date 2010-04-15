Date: Thu, 15 Apr 2010 12:00:36 +0400 (MSD)
From: Alexander Kurz <linux@blala.de>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH 1/2] drivers/mtd/maps/pcmciamtd.c: fixing obvious
 errors
In-Reply-To: <20100413010112.GC8978@pengutronix.de>
Message-ID: <alpine.DEB.1.10.1004151145440.25680@blala.de>
References: <alpine.DEB.1.10.1004121945510.7438@blala.de>
	<20100413010112.GC8978@pengutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram,
 thanks for your comment,

On Tue, 13 Apr 2010, Wolfram Sang wrote:
> 
> I'd suggest keeping 'failed', removing the 'err'-statement and using 'goto
> failed' in error cases. Currently, pcmciamtd_release() is used many times on
> errors.
right, sorry, I missed this.

Hopefully I will get some more Storage-Cards for further tests
next week, so I will post the patch again afterwards.

Cheers, Alexander
