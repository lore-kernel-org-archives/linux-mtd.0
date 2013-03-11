Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEyX5-00023V-Al
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 08:56:36 +0000
Message-ID: <1362992249.5101.62.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: katsuki.uwatoko@toshiba.co.jp
Date: Mon, 11 Mar 2013 10:57:29 +0200
In-Reply-To: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: vikram186@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-02-21 at 06:17 +0000, katsuki.uwatoko@toshiba.co.jp wrote:
> This enables support for BENAND, which is an SLC NAND flash solution
> with embedded error correction code (ECC), currently supports only
> 128bytes OOB type.
> 
> In the read sequence, "status read command" is executed to check the
> ECC status after read data. If bitflips occur, these are
> automatically corrected by BENAND and the status indicates the result.
> 
> The write sequence is the same as raw write and the ECC data are
> automatically written to OOB by BENAND.
> 
> Signed-off-by: UWATOKO Katsuki <katsuki.uwatoko@toshiba.co.jp>

Hi Katsuki, thanks for the patch. I would really like to see someone's
ack or Tested-by on it. Anyonwe?

Does Toshiba still produce SLC BENANDs?

-- 
Best Regards,
Artem Bityutskiy
