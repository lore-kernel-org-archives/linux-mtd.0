Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5CHr-0003w2-MJ
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 09:36:28 +0000
Message-ID: <511A0D18.2030408@parrot.com>
Date: Tue, 12 Feb 2013 10:36:24 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "katsuki.uwatoko@toshiba.co.jp" <katsuki.uwatoko@toshiba.co.jp>
Subject: Re: [PATCH] mtd: nand: support BENAND (Built-in ECC NAND)
References: <F3B6523425E7914AA6214ED358D820AF25D9879D@TGXML316.toshiba.local>
In-Reply-To: <F3B6523425E7914AA6214ED358D820AF25D9879D@TGXML316.toshiba.local>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

katsuki.uwatoko@toshiba.co.jp a écrit :
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

Are you planning to add support to other Toshiba BENAND ?


Matthieu
