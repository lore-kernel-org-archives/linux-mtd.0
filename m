Received: from co202.xi-lite.net ([149.6.83.202])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTWUr-0003Ju-FJ
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 10:25:37 +0000
Date: Thu, 24 Nov 2011 11:24:53 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3 13/16] mtd/docg3: add ECC correction code
Message-ID: <20111124102453.GF28830@parrot.com>
References: <1321714978-24543-1-git-send-email-robert.jarzmik@free.fr>
 <1321714978-24543-14-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1321714978-24543-14-git-send-email-robert.jarzmik@free.fr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 19, 2011 at 03:02:55PM +0000, Robert Jarzmik wrote:
> Credit for discovering the BCH algorith parameters, and bit
> reversing algorithm is to be give to Mike Dunn and Ivan
> Djelic.
> 
> The BCH correction code relied upon the BCH library, where
> all data and ECC is bit-reversed. The BCH library works
> correctly when each input byte is bit-reversed, and
> accordingly ECC output is also bit-reversed.
> 

Reviewed-by: Ivan Djelic <ivan.djelic@parrot.com>
