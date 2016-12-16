Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHsiu-0000HO-0x
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 13:38:57 +0000
Subject: Re: [PATCH] ubifs: ensure zero err is returned on successful return
To: Colin King <colin.king@canonical.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
References: <20161216133239.21547-1-colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <b8693fc7-b3a1-8a5c-3e6d-d9ea9ee58c62@nod.at>
Date: Fri, 16 Dec 2016 14:38:28 +0100
MIME-Version: 1.0
In-Reply-To: <20161216133239.21547-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16.12.2016 14:32, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> err is no longer being set on a successful return path, causing
> a garbage value being returned. Fix this by setting err to zero
> for the successful return path.
> 
> Found with static analysis by CoverityScan, CID 1389473
> 
> Fixes: 7799953b34d18 ("ubifs: Implement encrypt/decrypt for all IO")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/ubifs/journal.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index a459211..b75f1a6 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1319,6 +1319,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
>  	dn->compr_type = cpu_to_le16(compr_type);
>  	dn->size = cpu_to_le32(*new_len);
>  	*new_len = UBIFS_DATA_NODE_SZ + out_len;
> +	err = 0;
>  out:
>  	kfree(buf);
>  	return err;
> 

Good catch!

Thanks,
//richard
