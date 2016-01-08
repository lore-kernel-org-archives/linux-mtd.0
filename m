Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHbLN-000155-2q
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 18:00:57 +0000
Received: by mail-pa0-x242.google.com with SMTP id a20so16712848pag.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jan 2016 10:00:36 -0800 (PST)
Date: Fri, 8 Jan 2016 10:00:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Trace-events for mtd
Message-ID: <20160108180033.GP109450@google.com>
References: <20151117191448.GA5367@dw-nb.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151117191448.GA5367@dw-nb.local>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 08:14:48PM +0100, Daniel Walter wrote:
> I wanted to reach out to the broader community to find
> out if I missed somethings and to get overall feedback
> if more traceevents would be useful to help us
> debugging mtd i/o a little bit better.

Regarding this point: is there a good reason not to track mtd_erase()?
How about mtd_{read,write}_oob()? (NB: The latter can be used to get
both in-band and out-of-band data.)

Brian
