Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fluE-0005K8-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 18:00:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10202261939200.608-100000@pinot.profis.ro> 
References: <Pine.LNX.4.10.10202261939200.608-100000@pinot.profis.ro> 
To: Radu Corlan <rcorlan@pcnet.ro>
Cc: linux-mtd@lists.infradead.org
Subject: Re: nftl problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Feb 2002 18:12:08 +0000
Message-ID: <1436.1014747128@redhat.com>
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

rcorlan@pcnet.ro said:
> Before i gave up on nftl, i found the following problem: nftl accesses
> the flash through the read_ecc and write_ecc function pointers in the
> slave mtd_info structure. However, when the slave structure is
> initialised, only the read and write function pointers are filled, not
> the read_ecc and write_ecc; i got kernel panic out of this, which got
> away when i filled the fields. 

I don't recall receiving your patch for this.


--
dwmw2
