Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=TX2EHSOBE004.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RciAL-0003hQ-A2
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2011 18:42:26 +0000
Message-ID: <4EEF858C.1070600@freescale.com>
Date: Mon, 19 Dec 2011 12:42:20 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <4EDEAEB9.6020703@freescale.com> <1323724195.2297.11.camel@koala>
 <4EE66EFE.1050608@freescale.com> <1323724784.2297.20.camel@koala>
 <4EE6725C.3050706@freescale.com>
 <1324132520.4240.26.camel@sauron.fi.intel.com>
 <4EEF849B.7030804@freescale.com>
In-Reply-To: <4EEF849B.7030804@freescale.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/19/2011 12:38 PM, Scott Wood wrote:
> On 12/17/2011 08:35 AM, Artem Bityutskiy wrote:
>> It looks like currently you can re-define chip->read_page, so I guess
>> you should rework MTD and make chip->write_page re-definable?
> 
> Unless something has changed very recently, there is no chip->read_page
> or chip->write_page.  There is chip->ecc.read_page and
> chip->ecc.write_page, but they are too low-level.  What we'd need to
> replace is a portion of nand_do_read_ops()/nand_do_write_ops().

Sorry, chip->write_page does exist -- it's chip->read_page that would
need to be made similarly redefinable.

-Scott
