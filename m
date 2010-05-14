Subject: Re: [git pull] pcmciamtd fixes
From: David Woodhouse <dwmw2@infradead.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
In-Reply-To: <20100513095749.GA25909@comet.dominikbrodowski.net>
References: <20100513095749.GA25909@comet.dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 03:24:50 +0100
Message-ID: <1273803890.9999.866.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-13 at 11:57 +0200, Dominik Brodowski wrote:
> Alexander Kurz spent quite some time to fix pcmciamtd to not only build
> again, but to actually work on some cards he owns. In addition, there are a
> few more PCMCIA IDs to report, and Julia Lawall reported and fixed an
> use-after-free bug in pcmciamtd. Could you pick up these patches and pull
> from 

I already had Julia's patch; I've picked up the other three. Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
