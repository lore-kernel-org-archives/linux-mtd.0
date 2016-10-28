Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c03d9-00027D-4f
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 09:39:20 +0000
Subject: Re: [REGRESSION 4.9-rc2] "c83ed4c - ubifs: Abort readdir upon error"
 breaks mount
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
References: <20161028113708.4d5535ba@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <dbd2bff6-fdb9-2022-7acc-fcd1cac4c88c@nod.at>
Date: Fri, 28 Oct 2016 11:38:55 +0200
MIME-Version: 1.0
In-Reply-To: <20161028113708.4d5535ba@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ralph,

On 28.10.2016 11:37, Ralph Sennhauser wrote:
> Dear Richard, dear list
> 
> When testing 4.9-rc2 the device wouldn't boot, as it turns out commit
> c83ed4c9dbb358b9e7707486e167e940d48bfeed prevent's me mounting root.
> 

A fix for this is already heading upstream:
http://lists.infradead.org/pipermail/linux-mtd/2016-October/070023.html

Thanks,
//richard
