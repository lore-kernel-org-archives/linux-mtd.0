Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwWf-0001Ch-Pf
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:50:26 +0000
Message-ID: <1410173401.10764.145.camel@sauron.fi.intel.com>
Subject: Re: ubifs_dump_node must bounds check ubifs_ch->len
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Daniel Mentz <danielmentz@google.com>
Date: Mon, 08 Sep 2014 13:50:01 +0300
In-Reply-To: <CAE2F3rC0Pm+xoJeBmU3Qoq25QoQ2ME1n+SHJHq9R3OA+uDPYPA@mail.gmail.com>
References: <CAE2F3rC0Pm+xoJeBmU3Qoq25QoQ2ME1n+SHJHq9R3OA+uDPYPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-08-28 at 15:37 -0700, Daniel Mentz wrote:
> I believe that ubifs_dump_node() must bounds check ch->len in the
> UBIFS_DATA_NODE case. It currently does not which resulted in a crash
> on a system. See below.
> 
> This is the source code as it stands today:
> 
> int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
> print_hex_dump(KERN_ERR, "\t", DUMP_PREFIX_OFFSET, 32, 1,
>                                (void *)&dn->data, dlen, 0);

Yes, I agree. This is a bug.

The problem is that this function tries to print the node even though it
may be corrupted and the data are garbage.

So we should assume that any field may contain garbage. I see similar
potential problems.

1.

case UBIFS_DENT_NODE:
case UBIFS_XENT_NODE:

nlen < 0 is not verified.

2.

case UBIFS_DATA_NODE:

you reported - dlen is not validated.

Here we could use 'c->ranges' to validate it before using, see
'ubifs_check_node()' for an example.

3.

case UBIFS_IDX_NODE:

fanout is not validated

4.

case UBIFS_ORPH_NODE:

"n" is not validated.


Will I feel lucky asking you whether you was going to send a patch? :-)

Thanks for the report!

-- 
Best Regards,
Artem Bityutskiy
