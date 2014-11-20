Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrMd2-0006qK-95
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 07:58:12 +0000
Received: by mail-pd0-f178.google.com with SMTP id g10so373665pdj.23
 for <linux-mtd@lists.infradead.org>; Wed, 19 Nov 2014 23:57:48 -0800 (PST)
Date: Wed, 19 Nov 2014 23:57:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 0/2] mtd: oobtest: Add parameter to ignore bitflip errors
 within specified limit
Message-ID: <20141120075735.GA3212@norris-Latitude-E6410>
References: <1413899608-3911-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413899608-3911-1-git-send-email-rogerq@ti.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, akinobu.mita@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2014 at 04:53:26PM +0300, Roger Quadros wrote:
> Hi,
> 
> The oobtest case uses raw NAND read/writes to OOB area bypassing the error correction
> mechanism

Hmm, I suppose that's the case. I intended for
ecc.{read,write}_oob_raw() vs. ecc.{read,write}_oob() to provide a
distinction, but most drivers use identical implementations for both,
and both are 'raw.' Now that I think about it again, I'm not sure
there's really a good use for an ECC-protected OOB read/write operation.
If you're intending to use ECC, you should be writing data+OOB (i.e.,
nand_do_{read,write}_ops()).

> and hence is bound to be affected by bitflip errors which are normal
> in NAND memories. (e.g. we can never get DRA7-evm's NAND to fully pass
> mtd_oobtest).
> 
> In these patches we add a module parameter "bitflip_limit" to specify how many
> bitflips per page are tolerable. Not specifiing the parameter defaults to old
> behaviour (i.e. zero bitflips tolerated).
> Specifying bitflip_limit=1 makes us pass on DRA7-evm with 0 errors.
> 
> Introduce a new memcmpshow() function that shows the data byte where comparison failed.
> This is useful for debugging. The same function is also used to calculate number of
> bitflip errors over the data block.

It's possible this sort of function could be useful for the other test
modules too. But we can keep it local for now.

Pushed both to l2-mtd.git.

Brian
