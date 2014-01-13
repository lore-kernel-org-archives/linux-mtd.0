Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2iYt-0000eI-7k
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 14:32:19 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "richard.genoud@gmail.com" <richard.genoud@gmail.com>
Subject: UBI: calculation for max number of bad-blocks
Date: Mon, 13 Jan 2014 14:31:52 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6120D@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Richard,

With reference to commit message:
	commit ba4087e956d336488c6df9dfca65d1e70cf480f1
	Author:     Richard Genoud <richard.genoud@gmail.com>
	UBI: use the whole MTD device size to get bad_peb_limit
-----------------
" NAND flash manufacturers give a
    minimum number of valid block (NVB) during the endurance life of the
    device, e.g.:

    Parameter             Symbol    Min    Max    Unit      Notes
    --------------------------------------------------------------
    Valid block number     NVB     1004    1024   Blocks     1

    From this number we can deduce the maximum number of bad PEB that a dev=
ice will
    contain during its endurance life: a 128MiB NAND flash (1024 PEB) will =
not have
    less than 20 bad blocks during the flash endurance life.

    But the manufacturer doesn't tell where those bad block will appear. He=
 doesn't
    say either if they will be equally disposed on the whole device (and I'=
m pretty
    sure they won't). So, according to the datasheets, we should reserve th=
e
    maximum number of bad PEB for each UBI device (worst case scenario: 20 =
bad
    blocks appears on the smallest MTD partition).

    So this patch make UBI use the whole MTD device size to calculate the m=
aximum
    bad expected eraseblocks.

    The Kconfig option is in per1024 blocks, thus it can have a default val=
ue of 20
    which is *very* common for NAND devices."
-----------------

I was not able to understand the need to do the convert=20
Min.NVB (Minimum number of valid blocks) into a ratio of  'max_beb_per1024'=
.
Can't we just use " Max(bad-blocks) =3D Max(NVB) - Min(NVB)" ?
And make reserve_PEB > Max(bad-blocks) in UBI partitions, as all bad-blocks
can appear together in same partition itself.

with regards, pekon
