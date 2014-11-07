Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmi4K-0003cv-SE
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 11:51:09 +0000
Message-ID: <1415361043.958.326.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix double free after do_sync_erase()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 07 Nov 2014 13:50:43 +0200
In-Reply-To: <1415288869-14915-1-git-send-email-richard@nod.at>
References: <1415288869-14915-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-06 at 16:47 +0100, Richard Weinberger wrote:
> If the erase worker is unable to erase a PEB it will
> free the ubi_wl_entry itself.
> The failing ubi_wl_entry must not free()'d again after
> do_sync_erase() returns.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed, thanks!
