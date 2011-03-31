Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5IzF-0003wm-Lq
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 14:36:38 +0000
Received: by eyh6 with SMTP id 6so821217eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 07:36:36 -0700 (PDT)
Subject: Re: JFFS2_WBUF_VERIFY patch clarification (RESENT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sankara Narayanan Balasubramanian <sankara.narayanan@tridentmicro.com>
In-Reply-To: <C7C7E27CD4B28D47A856D6DA52BA5D9E8E5D8260@eu-exh-02.EU.TRID.COM>
References: <C7C7E27CD4B28D47A856D6DA52BA5D9E8E5D8260@eu-exh-02.EU.TRID.COM>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 17:34:14 +0300
Message-ID: <1301582054.2828.95.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Somashekar Umadi <Somashekar.Umadi@tridentmicro.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-23 at 05:40 +0000, Sankara Narayanan Balasubramanian
wrote:
> Hi,
> 
> We are using JFFS2 as part of our linux kernel v2.6.18 in our product.
> We are using JFFS2 file system on top of the MTD Driver for NAND Flash
> (SLC Nand flash). We observe the problem during our long duration file
> write tests (endurance tests) that occasionally the data written
> through the fwrite function call is not present in the flash. 
> 
> We checked the latest kernel sources (2.6.37) and observed a similar
> problem being resolved through the JFFS2_WBUF_VERIFY patch. We took
> only that patch (implementation into our wbuf.c file) and we observe
> that the problem is resolved. We request you to provide the feedback
> for the following.
> 
> 1.	Can this patch be taken as a stand-alone patch into our existing
> JFFS2 as part of linux 2.6.18 release

No, this release is not supported by anyone anymore. I think the oldest
long-term stable kernel is 2.6.27.

> 2.	What is the exact behavior of the patch? We observe that the patch
> ensures that the jffs2_wbuf_recovery is called once more if the first
> attempt to verify fails. How does it ensure that the data is written
> into the flash properly? 

Which patch? Specify commit id or send it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
