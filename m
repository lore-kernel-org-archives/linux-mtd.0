Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15kOJo-0004Qp-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2001 12:18:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AEECKHHDHJAAFPKILIGNGEILCAAA.shkim@fdma.snu.ac.kr> 
References: <AEECKHHDHJAAFPKILIGNGEILCAAA.shkim@fdma.snu.ac.kr> 
To: "Kim, Sanghun" <shkim@fdma.snu.ac.kr>
Cc: linux-mtd@lists.infradead.org, sjhill@cotw.com
Subject: Re: NAND Flash Hardware configuration? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Sep 2001 12:26:35 +0100
Message-ID: <7946.1001071595@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

shkim@fdma.snu.ac.kr said:
>  According to Mr. Woodhose's message, I must make code like "spia.c".
> is it?

Yes, that's right.

> And, Could I see "spia board schematic"..?? , or where is it?, or
> specific information? I want to use it for our "reference"

I don't know if the spia documentation is public, but you shouldn't need it 
- I meant that you should refer to the spia.c code for an example of how to 
interface with the generic NAND code.
 

--
dwmw2
