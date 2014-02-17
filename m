Date: Mon, 17 Feb 2014 12:34:17 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v6 1/3] ubi: Introduce block devices for UBI volumes
Message-ID: <20140217113417.GC16304@1wt.eu>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392633946.12215.150.camel@sauron.fi.intel.com>
 <20140217112728.GB21782@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140217112728.GB21782@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 17, 2014 at 08:27:29AM -0300, Ezequiel Garcia wrote:
> Ah, I just noticed I forgot to add:
> 
>   Tested-by: Willy Tarreau <w@1wt.eu>
>   Reviewed-by: Richard Weinberger <richard.weinberger@gmail.com>
> 
> who tested and reviewed previous versions of the UBI patch, and
> I'm sure are reading this and will test and review this one ;-)

Well, I'll be able to run a few tests with it when time permits, but
as explained, my hopes of something useful vanished with the removal
of the write support, so in practice I'll stick to the initial patch
:-(

Willy
