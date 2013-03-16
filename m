Message-ID: <5144C334.6060003@newsguy.com>
Date: Sat, 16 Mar 2013 12:08:36 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] mtd: remove nftl support
References: <1362560099-19638-1-git-send-email-dedekind1@gmail.com>
 <1362560099-19638-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362560099-19638-2-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/06/2013 12:54 AM, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> This is very old cruft with all the users probably dead. Newer DoC devices use
> inftl.



Actually the "newest" devices (circa 2005) use yet another incarnation called
saftl.  I didn't bother trying to support it in the docg4 driver.  IIRC, it
stands for "serial-access flash translation layer", which I think refers to the
fact that pages within a block must be written in sequence.

Thanks,
Mike
