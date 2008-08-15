Received: from ik-out-1112.google.com ([66.249.90.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTusN-0003Xk-Iz
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 08:41:39 +0000
Received: by ik-out-1112.google.com with SMTP id c21so910524ika.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Aug 2008 01:41:38 -0700 (PDT)
Message-ID: <ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
Date: Fri, 15 Aug 2008 10:41:38 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "Troy Kisky" <troy.kisky@boundarydevices.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
In-Reply-To: <48A48330.70105@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/8/14, Troy Kisky <troy.kisky@boundarydevices.com>:
> frans wrote:
>  > Fixed the last remaining issues, made sure to diff with the very latest mtd
>  > git version.
>  >
>  > Attached is a complete rewrite of nand_ecc.c including documentation.
>  > This rewrite improves performance about 18 times on intel (D920),
>  > 7 times on MIPS and 5 times on ARM (NSLU2)
>  >
>  > Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>
> This look very complex to me. How about something like this.
>  Note, I could make it much smaller if allowed to result in a different
>  ecc value than current implementation.
>

To some extend my code is complex. That is why I also provided
documentation to explain how things work.
Your code is indeed much simpler and smaller, but unfortunately it is
also slower.
I did a quick benchmark test. Your code (on x86) is about three times
as fast as the original code. However it is still about 5 times as
slow as the code I submitted.

Your speedup is mostly caused by going from 8 bit processing in the
original code to 32 bit processing in your code.
I've achieved additional gain by loop unrolling.

Since this code is very often executed in embedded systems that have
nand flash and no hardware ecc correction, I feel the focus on
performance.

Best regards, Frans.
