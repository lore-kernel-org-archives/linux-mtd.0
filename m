Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXCUf-0002a3-IK
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 13:52:38 +0000
Message-ID: <4EDB7B1D.60603@newsguy.com>
Date: Sun, 04 Dec 2011 05:52:29 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Peter Horton <phorton@bitbox.co.uk>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk>
In-Reply-To: <4EDB3295.6040201@bitbox.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
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

On 12/04/2011 12:43 AM, Peter Horton wrote:
> On 03/12/2011 20:20, Mike Dunn wrote:
>>
>> This patch proposes a change to the mtd API for the purpose of returning to
>> the caller information on the number of bit errors corrected by the ecc
>> facilities of the device during read operations.  The affected functions are
>> read() and read_oob().
>>
>
> Do the number of bit-flips mean anything to the higher layers like UBI? 


The change was motivated primarily by the desire to get ubifs working well on
nand flash.  Currently it works well only on onenand devices where single
bitflips are rare and random.  On nand with frequent and consistent bitflips,
ubi marks a large portion of the blocks as "bad".


> As the ECC strength / error rate are a chip dependent thing how do the higher
> layers know what is good/normal/bad?


Good point.  To be determined.  Probably just another element in the mtd_info
struct named ecc_strength or some such.  UBI e.g., can determine a suitable
"scrublevel" based on that.

Thanks,
Mike
