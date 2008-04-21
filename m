Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JnpgM-0002Vf-8f
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 06:39:18 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1295927wff.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Apr 2008 23:39:15 -0700 (PDT)
Message-ID: <60e9ed290804202339v14b04468hafdbc9e088bee4fe@mail.gmail.com>
Date: Mon, 21 Apr 2008 12:09:15 +0530
From: "Abhijit Singh" <mail2abhijit@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: inconsistent behaviour with onenand with 2.6.24 kernel
In-Reply-To: <48084B80.2050601@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <60e9ed290804170851y17cd9ea8nbb2531275eb899fb@mail.gmail.com>
	<48084B80.2050601@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

On Fri, Apr 18, 2008 at 12:49 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> Abhijit Singh wrote:
> > I am facing some problem with onenand with the kernel 2.6.24.
> >
>
> Yes it is broken.
>
> Here is a list on OneNAND patches in 2.6.25
>
> 69d79186dc48ca22a0ce69511bef8ef6c2465ada [MTD] [OneNAND] Use pre-alloced oob
> buffer instead of local buffer
> 978cb38a296fceac82a8a757f6387d7ef2a21ac6 [MTD] [OneNAND] Use the u_char
> instead of char in oobbuf
> b2581be291aa8595eadf3d6933d04d0f1d01b46d [MTD] [OneNAND] Check the initial
> bad block using ONENAND_CTRL_ERROR
> e71f04fc9234b14636887ceb5862755f1690642c [MTD] [OneNAND] Get correct density
> from device ID
> b21b72cf33bb212414c1d967850e261b795befa4 [MTD] [OneNAND] Consolidate OneNAND
> operation order
> 9d2f0b7a3de28d06ba4011b835b9a7e772553f0d [MTD] [OneNAND] fix call to
> onenand_verify when writing subpages
> d0b36d8cc8f345ec5faadd15daaecfb409b94523 [MTD] [OneNAND] Do not release chip
> twice
>
> The last one "[MTD] [OneNAND] Do not release chip twice" is absolutely
> essential, so here it is:

I have tried all the above mentioned patches. But the status is same.
behaviour is inconsistent.
It still leads to system hangs while writing big files. Any other pointers ?
But it is working fine on 2.6.20 kernel.


Abhijit
