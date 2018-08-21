Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs1Io-0006N5-Ga
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 07:42:12 +0000
From: Richard Weinberger <richard@nod.at>
To: liu.song11@zte.com.cn
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: Re: [PATCH] ubifs: remove unnecessary check in ubifs_log_start_commit
Date: Tue, 21 Aug 2018 09:41:57 +0200
Message-ID: <2441223.E8OYYOjAtB@blindfold>
In-Reply-To: <201808211457448170622@zte.com.cn>
References: <201808211457448170622@zte.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 21. August 2018, 08:57:44 CEST schrieb liu.song11@zte.com.cn:
> Hi Richard,
> 
> In ubifs_log_start_commit, the value of c->lhead_offs is zero or set to zero by code bellow
> 409         /* Switch to the next log LEB */
> 410         if (c->lhead_offs) {
> 411                 c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
> 412                 ubifs_assert(c->lhead_lnum != c->ltail_lnum);
> 413                 c->lhead_offs = 0;
> 414         }
> 
> The value of 'len' can not exceed 'max_len' which assigned value by code bellow
> 370         max_len = UBIFS_CS_NODE_SZ + c->jhead_cnt * UBIFS_REF_NODE_SZ;
> 
> So, the value of c->lhead_offs cannot exceed 'max_len' 
> 429         c->lhead_offs += len;
> 430         if (c->lhead_offs == c->leb_size) {
> 431                 c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
> 432                 c->lhead_offs = 0;
> 433         }
> 
> Usually, the size of PEB is between 64KB and 256KB, and in UBIFS, the value of
> c->lhead_offs far less than UBIFS_BLOCK_SIZE which equal to 4096. So I think
> the value of c->lhead_offs far less than c->leb_size, the check in line 430 seem 
> never to be true.

Okay, now it makes sense.
But what has this do to with UBIFS_BLOCK_SIZE?

Anyway, your patch description needs to be more detailed.
What you explained to me right now needs to go in the commit message.
Then people can understand why the check is not needed.
For the sake of paranoia and debug-ability, please also add a
ubifs_assert(c->lhead_offs < c->leb_size);.

Thanks,
//richard
