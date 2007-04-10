From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Pete MacKay'" <linux@architechnical.net>
References: <10626.69.30.123.186.1176166917.squirrel@architechnical.net>
Subject: RE: OneNAND kernel oops in onenand_write_bufferram
Date: Tue, 10 Apr 2007 11:08:06 +0900
Message-ID: <008001c77b15$17fd89d0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <10626.69.30.123.186.1176166917.squirrel@architechnical.net>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> It turns out the memcpy is trying to access the 16-bit wide 
> bufferram with
> an invalid access width causing a bus error.  Thank you again Kyungmin
> Park for providing the OMAP-specific driver code.  I ported it to the
> pxa270 and the DMA worked fine, prompting me to test PIO mode where it
> failed in the memcpy there.  I remembered you wrote your own memcpy
> (though it wasn't called) in some old u-boot code you pointed 
> me to a few
> weeks back.  Now I know why!
> 
> Thanks very much for your help; this was a critical problem 
> now solved.
> 
> Pete MacKay wrote:
> 
> When trying to copy a jffs2 image to a OneNAND partition using either
> nandwrite or cp I get a kernel oops and nothing is written.
> 

After finishing work, please send the pxa driver.
Now, I don't have pxa board. so I can't test it.
If you send the patch. I will check and commit it.

Is it working with rising trigger?

Thank you,
Kyungmin Park
