Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47] helo=penguin.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tpPf-0000vV-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 14:07:39 +0100
Subject: Re: JFFS2_RESERVED_BLOCKS_BASE
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: sriramneelakandan@yahoo.com
Cc: Mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <20020924121649.52716.qmail@web14903.mail.yahoo.com>
References: <20020924121649.52716.qmail@web14903.mail.yahoo.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Sep 2002 15:07:36 +0200
Message-Id: <1032872856.1599.2.camel@spawn>
Mime-Version: 1.0
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

How about dumping the filesytem and storing it directly?
create two partitons and ping pong a tar file between them.

On Tue, 2002-09-24 at 14:16, Sriram Neelakandan Iyer wrote:
> hi,
> 
> I need JFFS2 to store only the configuartion files,
> which are hardly 200K, but JFFS2 reserves 5 blocks
> minimum. (Each block is 64K)
> As of now i am running JFFS2 over 512K mtd partition,
> Which i cannot afford.
> 
> Will JFFS2 work fine with JFFS2_RESERVED_BLOCKS_BASE
> set to 1?
> 
> Or how do i make JFFS2 work with lesser Reserved -
> BLOCKS ? Is there any patch avaiable readily ?
> 
> TIA
> sriram
> 
> 
> __________________________________________________
> Do you Yahoo!?
> New DSL Internet Access from SBC & Yahoo!
> http://sbc.yahoo.com
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se
