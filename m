Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCtah-00068z-Jh
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 15:15:44 +0000
Message-ID: <1362496578.21850.1.camel@sauron>
Subject: Re: Diskonchip regression
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Tue, 05 Mar 2013 17:16:18 +0200
In-Reply-To: <1362389632.763807690@f177.mail.ru>
References: <1362389632.763807690@f177.mail.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 13:33 +0400, Alexander Shiyan wrote:
> Hello All.
> 
> I want to inform about diskonchip regression.
> Mounting diskonchip partition now failed due "mtd: nand: kill NAND_NO_READRDY" commit.

Which diskonchip is that? I was thinking about submitting an RFC about
killing all diskonchip stuff except of doc3g and docg4.

-- 
Best Regards,
Artem Bityutskiy
