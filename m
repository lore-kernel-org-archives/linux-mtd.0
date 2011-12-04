Received: from bitbox.plus.com ([81.174.226.42] helo=bitbox.co.uk)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RX7fB-00014J-P3
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 08:43:10 +0000
Received: from [127.0.0.1] (portcullis.localnet [172.16.1.1])
 by numbat.localnet (Postfix) with ESMTP id C443529C7E7
 for <linux-mtd@lists.infradead.org>; Sun,  4 Dec 2011 08:43:01 +0000 (GMT)
Message-ID: <4EDB3295.6040201@bitbox.co.uk>
Date: Sun, 04 Dec 2011 08:43:01 +0000
From: Peter Horton <phorton@bitbox.co.uk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/12/2011 20:20, Mike Dunn wrote:
>
> This patch proposes a change to the mtd API for the purpose of returning to
> the caller information on the number of bit errors corrected by the ecc
> facilities of the device during read operations.  The affected functions are
> read() and read_oob().
>

Do the number of bit-flips mean anything to the higher layers like UBI? 
As the ECC strength / error rate are a chip dependent thing how do the 
higher layers know what is good/normal/bad?

P.
