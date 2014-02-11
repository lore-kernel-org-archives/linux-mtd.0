Received: from mail-qc0-x235.google.com ([2607:f8b0:400d:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDILN-0006gH-T0
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 18:46:06 +0000
Received: by mail-qc0-f181.google.com with SMTP id e9so13526891qcy.40
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 10:45:44 -0800 (PST)
Date: Tue, 11 Feb 2014 10:45:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan =?iso-8859-1?Q?S=F8rensen?= <stefan.sorensen@spectralink.com>
Subject: Re: [PATCH] mtd:elm: Use correct check on return value of
 pm_runtime_get_sync
Message-ID: <20140211184541.GG18440@ld-irv-0074>
References: <1391439249-23078-1-git-send-email-stefan.sorensen@spectralink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1391439249-23078-1-git-send-email-stefan.sorensen@spectralink.com>
Cc: avinashphilip@ti.com, dwmw2@infradead.org, Pekon Gupta <pekon@ti.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 03, 2014 at 03:54:09PM +0100, Stefan Sørensen wrote:
> The ELM driver incorrectly reagard any non-zero return value from
> pm_runtime_get_sync as an error, but it may return 1 if the device
> was already active. Fix to only error when return value is negative.
> 
> Signed-off-by: Stefan Sørensen <stefan.sorensen@spectralink.com>

Pushed to l2-mtd.git. Thanks!

Brian
