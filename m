Received: from 206-248-137-77.dsl.teksavvy.com ([206.248.137.77]
	helo=mail.isoar.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0ieG-0003Rk-5k
	for linux-mtd@lists.infradead.org; Mon, 26 May 2008 19:46:41 +0000
Received: from [10.0.200.99] (vpn02.rossvideo.com [209.5.118.98])
	by mail.isoar.ca (8.14.1/8.13.8) with ESMTP id m4QJikK8001684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2008 15:44:50 -0400
Message-ID: <483B132D.80103@isoar.ca>
Date: Mon, 26 May 2008 15:44:45 -0400
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Problem with Micron 256 MB NAND on 440EPx
References: <48079979.3030201@isoar.ca>
In-Reply-To: <48079979.3030201@isoar.ca>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew E. Mileski wrote:
> I'm looking for some pointers in the right direction with this problem
> I'm having with Micron 256 MB NAND part MT29F2G08AACWP:C with a JFFS2
> filesystem on a AMCC PowerPC 440EPx board using the NDFC driver.
> 
snip
> 
> Write verify error (ECC correction failed) at 0e480000. Wrote:
> 00000000: 19 85 e0 02 00 00 04 44 c0 83 e7 3a 00 00 00 03
> ...
> Read back:
> 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00000040: 19 85 e0 02 00 00 04 44 c0 83 e7 3a 00 00 00 03
> 
> Notice that the data appears to be "offset" by 64 bytes, which just
> happens to be the size of the OOB, but that could be a coincidence.

I've now verified with a logic analyzer that the NFREN strobe is active 
during when NFRDYBSY is low (NAND chip is busy), and latching bogus data 
as a result (the bus has pull-ups so 0xff).

I've verified the pin is connected, and I have seen transitions on it 
through the PPC register.

Any suggestions on what I might be missing still?

Thanks.

-- 
Andrew E. Mileski
