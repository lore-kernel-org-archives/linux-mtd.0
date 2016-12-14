Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH5Wg-000060-Sa
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 09:07:04 +0000
Subject: Re: [PATCH] mtd-utils: Correct casting for final status report in
 flashcp
To: Jonathan Fether <jonf@mds.com>, linux-mtd@lists.infradead.org
References: <1481680828-10452-1-git-send-email-jonf@mds.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <bbc437cd-61cf-f6b1-4f3d-d85877371006@sigma-star.at>
Date: Wed, 14 Dec 2016 10:05:26 +0100
MIME-Version: 1.0
In-Reply-To: <1481680828-10452-1-git-send-email-jonf@mds.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/14/2016 03:00 AM, Jonathan Fether wrote:
> Add correct casting for filestat.st_size in flashcp.c. While the
> interim status updates had correct casting from commit 08b243, the
> final update was not.
> 
> Signed-off-by: Jonathan Fether <jonf@mds.com>
> ---
>  misc-utils/flashcp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to mtd-utils.git.


Thanks,

David
