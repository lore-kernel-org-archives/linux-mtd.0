Received: from antispam01.maxim-ic.com ([205.153.101.182]
 helo=antispam01.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuilV-0006jM-W9
 for linux-mtd@lists.infradead.org; Thu, 04 Jul 2013 12:36:02 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: [Q] Using Micron 4-bit on-die ECC with v2.6.36 kernel?
Date: Thu, 4 Jul 2013 14:35:34 +0200
Message-ID: <2488729.MWQE1XjhTW@laclwks004>
In-Reply-To: <CACwUX0NXgTC=uQ7CZoY=anBuMhfyN31GFuYAV5EhBUZT9Nm2_w@mail.gmail.com>
References: <17588192.75Agdljyqk@laclwks004> <2540574.yn0MEqSsGa@laclwks004>
 <CACwUX0NXgTC=uQ7CZoY=anBuMhfyN31GFuYAV5EhBUZT9Nm2_w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03-July-2013 09:20:47 David Mosberger-Tang wrote:
> I think you're right.  We use UBI which doesn't use oob at all
> (apart from ECC bytes) so we're not worried about errors in the
> OOB-areas that are ECC-protected.

David,

 Ok.  Pedantically, you are using the OOB in one very small
 sense:  The OOB is where the BBT marker and version is kept.
 So UBI does use OOB in, typically, just two (2) blocks.  ;-)

 In our case, whilst _we_ are like you on our reference boards,
 potentially some people may use JFFS2 or YAFFS, so I suspect
 I will include those EEC-checked bytes in the OOB in bit-flip
 counting.

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
