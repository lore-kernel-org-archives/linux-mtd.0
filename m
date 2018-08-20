Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frqhZ-0006P8-IU
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 20:23:03 +0000
From: Richard Weinberger <richard@nod.at>
To: Liu Song <liu.song11@zte.com.cn>
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: Re: [PATCH] mtd/ubi: Make sure to read volume record from LEB 0 or
 LEB 1
Date: Mon, 20 Aug 2018 22:21:46 +0200
Message-ID: <1543610.baP53LZD3X@blindfold>
In-Reply-To: <1534745345-175434-1-git-send-email-liu.song11@zte.com.cn>
References: <1534745345-175434-1-git-send-email-liu.song11@zte.com.cn>
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

Lui Song,

Am Montag, 20. August 2018, 08:09:05 CEST schrieb Liu Song:
> From: fishland <liu.song11@zte.com.cn>

Please use your real name. 1st Signed-off-by and patch author should match.
 
> Even though we protect on-flash data by CRC checksums,
> we still don't trust the media. If lnum is not 0 or 1,
> access exceed array boundary can lead to bad situation.

Good find! I'll queue this for the next fixes-pull-request.

Thanks,
//richard
